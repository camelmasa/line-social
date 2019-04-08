module Line
  module Social
    module Request
      class Friendship < Base
        def initialize(access_token)
          @access_token = access_token
        end

        def get
          raise Line::Social::NotImplementedError
        end

        private

        def url
          "#{API_URI.scheme}://#{API_URI.host}"
        end
      end
    end
  end
end
