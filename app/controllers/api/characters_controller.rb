class Api::CharactersController < ApplicationController

  respond_to :json

  # GET /api/characters
  # GET /api/characters.json
  def index
    characters = current_user.characters.collect {|character| JSON::parse(character.to_json).merge(skill_queue: character.skill_queue) }
    render json: characters.to_json
  end

  # GET /api/characters/1
  # GET /api/characters/1.json
  def show
    @character = Character.find(params[:id])
    render json: (JSON::parse(@character.to_json).merge({skills: @character.skills_by_group, attrs: @character.attribute_points}))
  end

  # GET /api/characters/new
  def new
    @api_character = Api::Character.new
  end

  # GET /api/characters/1/edit
  def edit
  end

  def active
    if current_user.characters.blank?
      character = nil
    else
      character = current_user.characters.active_character.active_attributes.to_json
    end
    render json: character
  end

  def activate
    character = current_user.characters.find(params[:id])

    render json: {name: character.character_name, success: character.activate}
  end

  # POST /api/characters
  # POST /api/characters.json
  def create
    if current_user.characters.where(:character_id => params[:eve][:character_id]).any?
      redirect_to(:back, :notice => "Cannot readd character.") and return
    end
    begin
      api = ActionEve::API.new(id: params[:eve][:key_id], vcode: params[:eve][:verification_code])
      user = api.users.first
      api_char = user.find_character(params[:eve][:character_id].to_i)
      infos = api_char.info
      infos.delete(:id)
      @key_info = user.api_key_info
      @character = current_user.characters.build(infos)
      @character.bitmask = @key_info[:bitmask]
      @character.key_expires = @key_info[:expires]
      @character.save
      @character.activate
    rescue ActionEve::Exceptions::BaseException
      @exception_message = $!
    end
    render json: @character.to_json
  end

  # PATCH/PUT /api/characters/1
  # PATCH/PUT /api/characters/1.json
  def update
    respond_to do |format|
      if @api_character.update(api_character_params)
        format.html { redirect_to @api_character, notice: 'Character was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @api_character.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/characters/1
  # DELETE /api/characters/1.json
  def destroy
    @api_character.destroy
    respond_to do |format|
      format.html { redirect_to api_characters_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_character
      @api_character = Api::Character.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
  def api_params
    puts params
    params.require(:eve).permit(:character_id)
  end
end
