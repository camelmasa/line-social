# frozen_string_literal: true

module Line
  module Social
    class Client
      def friendship
        Request::Friendship.new
      end

      def oauth(client_id:, client_secret:)
        Request::Oauth.new(client_id: client_id, client_secret: client_secret)
      end

      def profile
        Request::Profile.new
      end
    end
  end
end
