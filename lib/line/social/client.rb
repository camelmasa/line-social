module Line
  module Social
    class Client
      def initialize(access_token)
        @access_token = access_token
      end

      def friendship
        Request::Friendship.new(@access_token)
      end

      def oauth
        Request::Oauth.new(@access_token)
      end

      def profile
        Request::Profile.new(@access_token)
      end
    end
  end
end
