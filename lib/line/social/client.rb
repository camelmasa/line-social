module Line
  module Social
    class Client
      def friendship
        Request::Friendship.new
      end

      def oauth
        Request::Oauth.new
      end

      def profile
        Request::Profile.new
      end
    end
  end
end
