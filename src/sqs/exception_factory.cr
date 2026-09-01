private alias Core = Amazonite::Core

module Amazonite::Sqs
  class BatchEntryIdsNotDistinct < Core::ResponseException
  end

  class BatchRequestTooLong < Core::ResponseException
  end

  class EmptyBatchRequest < Core::ResponseException
  end

  class InvalidAddress < Core::ResponseException
  end

  class InvalidAttributeName < Core::ResponseException
  end

  class InvalidAttributeValue < Core::ResponseException
  end

  class InvalidBatchEntryId < Core::ResponseException
  end

  class InvalidIdFormat < Core::ResponseException
  end

  class InvalidMessageContents < Core::ResponseException
  end

  class InvalidSecurity < Core::ResponseException
  end

  class KmsAccessDenied < Core::ResponseException
  end

  class KmsDisabled < Core::ResponseException
  end

  class KmsInvalidKeyUsage < Core::ResponseException
  end

  class KmsInvalidState < Core::ResponseException
  end

  class KmsNotFound < Core::ResponseException
  end

  class KmsOptInRequired < Core::ResponseException
  end

  class KmsThrottled < Core::ResponseException
  end

  class MessageNotInflight < Core::ResponseException
  end

  class OverLimit < Core::ResponseException
  end

  class PurgeQueueInProgress < Core::ResponseException
  end

  class QueueDeletedRecently < Core::ResponseException
  end

  class QueueDoesNotExist < Core::ResponseException
  end

  class QueueNameExists < Core::ResponseException
  end

  class ReceiptHandleIsInvalid < Core::ResponseException
  end

  class RequestThrottled < Core::ResponseException
  end

  class ResourceNotFoundException < Core::ResponseException
  end

  class TooManyEntriesInBatchRequest < Core::ResponseException
  end

  class UnsupportedOperation < Core::ResponseException
  end

  class ExceptionFactory < Core::ResponseExceptionFactory
    def create(exception_type, http, message, code) : Core::ResponseException | Nil
      case exception_type
      when "BatchEntryIdsNotDistinct"     then BatchEntryIdsNotDistinct.new(http, message, code)
      when "BatchRequestTooLong"          then BatchRequestTooLong.new(http, message, code)
      when "EmptyBatchRequest"            then EmptyBatchRequest.new(http, message, code)
      when "InvalidAddress"               then InvalidAddress.new(http, message, code)
      when "InvalidAttributeName"         then InvalidAttributeName.new(http, message, code)
      when "InvalidAttributeValue"        then InvalidAttributeValue.new(http, message, code)
      when "InvalidBatchEntryId"          then InvalidBatchEntryId.new(http, message, code)
      when "InvalidIdFormat"              then InvalidIdFormat.new(http, message, code)
      when "InvalidMessageContents"       then InvalidMessageContents.new(http, message, code)
      when "InvalidSecurity"              then InvalidSecurity.new(http, message, code)
      when "KmsAccessDenied"              then KmsAccessDenied.new(http, message, code)
      when "KmsDisabled"                  then KmsDisabled.new(http, message, code)
      when "KmsInvalidKeyUsage"           then KmsInvalidKeyUsage.new(http, message, code)
      when "KmsInvalidState"              then KmsInvalidState.new(http, message, code)
      when "KmsNotFound"                  then KmsNotFound.new(http, message, code)
      when "KmsOptInRequired"             then KmsOptInRequired.new(http, message, code)
      when "KmsThrottled"                 then KmsThrottled.new(http, message, code)
      when "MessageNotInflight"           then MessageNotInflight.new(http, message, code)
      when "OverLimit"                    then OverLimit.new(http, message, code)
      when "PurgeQueueInProgress"         then PurgeQueueInProgress.new(http, message, code)
      when "QueueDeletedRecently"         then QueueDeletedRecently.new(http, message, code)
      when "QueueDoesNotExist"            then QueueDoesNotExist.new(http, message, code)
      when "QueueNameExists"              then QueueNameExists.new(http, message, code)
      when "ReceiptHandleIsInvalid"       then ReceiptHandleIsInvalid.new(http, message, code)
      when "RequestThrottled"             then RequestThrottled.new(http, message, code)
      when "ResourceNotFoundException"    then ResourceNotFoundException.new(http, message, code)
      when "TooManyEntriesInBatchRequest" then TooManyEntriesInBatchRequest.new(http, message, code)
      when "UnsupportedOperation"         then UnsupportedOperation.new(http, message, code)
      end
    end
  end
end
