module Amazonite::KinesisV1
  class PutResourcePolicyInput
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the data stream or consumer.
    @[JSON::Field(key: "ResourceARN")]
    property resource_arn : String

    # Not Implemented. Reserved for future use.
    @[JSON::Field(key: "StreamId")]
    property stream_id : String | Nil

    # Details of the resource policy. It must include the identity of the principal and the actions
    # allowed on this resource. This is formatted as a JSON string.
    @[JSON::Field(key: "Policy")]
    property policy : String

    def initialize(
      @resource_arn : String,
      @policy : String,
      @stream_id : String | Nil = nil,
    )
    end
  end
end
