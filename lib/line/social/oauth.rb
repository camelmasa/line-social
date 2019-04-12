module Line
  module Social
    class Oauth
      include Virtus.model(strict: true)

      attribute :access_token,  String, required: false
      attribute :client_id,     String
      attribute :client_secret, String
      attribute :expires_in,    Integer
      attribute :id_token,      String, required: false
      attribute :refresh_token, String, required: false
      attribute :scope,         String
      attribute :token_type,    String, required: false

      def verify!
        oauth = client.verify(access_token)
        self.expires_in = oauth.expires_in
        self
      end

      def refresh!
        oauth = client.refresh(refresh_token)
        self.access_token = oauth.access_token
        self.expires_in = oauth.expires_in
        self.id_token = oauth.id_token
        self.refresh_token = oauth.refresh_token
        self
      end

      def revoke!
        client.revoke(access_token)
        self
      end

      private

      def client
        Request::Oauth.new(client_id: client_id, client_secret: client_secret)
      end
    end
  end
end
