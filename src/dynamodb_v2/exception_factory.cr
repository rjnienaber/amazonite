private alias AC = Amazonite::Core

module Amazonite::DynamoDBv2
  class BackupInUseException < AC::ResponseException
  end

  class BackupNotFoundException < AC::ResponseException
  end

  class ConditionalCheckFailedException < AC::ResponseException
  end

  class ContinuousBackupsUnavailableException < AC::ResponseException
  end

  class DuplicateItemException < AC::ResponseException
  end

  class ExportConflictException < AC::ResponseException
  end

  class ExportNotFoundException < AC::ResponseException
  end

  class GlobalTableAlreadyExistsException < AC::ResponseException
  end

  class GlobalTableNotFoundException < AC::ResponseException
  end

  class IdempotentParameterMismatchException < AC::ResponseException
  end

  class ImportConflictException < AC::ResponseException
  end

  class ImportNotFoundException < AC::ResponseException
  end

  class IndexNotFoundException < AC::ResponseException
  end

  class InternalServerError < AC::ResponseException
  end

  class InvalidExportTimeException < AC::ResponseException
  end

  class InvalidRestoreTimeException < AC::ResponseException
  end

  class ItemCollectionSizeLimitExceededException < AC::ResponseException
  end

  class LimitExceededException < AC::ResponseException
  end

  class PointInTimeRecoveryUnavailableException < AC::ResponseException
  end

  class ProvisionedThroughputExceededException < AC::ResponseException
  end

  class ReplicaAlreadyExistsException < AC::ResponseException
  end

  class ReplicaNotFoundException < AC::ResponseException
  end

  class RequestLimitExceeded < AC::ResponseException
  end

  class ResourceInUseException < AC::ResponseException
  end

  class ResourceNotFoundException < AC::ResponseException
  end

  class TableAlreadyExistsException < AC::ResponseException
  end

  class TableInUseException < AC::ResponseException
  end

  class TableNotFoundException < AC::ResponseException
  end

  class TransactionCanceledException < AC::ResponseException
  end

  class TransactionConflictException < AC::ResponseException
  end

  class TransactionInProgressException < AC::ResponseException
  end

  class ExceptionFactory
    include AC::ResponseExceptionFactory

    def create_exception(error_type, http, message) : AC::ResponseException | Nil
      case error_type
      when "BackupInUseException"                     then BackupInUseException.new(http, message)
      when "BackupNotFoundException"                  then BackupNotFoundException.new(http, message)
      when "ConditionalCheckFailedException"          then ConditionalCheckFailedException.new(http, message)
      when "ContinuousBackupsUnavailableException"    then ContinuousBackupsUnavailableException.new(http, message)
      when "DuplicateItemException"                   then DuplicateItemException.new(http, message)
      when "ExportConflictException"                  then ExportConflictException.new(http, message)
      when "ExportNotFoundException"                  then ExportNotFoundException.new(http, message)
      when "GlobalTableAlreadyExistsException"        then GlobalTableAlreadyExistsException.new(http, message)
      when "GlobalTableNotFoundException"             then GlobalTableNotFoundException.new(http, message)
      when "IdempotentParameterMismatchException"     then IdempotentParameterMismatchException.new(http, message)
      when "ImportConflictException"                  then ImportConflictException.new(http, message)
      when "ImportNotFoundException"                  then ImportNotFoundException.new(http, message)
      when "IndexNotFoundException"                   then IndexNotFoundException.new(http, message)
      when "InternalServerError"                      then InternalServerError.new(http, message)
      when "InvalidExportTimeException"               then InvalidExportTimeException.new(http, message)
      when "InvalidRestoreTimeException"              then InvalidRestoreTimeException.new(http, message)
      when "ItemCollectionSizeLimitExceededException" then ItemCollectionSizeLimitExceededException.new(http, message)
      when "LimitExceededException"                   then LimitExceededException.new(http, message)
      when "PointInTimeRecoveryUnavailableException"  then PointInTimeRecoveryUnavailableException.new(http, message)
      when "ProvisionedThroughputExceededException"   then ProvisionedThroughputExceededException.new(http, message)
      when "ReplicaAlreadyExistsException"            then ReplicaAlreadyExistsException.new(http, message)
      when "ReplicaNotFoundException"                 then ReplicaNotFoundException.new(http, message)
      when "RequestLimitExceeded"                     then RequestLimitExceeded.new(http, message)
      when "ResourceInUseException"                   then ResourceInUseException.new(http, message)
      when "ResourceNotFoundException"                then ResourceNotFoundException.new(http, message)
      when "TableAlreadyExistsException"              then TableAlreadyExistsException.new(http, message)
      when "TableInUseException"                      then TableInUseException.new(http, message)
      when "TableNotFoundException"                   then TableNotFoundException.new(http, message)
      when "TransactionCanceledException"             then TransactionCanceledException.new(http, message)
      when "TransactionConflictException"             then TransactionConflictException.new(http, message)
      when "TransactionInProgressException"           then TransactionInProgressException.new(http, message)
      end
    end
  end
end
