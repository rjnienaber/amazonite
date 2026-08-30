private alias Core = Amazonite::Core

module Amazonite::KinesisV1
  class DescribeStreamConsumerInput
    include JSON::Serializable

    # The ARN of the Kinesis data stream that the consumer is registered with. For more information,
    # see [Amazon Resource Names (ARNs) and Amazon Web Services Service
    # Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kinesis-streams).
    @[JSON::Field(key: "StreamARN")]
    property stream_arn : String | Nil

    # The name that you gave to the consumer.
    @[JSON::Field(key: "ConsumerName")]
    property consumer_name : String | Nil

    # The ARN returned by Kinesis Data Streams when you registered the consumer.
    @[JSON::Field(key: "ConsumerARN")]
    property consumer_arn : String | Nil

    # Not Implemented. Reserved for future use.
    @[JSON::Field(key: "StreamId")]
    property stream_id : String | Nil

    def initialize(
      @stream_arn : String | Nil = nil,
      @consumer_name : String | Nil = nil,
      @consumer_arn : String | Nil = nil,
      @stream_id : String | Nil = nil,
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

      if value = @consumer_arn
        raise Core::ValidationError.new("ConsumerARN length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ConsumerARN length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("ConsumerARN does not match the required pattern") unless value.matches?(Regex.new("^(arn):aws.*:kinesis:.*:\\d{12}:.*stream\\/[a-zA-Z0-9_.-]+\\/consumer\\/[a-zA-Z0-9_.-]+:[0-9]+$"))
      end

      if value = @stream_id
        raise Core::ValidationError.new("StreamId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StreamId length must be <= 24") if value.size > 24
        raise Core::ValidationError.new("StreamId does not match the required pattern") unless value.matches?(Regex.new("^[a-z0-9]{20}-[a-z0-9]{3}$"))
      end
    end

    def_equals_and_hash(@stream_arn, @consumer_name, @consumer_arn, @stream_id)
  end
end
