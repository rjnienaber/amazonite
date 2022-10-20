private alias ADDB = Amazonite::DynamoDBv2
private alias AC = Amazonite::Core

module Amazonite::DynamoDBv2
  class ListBackupsInput
    include JSON::Serializable

    @[JSON::Field(key: "TableName")]
    property table_name : String | Nil

    @[JSON::Field(key: "Limit")]
    property limit : Int32 | Nil

    @[JSON::Field(key: "TimeRangeLowerBound", converter: AC::AWSEpochConverter)]
    property time_range_lower_bound : Time | Nil

    @[JSON::Field(key: "TimeRangeUpperBound", converter: AC::AWSEpochConverter)]
    property time_range_upper_bound : Time | Nil

    @[JSON::Field(key: "ExclusiveStartBackupArn")]
    property exclusive_start_backup_arn : String | Nil

    @[JSON::Field(key: "BackupType", converter: ADDB::BackupTypeFilter)]
    property backup_type : BackupTypeFilter | Nil

    def initialize(
      @table_name : String | Nil = nil,
      @limit : Int32 | Nil = nil,
      @time_range_lower_bound : Time | Nil = nil,
      @time_range_upper_bound : Time | Nil = nil,
      @exclusive_start_backup_arn : String | Nil = nil,
      @backup_type : BackupTypeFilter | Nil = nil
    )
    end
  end
end