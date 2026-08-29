module Amazonite::DynamoDBV2
  class ListGlobalTablesOutput
    include JSON::Serializable

    # List of global table names.
    @[JSON::Field(key: "GlobalTables")]
    property global_tables : Array(GlobalTable) | Nil

    # Last evaluated global table name.
    @[JSON::Field(key: "LastEvaluatedGlobalTableName")]
    property last_evaluated_global_table_name : String | Nil

    def initialize(
      @global_tables : Array(GlobalTable) | Nil = nil,
      @last_evaluated_global_table_name : String | Nil = nil,
    )
    end
  end
end
