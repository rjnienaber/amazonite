private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  class CreateBackupOutput
    include JSON::Serializable

    # Contains the details of the backup created for the table.
    @[JSON::Field(key: "BackupDetails")]
    property backup_details : BackupDetails | Nil

    def initialize(
      @backup_details : BackupDetails | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @backup_details
        value.validate!
      end
    end

    def_equals_and_hash(@backup_details)
  end
end
