module Amazonite::DynamoDBv2
  class DescribeBackupInput
    include JSON::Serializable

    @[JSON::Field(key: "BackupArn")]
    property backup_arn : String

    def initialize(
      @backup_arn : String
    )
    end
  end
end