# frozen_string_literal: true

module Line
  module Social
    class Friendship
      include Virtus.model(strict: true)

      attribute :friendFlag, Boolean
    end
  end
end
