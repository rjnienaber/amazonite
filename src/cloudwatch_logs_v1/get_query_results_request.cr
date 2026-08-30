module Amazonite::CloudWatchLogsV1
  class GetQueryResultsRequest
    include JSON::Serializable

    # The ID number of the query.
    @[JSON::Field(key: "queryId")]
    property query_id : String

    # The token for the next set of items to return. The token expires after 1 hour.
    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    # The maximum number of log events to return in the response. The maximum is 10,000 log events per
    # request. You can retrieve up to 100,000 log event results from a query by paginating with the
    # `nextToken`.
    @[JSON::Field(key: "maxItems")]
    property max_items : Int32 | Nil

    def initialize(
      @query_id : String,
      @next_token : String | Nil = nil,
      @max_items : Int32 | Nil = nil,
    )
    end

    def_equals_and_hash(@query_id, @next_token, @max_items)
  end
end
