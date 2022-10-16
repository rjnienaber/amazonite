private alias AC = Amazonite::Core

module Amazonite::DynamoDBv2
  class InternalServerError < AC::ResponseException
  end

  class LimitExceededException < AC::ResponseException
  end

  class ResourceInUseException < AC::ResponseException
  end

  class ExceptionFactory
    include AC::ResponseExceptionFactory

    def create_exception(error_type, http, message) : AC::ResponseException | Nil
      case error_type
      when "InternalServerError"    then InternalServerError.new(http, message)
      when "LimitExceededException" then LimitExceededException.new(http, message)
      when "ResourceInUseException" then ResourceInUseException.new(http, message)
      end
    end
  end
end
