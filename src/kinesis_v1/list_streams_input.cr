private alias Core = Amazonite::Core

module Amazonite::KinesisV1
  # Represents the input for `ListStreams`.
  class ListStreamsInput
    include JSON::Serializable

    # The maximum number of streams to list. The default value is 100. If you specify a value greater
    # than 100, at most 100 results are returned.
    @[JSON::Field(key: "Limit")]
    property limit : Int32 | Nil

    # The name of the stream to start the list with.
    @[JSON::Field(key: "ExclusiveStartStreamName")]
    property exclusive_start_stream_name : String | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @limit : Int32 | Nil = nil,
      @exclusive_start_stream_name : String | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @limit
        raise Core::ValidationError.new("Limit value must be >= 1") if value < 1
        raise Core::ValidationError.new("Limit value must be <= 10000") if value > 10000
      end

      if value = @exclusive_start_stream_name
        raise Core::ValidationError.new("ExclusiveStartStreamName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ExclusiveStartStreamName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("ExclusiveStartStreamName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end

      if value = @next_token
        raise Core::ValidationError.new("NextToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NextToken length must be <= 1048576") if value.size > 1048576
      end
    end

    def_equals_and_hash(@limit, @exclusive_start_stream_name, @next_token)
  end
end
