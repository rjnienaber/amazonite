module Amazonite::KinesisV1
  # Represents the input for `ListTagsForStream`.
  class ListTagsForStreamInput
    include JSON::Serializable

    # The name of the stream.
    @[JSON::Field(key: "StreamName")]
    property stream_name : String | Nil

    # The key to use as the starting point for the list of tags. If this parameter is set,
    # `ListTagsForStream` gets all tags that occur after `ExclusiveStartTagKey`.
    @[JSON::Field(key: "ExclusiveStartTagKey")]
    property exclusive_start_tag_key : String | Nil

    # The number of tags to return. If this number is less than the total number of tags associated
    # with the stream, `HasMoreTags` is set to `true`. To list additional tags, set
    # `ExclusiveStartTagKey` to the last key in the response.
    @[JSON::Field(key: "Limit")]
    property limit : Int32 | Nil

    # The ARN of the stream.
    @[JSON::Field(key: "StreamARN")]
    property stream_arn : String | Nil

    # Not Implemented. Reserved for future use.
    @[JSON::Field(key: "StreamId")]
    property stream_id : String | Nil

    def initialize(
      @stream_name : String | Nil = nil,
      @exclusive_start_tag_key : String | Nil = nil,
      @limit : Int32 | Nil = nil,
      @stream_arn : String | Nil = nil,
      @stream_id : String | Nil = nil,
    )
    end
  end
end
