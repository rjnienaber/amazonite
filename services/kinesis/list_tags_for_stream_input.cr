private alias Core = Amazonite::Core

module Amazonite::Kinesis
  # Represents the input for `ListTagsForStream`.
  class ListTagsForStreamInput
    include JSON::Serializable

    # The name of the stream.
    @[JSON::Field(key: "StreamName")]
    property stream_name : String | Nil

    # The key to use as the starting point for the list of tags. If this parameter is set,
    # `ListTagsForStream` gets all tags that occur after `ExclusiveStartTagKey`.
    @[JSON::Field(key: "ExclusiveStartTagKey")]
    property exclusive_start_tag_key : String | Nil

    # The number of tags to return. If this number is less than the total number of tags associated
    # with the stream, `HasMoreTags` is set to `true`. To list additional tags, set
    # `ExclusiveStartTagKey` to the last key in the response.
    @[JSON::Field(key: "Limit")]
    property limit : Int32 | Nil

    # The ARN of the stream.
    @[JSON::Field(key: "StreamARN")]
    property stream_arn : String | Nil

    # Not Implemented. Reserved for future use.
    @[JSON::Field(key: "StreamId")]
    property stream_id : String | Nil

    def initialize(
      @stream_name : String | Nil = nil,
      @exclusive_start_tag_key : String | Nil = nil,
      @limit : Int32 | Nil = nil,
      @stream_arn : String | Nil = nil,
      @stream_id : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @stream_name
        raise Core::ValidationError.new("StreamName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StreamName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("StreamName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end

      if value = @exclusive_start_tag_key
        raise Core::ValidationError.new("ExclusiveStartTagKey length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ExclusiveStartTagKey length must be <= 128") if value.size > 128
      end

      if value = @limit
        raise Core::ValidationError.new("Limit value must be >= 1") if value < 1
        raise Core::ValidationError.new("Limit value must be <= 50") if value > 50
      end

      if value = @stream_arn
        raise Core::ValidationError.new("StreamARN length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StreamARN length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("StreamARN does not match the required pattern") unless value.matches?(Regex.new("^arn:aws.*:kinesis:.*:\\d{12}:stream/\\S+$"))
      end

      if value = @stream_id
        raise Core::ValidationError.new("StreamId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StreamId length must be <= 24") if value.size > 24
        raise Core::ValidationError.new("StreamId does not match the required pattern") unless value.matches?(Regex.new("^[a-z0-9]{20}-[a-z0-9]{3}$"))
      end
    end

    def_equals_and_hash(@stream_name, @exclusive_start_tag_key, @limit, @stream_arn, @stream_id)
  end
end
