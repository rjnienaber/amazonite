private alias AC = Amazonite::Core

module Amazonite::DynamoDBv2
  class ArchivalSummary
    include JSON::Serializable

    @[JSON::Field(key: "ArchivalDateTime", converter: AC::AWSEpochConverter)]
    property archival_date_time : Time | Nil

    @[JSON::Field(key: "ArchivalReason")]
    property archival_reason : String | Nil

    @[JSON::Field(key: "ArchivalBackupArn")]
    property archival_backup_arn : String | Nil

    def initialize(
      @archival_date_time : Time | Nil = nil,
      @archival_reason : String | Nil = nil,
      @archival_backup_arn : String | Nil = nil
    )
    end
  end
end
