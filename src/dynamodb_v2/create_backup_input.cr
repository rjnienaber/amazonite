module Amazonite::DynamoDBv2
  class CreateBackupInput
    include JSON::Serializable

    @[JSON::Field(key: "TableName")]
    property table_name : String

    @[JSON::Field(key: "BackupName")]
    property backup_name : String

    def initialize(
      @table_name : String,
      @backup_name : String
    )
    end
  end
end
