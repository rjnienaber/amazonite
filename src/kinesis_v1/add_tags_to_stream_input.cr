module Amazonite::KinesisV1
  # Represents the input for `AddTagsToStream`.
  class AddTagsToStreamInput
    include JSON::Serializable

    # The name of the stream.
    @[JSON::Field(key: "StreamName")]
    property stream_name : String | Nil

    # A set of up to 50 key-value pairs to use to create the tags. A tag consists of a required key
    # and an optional value. You can add up to 50 tags per resource.
    @[JSON::Field(key: "Tags")]
    property tags : Hash(String, String)

    # The ARN of the stream.
    @[JSON::Field(key: "StreamARN")]
    property stream_arn : String | Nil

    # Not Implemented. Reserved for future use.
    @[JSON::Field(key: "StreamId")]
    property stream_id : String | Nil

    def initialize(
      @tags : Hash(String, String),
      @stream_name : String | Nil = nil,
      @stream_arn : String | Nil = nil,
      @stream_id : String | Nil = nil,
    )
    end
  end
end
