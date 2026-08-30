module Amazonite::KinesisV1
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
  end
end
