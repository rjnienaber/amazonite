private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  class ListBackupsOutput
    include JSON::Serializable

    # List of `BackupSummary` objects.
    @[JSON::Field(key: "BackupSummaries")]
    property backup_summaries : Array(BackupSummary) | Nil

    # The ARN of the backup last evaluated when the current page of results was returned, inclusive of
    # the current page of results. This value may be specified as the `ExclusiveStartBackupArn` of a
    # new `ListBackups` operation in order to fetch the next page of results.
    #
    # If `LastEvaluatedBackupArn` is empty, then the last page of results has been processed and there
    # are no more results to be retrieved.
    #
    # If `LastEvaluatedBackupArn` is not empty, this may or may not indicate that there is more data
    # to be returned. All results are guaranteed to have been returned if and only if no value for
    # `LastEvaluatedBackupArn` is returned.
    @[JSON::Field(key: "LastEvaluatedBackupArn")]
    property last_evaluated_backup_arn : String | Nil

    def initialize(
      @backup_summaries : Array(BackupSummary) | Nil = nil,
      @last_evaluated_backup_arn : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @backup_summaries
        value.each(&.validate!)
      end

      if value = @last_evaluated_backup_arn
        raise Core::ValidationError.new("LastEvaluatedBackupArn length must be >= 37") if value.size < 37
        raise Core::ValidationError.new("LastEvaluatedBackupArn length must be <= 1024") if value.size > 1024
      end
    end

    def_equals_and_hash(@backup_summaries, @last_evaluated_backup_arn)
  end
end
