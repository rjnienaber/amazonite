private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  class DescribeBackupInput
    include JSON::Serializable

    # The Amazon Resource Name (ARN) associated with the backup.
    @[JSON::Field(key: "BackupArn")]
    property backup_arn : String

    def initialize(
      @backup_arn : String,
    )
    end

    def validate! : Nil
      if value = @backup_arn
        raise Core::ValidationError.new("BackupArn length must be >= 37") if value.size < 37
        raise Core::ValidationError.new("BackupArn length must be <= 1024") if value.size > 1024
      end
    end

    def_equals_and_hash(@backup_arn)
  end
end
