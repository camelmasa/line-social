module Line
  module Social
    class Client
      API_URI = URI.parse("https://api.line.me/oauth2/v2.1")

      attr_reader :access_token

      def initialize(access_token)
        @access_token = access_token
      end

      def oauth
        Request::Oauth.new(self)
      end

      def profile
        Request::Profile.new(self)
      end

      def request_path
        Client::API_URI.path
      end

      def request
        @request ||= Faraday.new(url: "#{API_URI.scheme}://#{API_URI.host}") do |connection|
          connection.response :json, content_type: /\bjson$/
          connection.adapter Faraday.default_adapter
        end
      end
    end
  end
end
