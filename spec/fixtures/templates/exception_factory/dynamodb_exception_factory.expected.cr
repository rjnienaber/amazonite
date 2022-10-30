private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  class InternalServerError < Core::ResponseException
  end

  class LimitExceededException < Core::ResponseException
  end

  class ResourceInUseException < Core::ResponseException
  end

  class ExceptionFactory < Core::ResponseExceptionFactory
    def create(exception_type, http, message, code) : Core::ResponseException | Nil
      case exception_type
      when "InternalServerError"    then InternalServerError.new(http, message, code)
      when "LimitExceededException" then LimitExceededException.new(http, message, code)
      when "ResourceInUseException" then ResourceInUseException.new(http, message, code)
      end
    end
  end
end
