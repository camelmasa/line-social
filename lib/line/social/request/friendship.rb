module Line
  module Social
    module Request
      class Friendship < Base
        API_URI = URI.parse("https://api.line.me/friendship/v1")

        def initialize(access_token)
          @access_token = access_token
        end

        def get
          response = http_client.get do |request|
            request.url "#{API_URI}/status"
            request.headers["Authorization"] =  "Bearer #{@access_token}"
          end

          if response.body["error"]
            raise Line::Social::Error.new(response.body["error_description"])
          end

          Line::Social::Friendship.new(response.body)
        end
      end
    end
  end
end
