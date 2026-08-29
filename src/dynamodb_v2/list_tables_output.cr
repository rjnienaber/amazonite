module Amazonite::DynamoDBV2
  # Represents the output of a `ListTables` operation.
  class ListTablesOutput
    include JSON::Serializable

    # The names of the tables associated with the current account at the current endpoint. The maximum
    # size of this array is 100.
    #
    # If `LastEvaluatedTableName` also appears in the output, you can use this value as the
    # `ExclusiveStartTableName` parameter in a subsequent `ListTables` request and obtain the next
    # page of results.
    @[JSON::Field(key: "TableNames")]
    property table_names : Array(String) | Nil

    # The name of the last table in the current page of results. Use this value as the
    # `ExclusiveStartTableName` in a new request to obtain the next page of results, until all the
    # table names are returned.
    #
    # If you do not receive a `LastEvaluatedTableName` value in the response, this means that there
    # are no more table names to be retrieved.
    @[JSON::Field(key: "LastEvaluatedTableName")]
    property last_evaluated_table_name : String | Nil

    def initialize(
      @table_names : Array(String) | Nil = nil,
      @last_evaluated_table_name : String | Nil = nil,
    )
    end
  end
end
