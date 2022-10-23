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

  class ExceptionFactory < AC::ResponseExceptionFactory
    def create(exception_type, http, message, code) : AC::ResponseException | Nil
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
