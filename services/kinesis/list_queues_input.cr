private alias Core = Amazonite::Core

module Amazonite::Kinesis
  class ListQueuesInput
    include JSON::Serializable

    # The maximum number of queue summaries to return in one response. The response might contain
    # fewer summaries than this value, and might contain a `NextToken` even when it contains fewer.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    # The `NextToken` returned by a previous `ListQueues` request. Use it to retrieve the next page of
    # queue summaries.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # Lists only the queues created on the specified data stream.
    @[JSON::Field(key: "StreamFilter")]
    property stream_filter : Array(QueueStreamFilter) | Nil

    def initialize(
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
      @stream_filter : Array(QueueStreamFilter) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxResults value must be <= 10000") if value > 10000
      end

      if value = @next_token
        raise Core::ValidationError.new("NextToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NextToken length must be <= 1048576") if value.size > 1048576
      end

      if value = @stream_filter
        raise Core::ValidationError.new("StreamFilter must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("StreamFilter must have at most 10000 item(s)") if value.size > 10000
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@max_results, @next_token, @stream_filter)
  end
end
