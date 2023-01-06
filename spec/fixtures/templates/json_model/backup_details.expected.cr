private alias ADDB = Amazonite::DynamoDBV2
private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  class BackupDetails
    include JSON::Serializable

    @[JSON::Field(key: "BackupArn")]
    property backup_arn : String

    @[JSON::Field(key: "BackupName")]
    property backup_name : String

    @[JSON::Field(key: "BackupStatus", converter: ADDB::BackupStatus)]
    property backup_status : BackupStatus

    @[JSON::Field(key: "BackupType", converter: ADDB::BackupType)]
    property backup_type : BackupType

    @[JSON::Field(key: "BackupCreationDateTime", converter: Core::AWSEpochConverter)]
    property backup_creation_date_time : Time

    @[JSON::Field(key: "BackupSizeBytes")]
    property backup_size_bytes : Int64 | Nil

    @[JSON::Field(key: "BackupExpiryDateTime", converter: Core::AWSEpochConverter)]
    property backup_expiry_date_time : Time | Nil

    def initialize(
      @backup_arn : String,
      @backup_name : String,
      @backup_status : BackupStatus,
      @backup_type : BackupType,
      @backup_creation_date_time : Time,
      @backup_size_bytes : Int64 | Nil = nil,
      @backup_expiry_date_time : Time | Nil = nil
    )
    end
  end
end
