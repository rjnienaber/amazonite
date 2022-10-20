private alias ADDB = Amazonite::DynamoDBv2
private alias AC = Amazonite::Core

module Amazonite::DynamoDBv2
  class BackupSummary
    include JSON::Serializable

    @[JSON::Field(key: "TableName")]
    property table_name : String | Nil

    @[JSON::Field(key: "TableId")]
    property table_id : String | Nil

    @[JSON::Field(key: "TableArn")]
    property table_arn : String | Nil

    @[JSON::Field(key: "BackupArn")]
    property backup_arn : String | Nil

    @[JSON::Field(key: "BackupName")]
    property backup_name : String | Nil

    @[JSON::Field(key: "BackupCreationDateTime", converter: AC::AWSEpochConverter)]
    property backup_creation_date_time : Time | Nil

    @[JSON::Field(key: "BackupExpiryDateTime", converter: AC::AWSEpochConverter)]
    property backup_expiry_date_time : Time | Nil

    @[JSON::Field(key: "BackupStatus", converter: ADDB::BackupStatus)]
    property backup_status : BackupStatus | Nil

    @[JSON::Field(key: "BackupType", converter: ADDB::BackupType)]
    property backup_type : BackupType | Nil

    @[JSON::Field(key: "BackupSizeBytes")]
    property backup_size_bytes : Int64 | Nil

    def initialize(
      @table_name : String | Nil = nil,
      @table_id : String | Nil = nil,
      @table_arn : String | Nil = nil,
      @backup_arn : String | Nil = nil,
      @backup_name : String | Nil = nil,
      @backup_creation_date_time : Time | Nil = nil,
      @backup_expiry_date_time : Time | Nil = nil,
      @backup_status : BackupStatus | Nil = nil,
      @backup_type : BackupType | Nil = nil,
      @backup_size_bytes : Int64 | Nil = nil
    )
    end
  end
end