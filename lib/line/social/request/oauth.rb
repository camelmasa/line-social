module Line
  module Social
    module Request
      class Oauth < Base
        API_URI = URI.parse("https://api.line.me/oauth2/v2.1")

        def issue(code:, redirect_uri:, client_id:, client_secret:)
          response = http_client.post do |request|
            request.url "#{API_URI}/token"
            request.headers['Content-Type'] = 'application/x-www-form-urlencoded'
            request.body = {
              client_id: client_id,
              client_secret: client_secret,
              code: code,
              grant_type: "authorization_code",
              redirect_uri: redirect_uri,
            }
          end

          if response.body["error"]
            raise Line::Social::Error.new(response.body["error_description"])
          end

          Line::Social::Oauth.new(response.body)
        end

        def verify(access_token)
          response = http_client.get("#{API_URI}/verify", access_token: access_token)

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
