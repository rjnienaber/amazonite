private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  class ConcurrentModificationException < Core::ResponseException
  end

  class ConflictException < Core::ResponseException
  end

  class DashboardInvalidInputError < Core::ResponseException
  end

  class DashboardNotFoundError < Core::ResponseException
  end

  class InternalServiceFault < Core::ResponseException
  end

  class InvalidFormatFault < Core::ResponseException
  end

  class InvalidNextToken < Core::ResponseException
  end

  class InvalidParameterCombinationException < Core::ResponseException
  end

  class InvalidParameterValueException < Core::ResponseException
  end

  class KmsAccessDeniedException < Core::ResponseException
  end

  class KmsKeyDisabledException < Core::ResponseException
  end

  class KmsKeyNotFoundException < Core::ResponseException
  end

  class LimitExceededException < Core::ResponseException
  end

  class LimitExceededFault < Core::ResponseException
  end

  class MissingRequiredParameterException < Core::ResponseException
  end

  class ResourceConflict < Core::ResponseException
  end

  class ResourceNotFound < Core::ResponseException
  end

  class ResourceNotFoundException < Core::ResponseException
  end

  class ExceptionFactory < Core::ResponseExceptionFactory
    def create(exception_type, http, message, code) : Core::ResponseException | Nil
      case exception_type
      when "ConcurrentModificationException"      then ConcurrentModificationException.new(http, message, code)
      when "ConflictException"                    then ConflictException.new(http, message, code)
      when "DashboardInvalidInputError"           then DashboardInvalidInputError.new(http, message, code)
      when "DashboardNotFoundError"               then DashboardNotFoundError.new(http, message, code)
      when "InternalServiceFault"                 then InternalServiceFault.new(http, message, code)
      when "InvalidFormatFault"                   then InvalidFormatFault.new(http, message, code)
      when "InvalidNextToken"                     then InvalidNextToken.new(http, message, code)
      when "InvalidParameterCombinationException" then InvalidParameterCombinationException.new(http, message, code)
      when "InvalidParameterValueException"       then InvalidParameterValueException.new(http, message, code)
      when "KmsAccessDeniedException"             then KmsAccessDeniedException.new(http, message, code)
      when "KmsKeyDisabledException"              then KmsKeyDisabledException.new(http, message, code)
      when "KmsKeyNotFoundException"              then KmsKeyNotFoundException.new(http, message, code)
      when "LimitExceededException"               then LimitExceededException.new(http, message, code)
      when "LimitExceededFault"                   then LimitExceededFault.new(http, message, code)
      when "MissingRequiredParameterException"    then MissingRequiredParameterException.new(http, message, code)
      when "ResourceConflict"                     then ResourceConflict.new(http, message, code)
      when "ResourceNotFound"                     then ResourceNotFound.new(http, message, code)
      when "ResourceNotFoundException"            then ResourceNotFoundException.new(http, message, code)
      end
    end
  end
end
