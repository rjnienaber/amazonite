private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @query_id
        raise Core::ValidationError.new("queryId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("queryId length must be <= 256") if value.size > 256
      end

      if value = @next_token
        raise Core::ValidationError.new("nextToken length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("nextToken length must be <= 1024") if value.size > 1024
      end

      if value = @max_items
        raise Core::ValidationError.new("maxItems value must be >= 0") if value < 0
        raise Core::ValidationError.new("maxItems value must be <= 10000") if value > 10000
      end
    end

    def_equals_and_hash(@query_id, @next_token, @max_items)
  end
end
