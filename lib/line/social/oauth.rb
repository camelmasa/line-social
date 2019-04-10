module Line
  module Social
    class Oauth
      include Virtus.model(strict: true)

      attribute :access_token,  String, required: false
      attribute :client_id,     String, required: false
      attribute :expires_in,    Integer
      attribute :id_token,      String, required: false
      attribute :refresh_token, String, required: false
      attribute :scope,         String
      attribute :token_type,    String, required: false
    end
  end
end
