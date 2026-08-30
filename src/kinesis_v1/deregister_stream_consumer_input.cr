module Amazonite::KinesisV1
  class DeregisterStreamConsumerInput
    include JSON::Serializable

    # The ARN of the Kinesis data stream that the consumer is registered with. For more information,
    # see [Amazon Resource Names (ARNs) and Amazon Web Services Service
    # Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kinesis-streams).
    @[JSON::Field(key: "StreamARN")]
    property stream_arn : String | Nil

    # The name that you gave to the consumer.
    @[JSON::Field(key: "ConsumerName")]
    property consumer_name : String | Nil

    # The ARN returned by Kinesis Data Streams when you registered the consumer. If you don't know the
    # ARN of the consumer that you want to deregister, you can use the ListStreamConsumers operation
    # to get a list of the descriptions of all the consumers that are currently registered with a
    # given data stream. The description of a consumer contains its ARN.
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
  end
end
