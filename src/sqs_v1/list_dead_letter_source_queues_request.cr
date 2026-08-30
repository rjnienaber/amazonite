module Amazonite::SqsV1
  class ListDeadLetterSourceQueuesRequest
    include JSON::Serializable

    # The URL of a dead-letter queue.
    #
    # Queue URLs and names are case-sensitive.
    @[JSON::Field(key: "QueueUrl")]
    property queue_url : String

    # Pagination token to request the next set of results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # Maximum number of results to include in the response. Value range is 1 to 1000. You must set
    # `MaxResults` to receive a value for `NextToken` in the response.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    def initialize(
      @queue_url : String,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
    )
    end

    def_equals_and_hash(@queue_url, @next_token, @max_results)
  end
end
