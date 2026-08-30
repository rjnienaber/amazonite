module Amazonite::SqsV1
  # A list of your dead letter source queues.
  class ListDeadLetterSourceQueuesResult
    include JSON::Serializable

    # A list of source queue URLs that have the `RedrivePolicy` queue attribute configured with a
    # dead-letter queue.
    @[JSON::Field(key: "queueUrls")]
    property queue_urls : Array(String) = [] of String

    # Pagination token to include in the next request. Token value is `null` if there are no
    # additional results to request, or if you did not set `MaxResults` in the request.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @queue_urls : Array(String),
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@queue_urls, @next_token)
  end
end
