module Amazonite::DynamoDBv2
  class DescribeBackupOutput
    include JSON::Serializable

    @[JSON::Field(key: "BackupDescription")]
    property backup_description : BackupDescription | Nil

    def initialize(
      @backup_description : BackupDescription | Nil = nil
    )
    end
  end
end
