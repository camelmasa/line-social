module Line
  module Social
    class Client
      API_URI = URI.parse("https://api.line.me/oauth2/v2.1")

      attr_reader :access_token

      def initialize(access_token)
        @access_token = access_token
      end

      def oauth
        Request::Oauth.new(@access_token)
      end

      def profile
        Request::Profile.new(@access_token)
      end
    end
  end
end
