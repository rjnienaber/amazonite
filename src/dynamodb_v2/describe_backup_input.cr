module Amazonite::DynamoDBV2
  class DescribeBackupInput
    include JSON::Serializable

    # The Amazon Resource Name (ARN) associated with the backup.
    @[JSON::Field(key: "BackupArn")]
    property backup_arn : String

    def initialize(
      @backup_arn : String,
    )
    end

    def_equals_and_hash(@backup_arn)
  end
end
