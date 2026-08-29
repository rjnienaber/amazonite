private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  # Contains details of a table archival operation.
  class ArchivalSummary
    include JSON::Serializable

    # The date and time when table archival was initiated by DynamoDB, in UNIX epoch time format.
    @[JSON::Field(key: "ArchivalDateTime", converter: Core::AWSEpochConverter)]
    property archival_date_time : Time | Nil

    # The reason DynamoDB archived the table. Currently, the only possible value is:
    #
    # - `INACCESSIBLE_ENCRYPTION_CREDENTIALS` - The table was archived due to the table's KMS key
    # being inaccessible for more than seven days. An On-Demand backup was created at the archival
    # time.
    @[JSON::Field(key: "ArchivalReason")]
    property archival_reason : String | Nil

    # The Amazon Resource Name (ARN) of the backup the table was archived to, when applicable in the
    # archival reason. If you wish to restore this backup to the same table name, you will need to
    # delete the original table.
    @[JSON::Field(key: "ArchivalBackupArn")]
    property archival_backup_arn : String | Nil

    def initialize(
      @archival_date_time : Time | Nil = nil,
      @archival_reason : String | Nil = nil,
      @archival_backup_arn : String | Nil = nil,
    )
    end
  end
end
