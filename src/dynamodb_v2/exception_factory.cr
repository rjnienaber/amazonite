private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  class BackupInUseException < Core::ResponseException
  end

  class BackupNotFoundException < Core::ResponseException
  end

  class ConditionalCheckFailedException < Core::ResponseException
  end

  class ContinuousBackupsUnavailableException < Core::ResponseException
  end

  class DuplicateItemException < Core::ResponseException
  end

  class ExportConflictException < Core::ResponseException
  end

  class ExportNotFoundException < Core::ResponseException
  end

  class GlobalTableAlreadyExistsException < Core::ResponseException
  end

  class GlobalTableNotFoundException < Core::ResponseException
  end

  class IdempotentParameterMismatchException < Core::ResponseException
  end

  class ImportConflictException < Core::ResponseException
  end

  class ImportNotFoundException < Core::ResponseException
  end

  class IndexNotFoundException < Core::ResponseException
  end

  class InternalServerError < Core::ResponseException
  end

  class InvalidExportTimeException < Core::ResponseException
  end

  class InvalidRestoreTimeException < Core::ResponseException
  end

  class ItemCollectionSizeLimitExceededException < Core::ResponseException
  end

  class LimitExceededException < Core::ResponseException
  end

  class PointInTimeRecoveryUnavailableException < Core::ResponseException
  end

  class ProvisionedThroughputExceededException < Core::ResponseException
  end

  class ReplicaAlreadyExistsException < Core::ResponseException
  end

  class ReplicaNotFoundException < Core::ResponseException
  end

  class RequestLimitExceeded < Core::ResponseException
  end

  class ResourceInUseException < Core::ResponseException
  end

  class ResourceNotFoundException < Core::ResponseException
  end

  class TableAlreadyExistsException < Core::ResponseException
  end

  class TableInUseException < Core::ResponseException
  end

  class TableNotFoundException < Core::ResponseException
  end

  class TransactionCanceledException < Core::ResponseException
  end

  class TransactionConflictException < Core::ResponseException
  end

  class TransactionInProgressException < Core::ResponseException
  end

  class ExceptionFactory < Core::ResponseExceptionFactory
    def create(exception_type, http, message, code) : Core::ResponseException | Nil
      case exception_type
      when "BackupInUseException"                     then BackupInUseException.new(http, message, code)
      when "BackupNotFoundException"                  then BackupNotFoundException.new(http, message, code)
      when "ConditionalCheckFailedException"          then ConditionalCheckFailedException.new(http, message, code)
      when "ContinuousBackupsUnavailableException"    then ContinuousBackupsUnavailableException.new(http, message, code)
      when "DuplicateItemException"                   then DuplicateItemException.new(http, message, code)
      when "ExportConflictException"                  then ExportConflictException.new(http, message, code)
      when "ExportNotFoundException"                  then ExportNotFoundException.new(http, message, code)
      when "GlobalTableAlreadyExistsException"        then GlobalTableAlreadyExistsException.new(http, message, code)
      when "GlobalTableNotFoundException"             then GlobalTableNotFoundException.new(http, message, code)
      when "IdempotentParameterMismatchException"     then IdempotentParameterMismatchException.new(http, message, code)
      when "ImportConflictException"                  then ImportConflictException.new(http, message, code)
      when "ImportNotFoundException"                  then ImportNotFoundException.new(http, message, code)
      when "IndexNotFoundException"                   then IndexNotFoundException.new(http, message, code)
      when "InternalServerError"                      then InternalServerError.new(http, message, code)
      when "InvalidExportTimeException"               then InvalidExportTimeException.new(http, message, code)
      when "InvalidRestoreTimeException"              then InvalidRestoreTimeException.new(http, message, code)
      when "ItemCollectionSizeLimitExceededException" then ItemCollectionSizeLimitExceededException.new(http, message, code)
      when "LimitExceededException"                   then LimitExceededException.new(http, message, code)
      when "PointInTimeRecoveryUnavailableException"  then PointInTimeRecoveryUnavailableException.new(http, message, code)
      when "ProvisionedThroughputExceededException"   then ProvisionedThroughputExceededException.new(http, message, code)
      when "ReplicaAlreadyExistsException"            then ReplicaAlreadyExistsException.new(http, message, code)
      when "ReplicaNotFoundException"                 then ReplicaNotFoundException.new(http, message, code)
      when "RequestLimitExceeded"                     then RequestLimitExceeded.new(http, message, code)
      when "ResourceInUseException"                   then ResourceInUseException.new(http, message, code)
      when "ResourceNotFoundException"                then ResourceNotFoundException.new(http, message, code)
      when "TableAlreadyExistsException"              then TableAlreadyExistsException.new(http, message, code)
      when "TableInUseException"                      then TableInUseException.new(http, message, code)
      when "TableNotFoundException"                   then TableNotFoundException.new(http, message, code)
      when "TransactionCanceledException"             then TransactionCanceledException.new(http, message, code)
      when "TransactionConflictException"             then TransactionConflictException.new(http, message, code)
      when "TransactionInProgressException"           then TransactionInProgressException.new(http, message, code)
      end
    end
  end
end
