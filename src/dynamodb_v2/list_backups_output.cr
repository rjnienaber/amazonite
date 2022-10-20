module Amazonite::DynamoDBv2
  class ListBackupsOutput
    include JSON::Serializable

    @[JSON::Field(key: "BackupSummaries")]
    property backup_summaries : Array(BackupSummary) | Nil

    @[JSON::Field(key: "LastEvaluatedBackupArn")]
    property last_evaluated_backup_arn : String | Nil

    def initialize(
      @backup_summaries : Array(BackupSummary) | Nil = nil,
      @last_evaluated_backup_arn : String | Nil = nil
    )
    end
  end
end
