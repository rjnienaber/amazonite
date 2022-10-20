private alias AC = Amazonite::Core

module Amazonite::DynamoDBv2
  class RestoreSummary
    include JSON::Serializable

    @[JSON::Field(key: "SourceBackupArn")]
    property source_backup_arn : String | Nil

    @[JSON::Field(key: "SourceTableArn")]
    property source_table_arn : String | Nil

    @[JSON::Field(key: "RestoreDateTime", converter: AC::AWSEpochConverter)]
    property restore_date_time : Time

    @[JSON::Field(key: "RestoreInProgress")]
    property restore_in_progress : Bool

    def initialize(
      @restore_date_time : Time,
      @restore_in_progress : Bool,
      @source_backup_arn : String | Nil = nil,
      @source_table_arn : String | Nil = nil
    )
    end
  end
end