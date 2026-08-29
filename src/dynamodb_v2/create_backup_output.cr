module Amazonite::DynamoDBV2
  class CreateBackupOutput
    include JSON::Serializable

    # Contains the details of the backup created for the table.
    @[JSON::Field(key: "BackupDetails")]
    property backup_details : BackupDetails | Nil

    def initialize(
      @backup_details : BackupDetails | Nil = nil,
    )
    end
  end
end
