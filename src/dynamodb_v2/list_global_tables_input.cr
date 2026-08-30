module Amazonite::DynamoDBV2
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

    def_equals_and_hash(@exclusive_start_global_table_name, @limit, @region_name)
  end
end
