private alias ADDB = Amazonite::DynamoDBV2
private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  # Contains the details of the backup created for the table.
  class BackupDetails
    include JSON::Serializable

    # ARN associated with the backup.
    @[JSON::Field(key: "BackupArn")]
    property backup_arn : String

    # Name of the requested backup.
    @[JSON::Field(key: "BackupName")]
    property backup_name : String

    # Size of the backup in bytes. DynamoDB updates this value approximately every six hours. Recent
    # changes might not be reflected in this value.
    @[JSON::Field(key: "BackupSizeBytes")]
    property backup_size_bytes : Int64 | Nil

    # Backup can be in one of the following states: CREATING, ACTIVE, DELETED.
    @[JSON::Field(key: "BackupStatus", converter: ADDB::BackupStatus)]
    property backup_status : BackupStatus

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
    property backup_type : BackupType

    # Time at which the backup was created. This is the request time of the backup.
    @[JSON::Field(key: "BackupCreationDateTime", converter: Core::AWSEpochConverter)]
    property backup_creation_date_time : Time

    # Time at which the automatic on-demand backup created by DynamoDB will expire. This `SYSTEM`
    # on-demand backup expires automatically 35 days after its creation.
    @[JSON::Field(key: "BackupExpiryDateTime", converter: Core::AWSEpochConverter)]
    property backup_expiry_date_time : Time | Nil

    def initialize(
      @backup_arn : String,
      @backup_name : String,
      @backup_status : BackupStatus,
      @backup_type : BackupType,
      @backup_creation_date_time : Time,
      @backup_size_bytes : Int64 | Nil = nil,
      @backup_expiry_date_time : Time | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @backup_arn
        raise Core::ValidationError.new("BackupArn length must be >= 37") if value.size < 37
        raise Core::ValidationError.new("BackupArn length must be <= 1024") if value.size > 1024
      end

      if value = @backup_name
        raise Core::ValidationError.new("BackupName length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("BackupName length must be <= 255") if value.size > 255
        raise Core::ValidationError.new("BackupName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end

      if value = @backup_size_bytes
        raise Core::ValidationError.new("BackupSizeBytes value must be >= 0") if value < 0
      end
    end

    def_equals_and_hash(@backup_arn, @backup_name, @backup_size_bytes, @backup_status, @backup_type, @backup_creation_date_time, @backup_expiry_date_time)
  end
end
