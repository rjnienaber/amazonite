module Amazonite
  module DynamoDB
    class InternalServerError < Amazonite::Core::ResponseException
    end

    class LimitExceededException < Amazonite::Core::ResponseException
    end

    class ResourceInUseException < Amazonite::Core::ResponseException
    end

    class ExceptionFactory
      include Amazonite::Core::ResponseExceptionFactory

      def create_exception(error_type, http, message) : Amazonite::Core::ResponseException | Nil
        case error_type
        when "InternalServerError"    then InternalServerError.new(http, message)
        when "LimitExceededException" then LimitExceededException.new(http, message)
        when "ResourceInUseException" then ResourceInUseException.new(http, message)
        end
      end
    end
  end
end
