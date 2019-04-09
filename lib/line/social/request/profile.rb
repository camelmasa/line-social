module Line
  module Social
    module Request
      class Profile < Base
        API_URI = URI.parse("https://api.line.me/v2")

        def initialize(access_token)
          @access_token = access_token
        end

        def get
          response = request.get do |request|
            request.url "#{API_URI}/profile"
            request.headers["Authorization"] =  "Bearer #{@access_token}"
          end

          if response.body["error"]
            raise Line::Social::Error.new(response.body["error_description"])
          else
            Line::Social::Profile.new(response.body)
          end
        end
      end
    end
  end
end
