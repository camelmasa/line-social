module Line
  module Social
    module Request
      class Oauth < Base
        API_URI = URI.parse('https://api.line.me/oauth2/v2.1')

        def initialize(client_id:, client_secret:)
          @client_id = client_id
          @client_secret = client_secret
        end

        def issue(code:, redirect_uri:)
          response =
            http_client(:post) do |request|
              request.url "#{API_URI}/token"
              request.headers['Content-Type'] =
                'application/x-www-form-urlencoded'
              request.body =
                URI.encode_www_form(
                  client_id: @client_id,
                  client_secret: @client_secret,
                  code: code,
                  grant_type: 'authorization_code',
                  redirect_uri: redirect_uri
                )
            end

          Line::Social::Oauth.new(
            response.body.merge(
              client_id: @client_id, client_secret: @client_secret
            )
          )
        end

        def verify(access_token)
          response =
            http_client(:get) do |request|
              request.url "#{API_URI}/verify"
              request.params['access_token'] = access_token
            end

          Line::Social::Oauth.new(
            response.body.merge(
              client_id: @client_id, client_secret: @client_secret
            )
          )
        end

        def refresh(refresh_token)
          response =
            http_client(:post) do |request|
              request.url "#{API_URI}/token"
              request.headers['Content-Type'] =
                'application/x-www-form-urlencoded'
              request.body =
                URI.encode_www_form(
                  client_id: @client_id,
                  client_secret: @client_secret,
                  grant_type: 'refresh_token',
                  refresh_token: refresh_token
                )
            end

          Line::Social::Oauth.new(
            response.body.merge(
              client_id: @client_id, client_secret: @client_secret
            )
          )
        end

        def revoke(access_token)
          response =
            http_client(:post) do |request|
              request.url "#{API_URI}/revoke"
              request.headers['Content-Type'] =
                'application/x-www-form-urlencoded'
              request.body =
                URI.encode_www_form(
                  access_token: access_token,
                  client_id: @client_id,
                  client_secret: @client_secret
                )
            end

          response.status == 200
        end
      end
    end
  end
end
