private alias Core = Amazonite::Core

module Amazonite::SnsV1
  class AuthorizationErrorException < Core::ResponseException
  end

  class BatchEntryIdsNotDistinctException < Core::ResponseException
  end

  class BatchRequestTooLongException < Core::ResponseException
  end

  class ConcurrentAccessException < Core::ResponseException
  end

  class EmptyBatchRequestException < Core::ResponseException
  end

  class EndpointDisabledException < Core::ResponseException
  end

  class FilterPolicyLimitExceededException < Core::ResponseException
  end

  class InternalErrorException < Core::ResponseException
  end

  class InvalidBatchEntryIdException < Core::ResponseException
  end

  class InvalidParameterException < Core::ResponseException
  end

  class InvalidParameterValueException < Core::ResponseException
  end

  class InvalidSecurityException < Core::ResponseException
  end

  class InvalidStateException < Core::ResponseException
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

  class NotFoundException < Core::ResponseException
  end

  class OptedOutException < Core::ResponseException
  end

  class PlatformApplicationDisabledException < Core::ResponseException
  end

  class ReplayLimitExceededException < Core::ResponseException
  end

  class ResourceNotFoundException < Core::ResponseException
  end

  class StaleTagException < Core::ResponseException
  end

  class SubscriptionLimitExceededException < Core::ResponseException
  end

  class TagLimitExceededException < Core::ResponseException
  end

  class TagPolicyException < Core::ResponseException
  end

  class ThrottledException < Core::ResponseException
  end

  class TooManyEntriesInBatchRequestException < Core::ResponseException
  end

  class TopicLimitExceededException < Core::ResponseException
  end

  class UserErrorException < Core::ResponseException
  end

  class ValidationException < Core::ResponseException
  end

  class VerificationException < Core::ResponseException
  end

  class ExceptionFactory < Core::QueryResponseExceptionFactory
    def create(exception_type, http, message, code) : Core::ResponseException | Nil
      case exception_type
      when "AuthorizationError"           then AuthorizationErrorException.new(http, message, code)
      when "BatchEntryIdsNotDistinct"     then BatchEntryIdsNotDistinctException.new(http, message, code)
      when "BatchRequestTooLong"          then BatchRequestTooLongException.new(http, message, code)
      when "ConcurrentAccess"             then ConcurrentAccessException.new(http, message, code)
      when "EmptyBatchRequest"            then EmptyBatchRequestException.new(http, message, code)
      when "EndpointDisabled"             then EndpointDisabledException.new(http, message, code)
      when "FilterPolicyLimitExceeded"    then FilterPolicyLimitExceededException.new(http, message, code)
      when "InternalError"                then InternalErrorException.new(http, message, code)
      when "InvalidBatchEntryId"          then InvalidBatchEntryIdException.new(http, message, code)
      when "InvalidParameter"             then InvalidParameterException.new(http, message, code)
      when "ParameterValueInvalid"        then InvalidParameterValueException.new(http, message, code)
      when "InvalidSecurity"              then InvalidSecurityException.new(http, message, code)
      when "InvalidState"                 then InvalidStateException.new(http, message, code)
      when "KMSAccessDenied"              then KMSAccessDeniedException.new(http, message, code)
      when "KMSDisabled"                  then KMSDisabledException.new(http, message, code)
      when "KMSInvalidState"              then KMSInvalidStateException.new(http, message, code)
      when "KMSNotFound"                  then KMSNotFoundException.new(http, message, code)
      when "KMSOptInRequired"             then KMSOptInRequired.new(http, message, code)
      when "KMSThrottling"                then KMSThrottlingException.new(http, message, code)
      when "NotFound"                     then NotFoundException.new(http, message, code)
      when "OptedOut"                     then OptedOutException.new(http, message, code)
      when "PlatformApplicationDisabled"  then PlatformApplicationDisabledException.new(http, message, code)
      when "ReplayLimitExceeded"          then ReplayLimitExceededException.new(http, message, code)
      when "ResourceNotFound"             then ResourceNotFoundException.new(http, message, code)
      when "StaleTag"                     then StaleTagException.new(http, message, code)
      when "SubscriptionLimitExceeded"    then SubscriptionLimitExceededException.new(http, message, code)
      when "TagLimitExceeded"             then TagLimitExceededException.new(http, message, code)
      when "TagPolicy"                    then TagPolicyException.new(http, message, code)
      when "Throttled"                    then ThrottledException.new(http, message, code)
      when "TooManyEntriesInBatchRequest" then TooManyEntriesInBatchRequestException.new(http, message, code)
      when "TopicLimitExceeded"           then TopicLimitExceededException.new(http, message, code)
      when "UserError"                    then UserErrorException.new(http, message, code)
      when "ValidationException"          then ValidationException.new(http, message, code)
      when "VerificationException"        then VerificationException.new(http, message, code)
      end
    end
  end
end
