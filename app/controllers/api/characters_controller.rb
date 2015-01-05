class Api::CharactersController < ApplicationController
  before_action :set_api_character, only: [:show, :edit, :update, :destroy]

  # GET /api/characters
  # GET /api/characters.json
  def index
    @api_characters = Api::Character.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @api_characters }
    end
  end

  # GET /api/characters/1
  # GET /api/characters/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @api_character }
    end
  end

  # GET /api/characters/new
  def new
    @api_character = Api::Character.new
  end

  # GET /api/characters/1/edit
  def edit
  end

  # POST /api/characters
  # POST /api/characters.json
  def create
    @api_character = Api::Character.new(api_character_params)

    respond_to do |format|
      if @api_character.save
        format.html { redirect_to @api_character, notice: 'Character was successfully created.' }
        format.json { render json: @api_character, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @api_character.errors, status: :unprocessable_entity }
      end
    end
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
    def api_character_params
      params[:api_character]
    end
end
