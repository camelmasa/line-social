module Line
  module Social
    class Profile
      include Virtus.model(strict: true)

      attribute :userId, String
      attribute :displayName, String
      attribute :pictureUrl, String
      attribute :statusMessage, String
    end
  end
end
