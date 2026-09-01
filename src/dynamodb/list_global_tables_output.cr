private alias Core = Amazonite::Core

module Amazonite::DynamoDB
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

    def validate! : Nil
      if value = @global_tables
        value.each(&.validate!)
      end

      if value = @last_evaluated_global_table_name
        raise Core::ValidationError.new("LastEvaluatedGlobalTableName length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("LastEvaluatedGlobalTableName length must be <= 255") if value.size > 255
        raise Core::ValidationError.new("LastEvaluatedGlobalTableName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end
    end

    def_equals_and_hash(@global_tables, @last_evaluated_global_table_name)
  end
end
