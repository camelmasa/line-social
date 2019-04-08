module Line
  module Social
    module Request
      class Friendship
        def initialize(client)
          @client = client
        end

        def get
          raise Line::Social::NotImplementedError
        end
      end
    end
  end
end
