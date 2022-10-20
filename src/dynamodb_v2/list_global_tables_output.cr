module Amazonite::DynamoDBv2
  class ListGlobalTablesOutput
    include JSON::Serializable

    @[JSON::Field(key: "GlobalTables")]
    property global_tables : Array(GlobalTable) | Nil

    @[JSON::Field(key: "LastEvaluatedGlobalTableName")]
    property last_evaluated_global_table_name : String | Nil

    def initialize(
      @global_tables : Array(GlobalTable) | Nil = nil,
      @last_evaluated_global_table_name : String | Nil = nil
    )
    end
  end
end