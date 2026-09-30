private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  # Contains details for the restore.
  class RestoreSummary
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the backup from which the table was restored.
    @[JSON::Field(key: "SourceBackupArn")]
    property source_backup_arn : String | Nil

    # The ARN of the source table of the backup that is being restored.
    @[JSON::Field(key: "SourceTableArn")]
    property source_table_arn : String | Nil

    # Point in time or source backup time.
    @[JSON::Field(key: "RestoreDateTime", converter: Core::AWSEpochConverter)]
    property restore_date_time : Time

    # Indicates if a restore is in progress or not.
    @[JSON::Field(key: "RestoreInProgress")]
    property restore_in_progress : Bool

    def initialize(
      @restore_date_time : Time,
      @restore_in_progress : Bool,
      @source_backup_arn : String | Nil = nil,
      @source_table_arn : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @source_backup_arn
        raise Core::ValidationError.new("SourceBackupArn length must be >= 37") if value.size < 37
        raise Core::ValidationError.new("SourceBackupArn length must be <= 1024") if value.size > 1024
      end

      if value = @source_table_arn
        raise Core::ValidationError.new("SourceTableArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("SourceTableArn length must be <= 1024") if value.size > 1024
      end
    end

    def_equals_and_hash(@source_backup_arn, @source_table_arn, @restore_date_time, @restore_in_progress)
  end
end
