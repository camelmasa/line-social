module Line
  module Social
    module Request
      class Profile
        API_URI = URI.parse("https://api.line.me/v2")

        def initialize(access_token)
          @access_token = access_token
        end

        def get
          response = request.get do |request|
            request.url "#{API_URI.path}/profile"
            request.headers["Authorization"] =  "Bearer #{@access_token}"
          end

          if response.body["error"]
            raise Line::Social::Error.new(response.body["error_description"])
          else
            Line::Social::Profile.new(response.body)
          end
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
end
