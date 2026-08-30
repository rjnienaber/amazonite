private alias AK = Amazonite::KinesisV1
private alias Core = Amazonite::Core

module Amazonite::KinesisV1
  # An object that represents the details of a registered consumer. This type of object is returned
  # by DescribeStreamConsumer.
  class ConsumerDescription
    include JSON::Serializable

    # The name of the consumer is something you choose when you register the consumer.
    @[JSON::Field(key: "ConsumerName")]
    property consumer_name : String

    # When you register a consumer, Kinesis Data Streams generates an ARN for it. You need this ARN to
    # be able to call SubscribeToShard.
    #
    # If you delete a consumer and then create a new one with the same name, it won't have the same
    # ARN. That's because consumer ARNs contain the creation timestamp. This is important to keep in
    # mind if you have IAM policies that reference consumer ARNs.
    @[JSON::Field(key: "ConsumerARN")]
    property consumer_arn : String

    # A consumer can't read data while in the `CREATING` or `DELETING` states.
    @[JSON::Field(key: "ConsumerStatus", converter: AK::ConsumerStatus)]
    property consumer_status : ConsumerStatus

    @[JSON::Field(key: "ConsumerCreationTimestamp", converter: Core::AWSEpochConverter)]
    property consumer_creation_timestamp : Time

    # The ARN of the stream with which you registered the consumer.
    @[JSON::Field(key: "StreamARN")]
    property stream_arn : String

    def initialize(
      @consumer_name : String,
      @consumer_arn : String,
      @consumer_status : ConsumerStatus,
      @consumer_creation_timestamp : Time,
      @stream_arn : String,
    )
    end

    def validate! : Nil
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

      if value = @stream_arn
        raise Core::ValidationError.new("StreamARN length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StreamARN length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("StreamARN does not match the required pattern") unless value.matches?(Regex.new("^arn:aws.*:kinesis:.*:\\d{12}:stream/\\S+$"))
      end
    end

    def_equals_and_hash(@consumer_name, @consumer_arn, @consumer_status, @consumer_creation_timestamp, @stream_arn)
  end
end
