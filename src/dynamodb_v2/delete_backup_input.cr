module Amazonite::DynamoDBv2
  class DeleteBackupInput
    include JSON::Serializable

    @[JSON::Field(key: "BackupArn")]
    property backup_arn : String

    def initialize(
      @backup_arn : String
    )
    end
  end
end
