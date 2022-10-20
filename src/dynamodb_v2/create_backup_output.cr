module Amazonite::DynamoDBv2
  class CreateBackupOutput
    include JSON::Serializable

    @[JSON::Field(key: "BackupDetails")]
    property backup_details : BackupDetails | Nil

    def initialize(
      @backup_details : BackupDetails | Nil = nil
    )
    end
  end
end
