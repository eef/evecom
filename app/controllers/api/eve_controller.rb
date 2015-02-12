class Api::EveController < ApplicationController

  respond_to :json

  before_action :authenticate_user!

  def characters
    api = ActionEve::API.new(id: params[:eve][:key_id], vcode: params[:eve][:verification_code])
    api_user = api.users.first
    characters = []
    api_user.characters.each do |character|
      unless Character.exists?(character_id: character.id)
        characters << {
            id: character.id,
            name: character.character_name,
            corporation_name: character.corporation_name
        }
      end
    end
    render json: characters
  end

  def add_characters
    
  end


  def api_params
    params.require(:eve).permit(:key_id, :verification_code)
  end

end
