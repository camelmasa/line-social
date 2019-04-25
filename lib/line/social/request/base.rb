# frozen_string_literal: true

module Line
  module Social
    module Request
      class Base
        def http_client(method, &block)
          client =
            Faraday.new do |connection|
              connection.response :json, content_type: /\bjson$/
              connection.response :raise_error
              connection.adapter Faraday.default_adapter
            end

          client.run_request(method, nil, nil, nil, &block)
        rescue Faraday::Error::ClientError => e
          error_message = JSON.parse(e.response[:body])['message']

          case e.response[:status]
          when 400
            raise Line::Social::BadRequestError.new(error_message)
          when 401
            raise Line::Social::UnauthorizedError.new(error_message)
          when 403
            raise Line::Social::ForbiddenError.new(error_message)
          when 429
            raise Line::Social::TooManyRequestsError.new(error_message)
          when 500
            raise Line::Social::InternalServerError.new(error_message)
          end
        end

        # Will be uncommented below after releasing Faraday 1.0
        # rescue Faraday::BadRequestError => e
        #   raise Line::Social::BadRequestError.new(error_message)
        # rescue Faraday::UnauthorizedError => e
        #   raise Line::Social::UnauthorizedError.new(error_message)
        # rescue Faraday::ForbiddenError => e
        #   raise Line::Social::ForbiddenError.new(error_message)
        # rescue Faraday::ClientError => e
        #   raise Line::Social::TooManyRequestsError.new(error_message)
        # rescue Faraday::ServerError => e
        #   raise Line::Social::InternalServerError.new(error_message)
        # end
      end
    end
  end
end
