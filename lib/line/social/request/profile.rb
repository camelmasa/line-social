module Line
  module Social
    module Request
      class Profile
        def initialize(client)
          @client = client
        end

        def get
          response = @client.request.get do |request|
            request.url "#{@client.request_path}/profile"
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
