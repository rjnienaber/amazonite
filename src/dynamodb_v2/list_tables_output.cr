module Amazonite::DynamoDBv2
  class ListTablesOutput
    include JSON::Serializable

    @[JSON::Field(key: "TableNames")]
    property table_names : Array(String) | Nil

    @[JSON::Field(key: "LastEvaluatedTableName")]
    property last_evaluated_table_name : String | Nil

    def initialize(
      @table_names : Array(String) | Nil = nil,
      @last_evaluated_table_name : String | Nil = nil
    )
    end
  end
end
