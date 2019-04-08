module Line
  module Social
    module Request
      class Oauth
        def initialize(client)
          @client = client
        end

        def issue
          raise Line::Social::NotImplementedError
        end

        def verify
          response = @client.request.get("#{@client.request_path}/verify", access_token: @client.access_token)

          if response.body["error"]
            raise Line::Social::Error.new(response.body["error_description"])
          else
            Line::Social::Oauth.new(response.body)
          end
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
