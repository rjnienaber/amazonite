module Amazonite::KinesisV1
  # Represents the input for DeleteStream.
  class DeleteStreamInput
    include JSON::Serializable

    # The name of the stream to delete.
    @[JSON::Field(key: "StreamName")]
    property stream_name : String | Nil

    # If this parameter is unset (`null`) or if you set it to `false`, and the stream has registered
    # consumers, the call to `DeleteStream` fails with a `ResourceInUseException`.
    @[JSON::Field(key: "EnforceConsumerDeletion")]
    property enforce_consumer_deletion : Bool | Nil

    # The ARN of the stream.
    @[JSON::Field(key: "StreamARN")]
    property stream_arn : String | Nil

    # Not Implemented. Reserved for future use.
    @[JSON::Field(key: "StreamId")]
    property stream_id : String | Nil

    def initialize(
      @stream_name : String | Nil = nil,
      @enforce_consumer_deletion : Bool | Nil = nil,
      @stream_arn : String | Nil = nil,
      @stream_id : String | Nil = nil,
    )
    end
  end
end
