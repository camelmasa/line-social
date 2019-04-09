module Line
  module Social
    module Request
      class Base
        def request
          Faraday.new do |connection|
            connection.response :json, content_type: /\bjson$/
            connection.adapter Faraday.default_adapter
          end
        end
      end
    end
  end
end
