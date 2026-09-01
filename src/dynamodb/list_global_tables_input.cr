private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  class ListGlobalTablesInput
    include JSON::Serializable

    # The first global table name that this operation will evaluate.
    @[JSON::Field(key: "ExclusiveStartGlobalTableName")]
    property exclusive_start_global_table_name : String | Nil

    # The maximum number of table names to return, if the parameter is not specified DynamoDB defaults
    # to 100.
    #
    # If the number of global tables DynamoDB finds reaches this limit, it stops the operation and
    # returns the table names collected up to that point, with a table name in the
    # `LastEvaluatedGlobalTableName` to apply in a subsequent operation to the
    # `ExclusiveStartGlobalTableName` parameter.
    @[JSON::Field(key: "Limit")]
    property limit : Int32 | Nil

    # Lists the global tables in a specific Region.
    @[JSON::Field(key: "RegionName")]
    property region_name : String | Nil

    def initialize(
      @exclusive_start_global_table_name : String | Nil = nil,
      @limit : Int32 | Nil = nil,
      @region_name : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @exclusive_start_global_table_name
        raise Core::ValidationError.new("ExclusiveStartGlobalTableName length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("ExclusiveStartGlobalTableName length must be <= 255") if value.size > 255
        raise Core::ValidationError.new("ExclusiveStartGlobalTableName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end

      if value = @limit
        raise Core::ValidationError.new("Limit value must be >= 1") if value < 1
      end
    end

    def_equals_and_hash(@exclusive_start_global_table_name, @limit, @region_name)
  end
end
