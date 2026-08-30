module Amazonite::DynamoDBV2
  class RestoreTableToPointInTimeOutput
    include JSON::Serializable

    # Represents the properties of a table.
    @[JSON::Field(key: "TableDescription")]
    property table_description : TableDescription | Nil

    def initialize(
      @table_description : TableDescription | Nil = nil,
    )
    end

    def_equals_and_hash(@table_description)
  end
end
