private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  # Represents the input of a `ListTables` operation.
  class ListTablesInput
    include JSON::Serializable

    # The first table name that this operation will evaluate. Use the value that was returned for
    # `LastEvaluatedTableName` in a previous operation, so that you can obtain the next page of
    # results.
    @[JSON::Field(key: "ExclusiveStartTableName")]
    property exclusive_start_table_name : String | Nil

    # A maximum number of table names to return. If this parameter is not specified, the limit is 100.
    @[JSON::Field(key: "Limit")]
    property limit : Int32 | Nil

    def initialize(
      @exclusive_start_table_name : String | Nil = nil,
      @limit : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @exclusive_start_table_name
        raise Core::ValidationError.new("ExclusiveStartTableName length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("ExclusiveStartTableName length must be <= 255") if value.size > 255
        raise Core::ValidationError.new("ExclusiveStartTableName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end

      if value = @limit
        raise Core::ValidationError.new("Limit value must be >= 1") if value < 1
        raise Core::ValidationError.new("Limit value must be <= 100") if value > 100
      end
    end

    def_equals_and_hash(@exclusive_start_table_name, @limit)
  end
end
