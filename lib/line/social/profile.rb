module Line
  module Social
    class Profile
      include Virtus.model(strict: true)

      attribute :userId, String
      attribute :displayName, String
      attribute :pictureUrl, String, required: false
      attribute :statusMessage, String, required: false
    end
  end
end
