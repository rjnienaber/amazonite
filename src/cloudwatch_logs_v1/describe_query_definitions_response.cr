module Amazonite::CloudWatchLogsV1
  class DescribeQueryDefinitionsResponse
    include JSON::Serializable

    # The list of query definitions that match your request.
    @[JSON::Field(key: "queryDefinitions")]
    property query_definitions : Array(QueryDefinition) | Nil

    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    def initialize(
      @query_definitions : Array(QueryDefinition) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
