module Line
  module Social
    module Request
      class Oauth < Base
        API_URI = URI.parse("https://api.line.me/oauth2/v2.1")

        def initialize(access_token)
          @access_token = access_token
        end

        def issue
          raise Line::Social::NotImplementedError
        end

        def verify
          response = http_client.get("#{API_URI}/verify", access_token: @access_token)

          if response.body["error"]
            raise Line::Social::Error.new(response.body["error_description"])
          end

          Line::Social::Oauth.new(response.body)
        end

        def refresh
          raise Line::Social::NotImplementedError
        end

        def revoke
          raise Line::Social::NotImplementedError
        end
      end
    end
  end
end
