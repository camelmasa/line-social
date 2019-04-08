module Line
  module Social
    class Oauth
      include Virtus.model(strict: true)

      attribute :scope, String
      attribute :client_id, String
      attribute :expires_in, String
    end
  end
end
