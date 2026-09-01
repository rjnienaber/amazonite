private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  class DeleteBackupOutput
    include JSON::Serializable

    # Contains the description of the backup created for the table.
    @[JSON::Field(key: "BackupDescription")]
    property backup_description : BackupDescription | Nil

    def initialize(
      @backup_description : BackupDescription | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @backup_description
        value.validate!
      end
    end

    def_equals_and_hash(@backup_description)
  end
end
