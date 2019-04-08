module Line
  module Social
    module Request
      class Oauth
        API_URI = URI.parse("https://api.line.me/oauth2/v2.1")

        def initialize(access_token)
          @access_token = access_token
        end

        def issue
          raise Line::Social::NotImplementedError
        end

        def verify
          response = request.get("#{API_URI.path}/verify", access_token: @access_token)

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
