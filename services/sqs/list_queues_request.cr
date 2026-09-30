module Amazonite::Sqs
  class ListQueuesRequest
    include JSON::Serializable

    # A string to use for filtering the list results. Only those queues whose name begins with the
    # specified string are returned.
    #
    # Queue URLs and names are case-sensitive.
    @[JSON::Field(key: "QueueNamePrefix")]
    property queue_name_prefix : String | Nil

    # Pagination token to request the next set of results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # Maximum number of results to include in the response. Value range is 1 to 1000. You must set
    # `MaxResults` to receive a value for `NextToken` in the response.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    def initialize(
      @queue_name_prefix : String | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@queue_name_prefix, @next_token, @max_results)
  end
end
