private alias Core = Amazonite::Core

module Amazonite::Kinesis
  class ListChannelsInput
    include JSON::Serializable

    # Filters the results to channels associated with the specified streams.
    @[JSON::Field(key: "StreamFilter")]
    property stream_filter : Array(StreamFilter) | Nil

    # The maximum number of channels to return in a single call. The default value is 100. If you
    # specify a value greater than 100, at most 100 results are returned.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    # The pagination token returned by a previous call. Specify this token to retrieve the next page
    # of results. This value is `null` when there are no more results to return.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @stream_filter : Array(StreamFilter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @stream_filter
        raise Core::ValidationError.new("StreamFilter must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("StreamFilter must have at most 10000 item(s)") if value.size > 10000
        value.each(&.validate!)
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxResults value must be <= 10000") if value > 10000
      end

      if value = @next_token
        raise Core::ValidationError.new("NextToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NextToken length must be <= 1048576") if value.size > 1048576
      end
    end

    def_equals_and_hash(@stream_filter, @max_results, @next_token)
  end
end
