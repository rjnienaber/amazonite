module Amazonite::DynamoDBV2
  class DeleteBackupOutput
    include JSON::Serializable

    # Contains the description of the backup created for the table.
    @[JSON::Field(key: "BackupDescription")]
    property backup_description : BackupDescription | Nil

    def initialize(
      @backup_description : BackupDescription | Nil = nil,
    )
    end

    def_equals_and_hash(@backup_description)
  end
end
