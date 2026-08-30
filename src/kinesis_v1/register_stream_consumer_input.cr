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
  end
end
