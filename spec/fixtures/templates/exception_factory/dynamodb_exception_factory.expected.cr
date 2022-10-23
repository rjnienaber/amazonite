private alias AC = Amazonite::Core

module Amazonite::DynamoDBv2
  class InternalServerError < AC::ResponseException
  end

  class LimitExceededException < AC::ResponseException
  end

  class ResourceInUseException < AC::ResponseException
  end

  class ExceptionFactory < AC::ResponseExceptionFactory
    def create(exception_type, http, message, code) : AC::ResponseException | Nil
      case exception_type
      when "InternalServerError"    then InternalServerError.new(http, message, code)
      when "LimitExceededException" then LimitExceededException.new(http, message, code)
      when "ResourceInUseException" then ResourceInUseException.new(http, message, code)
      end
    end
  end
end
