module Amazonite::DynamoDBV2
  class DeleteBackupInput
    include JSON::Serializable

    # The ARN associated with the backup.
    @[JSON::Field(key: "BackupArn")]
    property backup_arn : String

    def initialize(
      @backup_arn : String,
    )
    end
  end
end
