private alias Core = Amazonite::Core

module Amazonite::KinesisV1
  class RegisterStreamConsumerInput
    include JSON::Serializable

    # The ARN of the Kinesis data stream that you want to register the consumer with. For more info,
    # see [Amazon Resource Names (ARNs) and Amazon Web Services Service
    # Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kinesis-streams).
    @[JSON::Field(key: "StreamARN")]
    property stream_arn : String

    # For a given Kinesis data stream, each consumer must have a unique name. However, consumer names
    # don't have to be unique across data streams.
    @[JSON::Field(key: "ConsumerName")]
    property consumer_name : String

    # Not Implemented. Reserved for future use.
    @[JSON::Field(key: "StreamId")]
    property stream_id : String | Nil

    # A set of up to 50 key-value pairs. A tag consists of a required key and an optional value.
    @[JSON::Field(key: "Tags")]
    property tags : Hash(String, String) | Nil

    def initialize(
      @stream_arn : String,
      @consumer_name : String,
      @stream_id : String | Nil = nil,
      @tags : Hash(String, String) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @stream_arn
        raise Core::ValidationError.new("StreamARN length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StreamARN length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("StreamARN does not match the required pattern") unless value.matches?(Regex.new("^arn:aws.*:kinesis:.*:\\d{12}:stream/\\S+$"))
      end

      if value = @consumer_name
        raise Core::ValidationError.new("ConsumerName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ConsumerName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("ConsumerName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end

      if value = @stream_id
        raise Core::ValidationError.new("StreamId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StreamId length must be <= 24") if value.size > 24
        raise Core::ValidationError.new("StreamId does not match the required pattern") unless value.matches?(Regex.new("^[a-z0-9]{20}-[a-z0-9]{3}$"))
      end

      if value = @tags
        raise Core::ValidationError.new("Tags must have at least 1 entry(s)") if value.size < 1
        raise Core::ValidationError.new("Tags must have at most 200 entry(s)") if value.size > 200
      end
    end

    def_equals_and_hash(@stream_arn, @consumer_name, @stream_id, @tags)
  end
end
