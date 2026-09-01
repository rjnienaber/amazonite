module Amazonite::Sqs
  # A list of your queues.
  class ListQueuesResult
    include JSON::Serializable

    # A list of queue URLs, up to 1,000 entries, or the value of `MaxResults` that you sent in the
    # request.
    @[JSON::Field(key: "QueueUrls")]
    property queue_urls : Array(String) | Nil

    # Pagination token to include in the next request. Token value is `null` if there are no
    # additional results to request, or if you did not set `MaxResults` in the request.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @queue_urls : Array(String) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@queue_urls, @next_token)
  end
end
