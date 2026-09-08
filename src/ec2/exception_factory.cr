private alias Core = Amazonite::Core

module Amazonite::EC2
  class ExceptionFactory < Core::QueryResponseExceptionFactory
    def create(exception_type, http, message, code) : Core::ResponseException | Nil
      # this service models no errors of its own, so every failure falls
      # back to the generic Core::ResponseException the factory builds
      nil
    end
  end
end
