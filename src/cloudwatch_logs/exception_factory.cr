private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  class AccessDeniedException < Core::ResponseException
  end

  class ConflictException < Core::ResponseException
  end

  class DataAlreadyAcceptedException < Core::ResponseException
  end

  class InternalServerException < Core::ResponseException
  end

  class InvalidOperationException < Core::ResponseException
  end

  class InvalidParameterException < Core::ResponseException
  end

  class InvalidSequenceTokenException < Core::ResponseException
  end

  class LimitExceededException < Core::ResponseException
  end

  class MalformedQueryException < Core::ResponseException
  end

  class OperationAbortedException < Core::ResponseException
  end

  class ResourceAlreadyExistsException < Core::ResponseException
  end

  class ResourceNotFoundException < Core::ResponseException
  end

  class ServiceQuotaExceededException < Core::ResponseException
  end

  class ServiceUnavailableException < Core::ResponseException
  end

  class ThrottlingException < Core::ResponseException
  end

  class TooManyTagsException < Core::ResponseException
  end

  class UnrecognizedClientException < Core::ResponseException
  end

  class ValidationException < Core::ResponseException
  end

  class ExceptionFactory < Core::ResponseExceptionFactory
    def create(exception_type, http, message, code) : Core::ResponseException | Nil
      case exception_type
      when "AccessDeniedException"          then AccessDeniedException.new(http, message, code)
      when "ConflictException"              then ConflictException.new(http, message, code)
      when "DataAlreadyAcceptedException"   then DataAlreadyAcceptedException.new(http, message, code)
      when "InternalServerException"        then InternalServerException.new(http, message, code)
      when "InvalidOperationException"      then InvalidOperationException.new(http, message, code)
      when "InvalidParameterException"      then InvalidParameterException.new(http, message, code)
      when "InvalidSequenceTokenException"  then InvalidSequenceTokenException.new(http, message, code)
      when "LimitExceededException"         then LimitExceededException.new(http, message, code)
      when "MalformedQueryException"        then MalformedQueryException.new(http, message, code)
      when "OperationAbortedException"      then OperationAbortedException.new(http, message, code)
      when "ResourceAlreadyExistsException" then ResourceAlreadyExistsException.new(http, message, code)
      when "ResourceNotFoundException"      then ResourceNotFoundException.new(http, message, code)
      when "ServiceQuotaExceededException"  then ServiceQuotaExceededException.new(http, message, code)
      when "ServiceUnavailableException"    then ServiceUnavailableException.new(http, message, code)
      when "ThrottlingException"            then ThrottlingException.new(http, message, code)
      when "TooManyTagsException"           then TooManyTagsException.new(http, message, code)
      when "UnrecognizedClientException"    then UnrecognizedClientException.new(http, message, code)
      when "ValidationException"            then ValidationException.new(http, message, code)
      end
    end
  end
end
