module Amazonite::KinesisV1
  class UntagResourceInput
    include JSON::Serializable

    # A list of tag key-value pairs. Existing tags of the resource whose keys are members of this list
    # will be removed from the Kinesis resource.
    @[JSON::Field(key: "TagKeys")]
    property tag_keys : Array(String) = [] of String

    # The Amazon Resource Name (ARN) of the Kinesis resource from which to remove tags.
    @[JSON::Field(key: "ResourceARN")]
    property resource_arn : String

    # Not Implemented. Reserved for future use.
    @[JSON::Field(key: "StreamId")]
    property stream_id : String | Nil

    def initialize(
      @tag_keys : Array(String),
      @resource_arn : String,
      @stream_id : String | Nil = nil,
    )
    end
  end
end
