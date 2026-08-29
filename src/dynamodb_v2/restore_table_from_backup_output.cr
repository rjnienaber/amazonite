module Amazonite::DynamoDBV2
  class RestoreTableFromBackupOutput
    include JSON::Serializable

    # The description of the table created from an existing backup.
    @[JSON::Field(key: "TableDescription")]
    property table_description : TableDescription | Nil

    def initialize(
      @table_description : TableDescription | Nil = nil,
    )
    end
  end
end
