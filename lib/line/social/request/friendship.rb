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
      end
    end
  end
end
