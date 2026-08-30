private alias ADDB = Amazonite::DynamoDBV2
private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  class ListBackupsInput
    include JSON::Serializable

    # Lists the backups from the table specified in `TableName`. You can also provide the Amazon
    # Resource Name (ARN) of the table in this parameter.
    @[JSON::Field(key: "TableName")]
    property table_name : String | Nil

    # Maximum number of backups to return at once.
    @[JSON::Field(key: "Limit")]
    property limit : Int32 | Nil

    # Only backups created after this time are listed. `TimeRangeLowerBound` is inclusive.
    @[JSON::Field(key: "TimeRangeLowerBound", converter: Core::AWSEpochConverter)]
    property time_range_lower_bound : Time | Nil

    # Only backups created before this time are listed. `TimeRangeUpperBound` is exclusive.
    @[JSON::Field(key: "TimeRangeUpperBound", converter: Core::AWSEpochConverter)]
    property time_range_upper_bound : Time | Nil

    # `LastEvaluatedBackupArn` is the Amazon Resource Name (ARN) of the backup last evaluated when the
    # current page of results was returned, inclusive of the current page of results. This value may
    # be specified as the `ExclusiveStartBackupArn` of a new `ListBackups` operation in order to fetch
    # the next page of results.
    @[JSON::Field(key: "ExclusiveStartBackupArn")]
    property exclusive_start_backup_arn : String | Nil

    # The backups from the table specified by `BackupType` are listed.
    #
    # Where `BackupType` can be:
    #
    # - `USER` - On-demand backup created by you. (The default setting if no other backup types are
    # specified.)
    #
    # - `SYSTEM` - On-demand backup automatically created by DynamoDB.
    #
    # - `ALL` - All types of on-demand backups (USER and SYSTEM).
    @[JSON::Field(key: "BackupType", converter: ADDB::BackupTypeFilter)]
    property backup_type : BackupTypeFilter | Nil

    def initialize(
      @table_name : String | Nil = nil,
      @limit : Int32 | Nil = nil,
      @time_range_lower_bound : Time | Nil = nil,
      @time_range_upper_bound : Time | Nil = nil,
      @exclusive_start_backup_arn : String | Nil = nil,
      @backup_type : BackupTypeFilter | Nil = nil,
    )
    end

    def_equals_and_hash(@table_name, @limit, @time_range_lower_bound, @time_range_upper_bound, @exclusive_start_backup_arn, @backup_type)
  end
end
