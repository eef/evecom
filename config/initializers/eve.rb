require 'omniauth-oauth'

module OmniAuth
  module Strategies
    class Eve < OmniAuth::Strategies::OAuth
      # Give your strategy a name.
      option :name, "eve"

      args [:client_id, :secret]

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options, {
                                :site => ' https://login.eveonline.com',
                                :authorize_url => " https://login.eveonline.com/oauth/authorize",
                                :token_url => 'https://login.eveonline.com/oauth/token'
                            }

      option :authorize_params, {
        client_id: "2688649517814a0695138c105a0668b8",
        scope: "",
        state: "uniquestate123",
        response_type: "code"
      }



      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.
      # uid{ request.params['user_id'] }
      #
      # info do
      #   {
      #       :name => raw_info['name'],
      #       :location => raw_info['city']
      #   }
      # end
      #
      # extra do
      #   {
      # end
      # 'raw_info' => raw_info
      # }

      def raw_info
        @raw_info ||= MultiJson.decode(access_token.get('/me.json')).body
      end
    end
  end
end