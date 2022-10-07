module Amazonite
  module DynamoDB
    class BackupDetails
      include JSON::Serializable

      @[JSON::Field(key: "BackupArn")]
      property backup_arn : String

      @[JSON::Field(key: "BackupName")]
      property backup_name : String

      @[JSON::Field(key: "BackupSizeBytes")]
      property backup_size_bytes : Int64 | Nil

      @[JSON::Field(key: "BackupStatus", converter: Amazonite::DynamoDB::BackupStatus)]
      property backup_status : BackupStatus

      @[JSON::Field(key: "BackupType", converter: Amazonite::DynamoDB::BackupType)]
      property backup_type : BackupType

      @[JSON::Field(key: "BackupCreationDateTime", converter: Amazonite::Core::AWSEpochConverter)]
      property backup_creation_date_time : Time

      @[JSON::Field(key: "BackupExpiryDateTime", converter: Amazonite::Core::AWSEpochConverter)]
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
end
