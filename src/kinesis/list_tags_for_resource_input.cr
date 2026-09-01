private alias Core = Amazonite::Core

module Amazonite::Kinesis
  class ListTagsForResourceInput
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the Kinesis resource for which to list tags.
    @[JSON::Field(key: "ResourceARN")]
    property resource_arn : String

    # Not Implemented. Reserved for future use.
    @[JSON::Field(key: "StreamId")]
    property stream_id : String | Nil

    def initialize(
      @resource_arn : String,
      @stream_id : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @resource_arn
        raise Core::ValidationError.new("ResourceARN length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ResourceARN length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("ResourceARN does not match the required pattern") unless value.matches?(Regex.new("^arn:aws.*:kinesis:.*:\\d{12}:.*stream/\\S+$"))
      end

      if value = @stream_id
        raise Core::ValidationError.new("StreamId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StreamId length must be <= 24") if value.size > 24
        raise Core::ValidationError.new("StreamId does not match the required pattern") unless value.matches?(Regex.new("^[a-z0-9]{20}-[a-z0-9]{3}$"))
      end
    end

    def_equals_and_hash(@resource_arn, @stream_id)
  end
end
