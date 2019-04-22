module Line
  module Social
    class Error < StandardError; end
    class BadRequestError < Error; end
    class UnauthorizedError < Error; end
    class ForbiddenError < Error; end
    class TooManyRequestsError < Error; end
    class InternalServerError < Error; end
  end
end
