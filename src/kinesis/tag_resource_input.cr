private alias Core = Amazonite::Core

module Amazonite::Kinesis
  class TagResourceInput
    include JSON::Serializable

    # An array of tags to be added to the Kinesis resource. A tag consists of a required key and an
    # optional value. You can add up to 50 tags per resource.
    #
    # Tags may only contain Unicode letters, digits, white space, or these symbols: _ . : / = + - @.
    @[JSON::Field(key: "Tags")]
    property tags : Hash(String, String)

    # The Amazon Resource Name (ARN) of the Kinesis resource to which to add tags.
    @[JSON::Field(key: "ResourceARN")]
    property resource_arn : String

    # Not Implemented. Reserved for future use.
    @[JSON::Field(key: "StreamId")]
    property stream_id : String | Nil

    def initialize(
      @tags : Hash(String, String),
      @resource_arn : String,
      @stream_id : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @tags
        raise Core::ValidationError.new("Tags must have at least 1 entry(s)") if value.size < 1
        raise Core::ValidationError.new("Tags must have at most 200 entry(s)") if value.size > 200
      end

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

    def_equals_and_hash(@tags, @resource_arn, @stream_id)
  end
end
