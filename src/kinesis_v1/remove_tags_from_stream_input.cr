module Amazonite::KinesisV1
  # Represents the input for `RemoveTagsFromStream`.
  class RemoveTagsFromStreamInput
    include JSON::Serializable

    # The name of the stream.
    @[JSON::Field(key: "StreamName")]
    property stream_name : String | Nil

    # A list of tag keys. Each corresponding tag is removed from the stream.
    @[JSON::Field(key: "TagKeys")]
    property tag_keys : Array(String) = [] of String

    # The ARN of the stream.
    @[JSON::Field(key: "StreamARN")]
    property stream_arn : String | Nil

    # Not Implemented. Reserved for future use.
    @[JSON::Field(key: "StreamId")]
    property stream_id : String | Nil

    def initialize(
      @tag_keys : Array(String),
      @stream_name : String | Nil = nil,
      @stream_arn : String | Nil = nil,
      @stream_id : String | Nil = nil,
    )
    end
  end
end
