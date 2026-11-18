private alias Core = Amazonite::Core

module Amazonite::Kinesis
  class ListQueuesOutput
    include JSON::Serializable

    # A summary of each queue that matched the request.
    @[JSON::Field(key: "QueueSummaries")]
    property queue_summaries : Array(QueueSummary) = [] of QueueSummary

    # The token to pass to the next `ListQueues` request to retrieve the next page of queue summaries.
    # This member is absent when no more queues are available.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @queue_summaries : Array(QueueSummary),
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @queue_summaries
        value.each(&.validate!)
      end

      if value = @next_token
        raise Core::ValidationError.new("NextToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NextToken length must be <= 1048576") if value.size > 1048576
      end
    end

    def_equals_and_hash(@queue_summaries, @next_token)
  end
end
