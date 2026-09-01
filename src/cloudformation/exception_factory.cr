private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  class AlreadyExistsException < Core::ResponseException
  end

  class CFNRegistryException < Core::ResponseException
  end

  class ChangeSetNotFoundException < Core::ResponseException
  end

  class ConcurrentResourcesLimitExceededException < Core::ResponseException
  end

  class CreatedButModifiedException < Core::ResponseException
  end

  class GeneratedTemplateNotFoundException < Core::ResponseException
  end

  class HookResultNotFoundException < Core::ResponseException
  end

  class InsufficientCapabilitiesException < Core::ResponseException
  end

  class InvalidChangeSetStatusException < Core::ResponseException
  end

  class InvalidOperationException < Core::ResponseException
  end

  class InvalidStateTransitionException < Core::ResponseException
  end

  class LimitExceededException < Core::ResponseException
  end

  class NameAlreadyExistsException < Core::ResponseException
  end

  class OperationIdAlreadyExistsException < Core::ResponseException
  end

  class OperationInProgressException < Core::ResponseException
  end

  class OperationNotFoundException < Core::ResponseException
  end

  class OperationStatusCheckFailedException < Core::ResponseException
  end

  class ResourceScanInProgressException < Core::ResponseException
  end

  class ResourceScanLimitExceededException < Core::ResponseException
  end

  class ResourceScanNotFoundException < Core::ResponseException
  end

  class StackInstanceNotFoundException < Core::ResponseException
  end

  class StackNotFoundException < Core::ResponseException
  end

  class StackRefactorNotFoundException < Core::ResponseException
  end

  class StackSetNotEmptyException < Core::ResponseException
  end

  class StackSetNotFoundException < Core::ResponseException
  end

  class StaleRequestException < Core::ResponseException
  end

  class TokenAlreadyExistsException < Core::ResponseException
  end

  class TypeConfigurationNotFoundException < Core::ResponseException
  end

  class TypeNotFoundException < Core::ResponseException
  end

  class ExceptionFactory < Core::QueryResponseExceptionFactory
    def create(exception_type, http, message, code) : Core::ResponseException | Nil
      case exception_type
      when "AlreadyExistsException"             then AlreadyExistsException.new(http, message, code)
      when "CFNRegistryException"               then CFNRegistryException.new(http, message, code)
      when "ChangeSetNotFound"                  then ChangeSetNotFoundException.new(http, message, code)
      when "ConcurrentResourcesLimitExceeded"   then ConcurrentResourcesLimitExceededException.new(http, message, code)
      when "CreatedButModifiedException"        then CreatedButModifiedException.new(http, message, code)
      when "GeneratedTemplateNotFound"          then GeneratedTemplateNotFoundException.new(http, message, code)
      when "HookResultNotFound"                 then HookResultNotFoundException.new(http, message, code)
      when "InsufficientCapabilitiesException"  then InsufficientCapabilitiesException.new(http, message, code)
      when "InvalidChangeSetStatus"             then InvalidChangeSetStatusException.new(http, message, code)
      when "InvalidOperationException"          then InvalidOperationException.new(http, message, code)
      when "InvalidStateTransition"             then InvalidStateTransitionException.new(http, message, code)
      when "LimitExceededException"             then LimitExceededException.new(http, message, code)
      when "NameAlreadyExistsException"         then NameAlreadyExistsException.new(http, message, code)
      when "OperationIdAlreadyExistsException"  then OperationIdAlreadyExistsException.new(http, message, code)
      when "OperationInProgressException"       then OperationInProgressException.new(http, message, code)
      when "OperationNotFoundException"         then OperationNotFoundException.new(http, message, code)
      when "ConditionalCheckFailed"             then OperationStatusCheckFailedException.new(http, message, code)
      when "ResourceScanInProgress"             then ResourceScanInProgressException.new(http, message, code)
      when "ResourceScanLimitExceeded"          then ResourceScanLimitExceededException.new(http, message, code)
      when "ResourceScanNotFound"               then ResourceScanNotFoundException.new(http, message, code)
      when "StackInstanceNotFoundException"     then StackInstanceNotFoundException.new(http, message, code)
      when "StackNotFoundException"             then StackNotFoundException.new(http, message, code)
      when "StackRefactorNotFoundException"     then StackRefactorNotFoundException.new(http, message, code)
      when "StackSetNotEmptyException"          then StackSetNotEmptyException.new(http, message, code)
      when "StackSetNotFoundException"          then StackSetNotFoundException.new(http, message, code)
      when "StaleRequestException"              then StaleRequestException.new(http, message, code)
      when "TokenAlreadyExistsException"        then TokenAlreadyExistsException.new(http, message, code)
      when "TypeConfigurationNotFoundException" then TypeConfigurationNotFoundException.new(http, message, code)
      when "TypeNotFoundException"              then TypeNotFoundException.new(http, message, code)
      end
    end
  end
end
