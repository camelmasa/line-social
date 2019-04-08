module Line
  module Social
    module Request
      class Base
        def request
          Faraday.new(url: url) do |connection|
            connection.response :json, content_type: /\bjson$/
            connection.adapter Faraday.default_adapter
          end
        end
      end
    end
  end
end
