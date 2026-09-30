private alias Core = Amazonite::Core

module Amazonite::Kinesis
  class AccessDeniedException < Core::ResponseException
  end

  class DryRunOperationException < Core::ResponseException
  end

  class ExpiredIteratorException < Core::ResponseException
  end

  class ExpiredNextTokenException < Core::ResponseException
  end

  class InternalFailureException < Core::ResponseException
  end

  class InvalidArgumentException < Core::ResponseException
  end

  class KMSAccessDeniedException < Core::ResponseException
  end

  class KMSDisabledException < Core::ResponseException
  end

  class KMSInvalidStateException < Core::ResponseException
  end

  class KMSNotFoundException < Core::ResponseException
  end

  class KMSOptInRequired < Core::ResponseException
  end

  class KMSThrottlingException < Core::ResponseException
  end

  class LimitExceededException < Core::ResponseException
  end

  class ProvisionedThroughputExceededException < Core::ResponseException
  end

  class ResourceInUseException < Core::ResponseException
  end

  class ResourceNotFoundException < Core::ResponseException
  end

  class ValidationException < Core::ResponseException
  end

  class ExceptionFactory < Core::ResponseExceptionFactory
    def create(exception_type, http, message, code) : Core::ResponseException | Nil
      case exception_type
      when "AccessDeniedException"                  then AccessDeniedException.new(http, message, code)
      when "DryRunOperationException"               then DryRunOperationException.new(http, message, code)
      when "ExpiredIteratorException"               then ExpiredIteratorException.new(http, message, code)
      when "ExpiredNextTokenException"              then ExpiredNextTokenException.new(http, message, code)
      when "InternalFailureException"               then InternalFailureException.new(http, message, code)
      when "InvalidArgumentException"               then InvalidArgumentException.new(http, message, code)
      when "KMSAccessDeniedException"               then KMSAccessDeniedException.new(http, message, code)
      when "KMSDisabledException"                   then KMSDisabledException.new(http, message, code)
      when "KMSInvalidStateException"               then KMSInvalidStateException.new(http, message, code)
      when "KMSNotFoundException"                   then KMSNotFoundException.new(http, message, code)
      when "KMSOptInRequired"                       then KMSOptInRequired.new(http, message, code)
      when "KMSThrottlingException"                 then KMSThrottlingException.new(http, message, code)
      when "LimitExceededException"                 then LimitExceededException.new(http, message, code)
      when "ProvisionedThroughputExceededException" then ProvisionedThroughputExceededException.new(http, message, code)
      when "ResourceInUseException"                 then ResourceInUseException.new(http, message, code)
      when "ResourceNotFoundException"              then ResourceNotFoundException.new(http, message, code)
      when "ValidationException"                    then ValidationException.new(http, message, code)
      end
    end
  end
end
