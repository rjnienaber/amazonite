module Amazonite::DynamoDBv2
  class RestoreTableFromBackupOutput
    include JSON::Serializable

    @[JSON::Field(key: "TableDescription")]
    property table_description : TableDescription | Nil

    def initialize(
      @table_description : TableDescription | Nil = nil
    )
    end
  end
end
