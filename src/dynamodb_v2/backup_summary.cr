private alias ADDB = Amazonite::DynamoDBV2
private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  # Contains details for the backup.
  class BackupSummary
    include JSON::Serializable

    # Name of the table.
    @[JSON::Field(key: "TableName")]
    property table_name : String | Nil

    # Unique identifier for the table.
    @[JSON::Field(key: "TableId")]
    property table_id : String | Nil

    # ARN associated with the table.
    @[JSON::Field(key: "TableArn")]
    property table_arn : String | Nil

    # ARN associated with the backup.
    @[JSON::Field(key: "BackupArn")]
    property backup_arn : String | Nil

    # Name of the specified backup.
    @[JSON::Field(key: "BackupName")]
    property backup_name : String | Nil

    # Time at which the backup was created.
    @[JSON::Field(key: "BackupCreationDateTime", converter: Core::AWSEpochConverter)]
    property backup_creation_date_time : Time | Nil

    # Time at which the automatic on-demand backup created by DynamoDB will expire. This `SYSTEM`
    # on-demand backup expires automatically 35 days after its creation.
    @[JSON::Field(key: "BackupExpiryDateTime", converter: Core::AWSEpochConverter)]
    property backup_expiry_date_time : Time | Nil

    # Backup can be in one of the following states: CREATING, ACTIVE, DELETED.
    @[JSON::Field(key: "BackupStatus", converter: ADDB::BackupStatus)]
    property backup_status : BackupStatus | Nil

    # BackupType:
    #
    # - `USER` - You create and manage these using the on-demand backup feature.
    #
    # - `SYSTEM` - If you delete a table with point-in-time recovery enabled, a `SYSTEM` backup is
    # automatically created and is retained for 35 days (at no additional cost). System backups allow
    # you to restore the deleted table to the state it was in just before the point of deletion.
    #
    # - `AWS_BACKUP` - On-demand backup created by you from Backup service.
    @[JSON::Field(key: "BackupType", converter: ADDB::BackupType)]
    property backup_type : BackupType | Nil

    # Size of the backup in bytes.
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
      @backup_size_bytes : Int64 | Nil = nil,
    )
    end
  end
end
