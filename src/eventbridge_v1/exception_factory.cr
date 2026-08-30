private alias Core = Amazonite::Core

module Amazonite::EventBridgeV1
  class AccessDeniedException < Core::ResponseException
  end

  class ConcurrentModificationException < Core::ResponseException
  end

  class IllegalStatusException < Core::ResponseException
  end

  class InternalException < Core::ResponseException
  end

  class InvalidEventPatternException < Core::ResponseException
  end

  class InvalidStateException < Core::ResponseException
  end

  class LimitExceededException < Core::ResponseException
  end

  class ManagedRuleException < Core::ResponseException
  end

  class OperationDisabledException < Core::ResponseException
  end

  class PolicyLengthExceededException < Core::ResponseException
  end

  class ResourceAlreadyExistsException < Core::ResponseException
  end

  class ResourceNotFoundException < Core::ResponseException
  end

  class ThrottlingException < Core::ResponseException
  end

  class ExceptionFactory < Core::ResponseExceptionFactory
    def create(exception_type, http, message, code) : Core::ResponseException | Nil
      case exception_type
      when "AccessDeniedException"           then AccessDeniedException.new(http, message, code)
      when "ConcurrentModificationException" then ConcurrentModificationException.new(http, message, code)
      when "IllegalStatusException"          then IllegalStatusException.new(http, message, code)
      when "InternalException"               then InternalException.new(http, message, code)
      when "InvalidEventPatternException"    then InvalidEventPatternException.new(http, message, code)
      when "InvalidStateException"           then InvalidStateException.new(http, message, code)
      when "LimitExceededException"          then LimitExceededException.new(http, message, code)
      when "ManagedRuleException"            then ManagedRuleException.new(http, message, code)
      when "OperationDisabledException"      then OperationDisabledException.new(http, message, code)
      when "PolicyLengthExceededException"   then PolicyLengthExceededException.new(http, message, code)
      when "ResourceAlreadyExistsException"  then ResourceAlreadyExistsException.new(http, message, code)
      when "ResourceNotFoundException"       then ResourceNotFoundException.new(http, message, code)
      when "ThrottlingException"             then ThrottlingException.new(http, message, code)
      end
    end
  end
end
