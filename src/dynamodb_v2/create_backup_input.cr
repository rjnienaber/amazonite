private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  class CreateBackupInput
    include JSON::Serializable

    # The name of the table. You can also provide the Amazon Resource Name (ARN) of the table in this
    # parameter.
    @[JSON::Field(key: "TableName")]
    property table_name : String

    # Specified name for the backup.
    @[JSON::Field(key: "BackupName")]
    property backup_name : String

    def initialize(
      @table_name : String,
      @backup_name : String,
    )
    end

    def validate! : Nil
      if value = @table_name
        raise Core::ValidationError.new("TableName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TableName length must be <= 1024") if value.size > 1024
      end

      if value = @backup_name
        raise Core::ValidationError.new("BackupName length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("BackupName length must be <= 255") if value.size > 255
        raise Core::ValidationError.new("BackupName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end
    end

    def_equals_and_hash(@table_name, @backup_name)
  end
end
