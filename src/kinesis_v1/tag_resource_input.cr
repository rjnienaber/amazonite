module Amazonite::KinesisV1
  class TagResourceInput
    include JSON::Serializable

    # An array of tags to be added to the Kinesis resource. A tag consists of a required key and an
    # optional value. You can add up to 50 tags per resource.
    #
    # Tags may only contain Unicode letters, digits, white space, or these symbols: _ . : / = + - @.
    @[JSON::Field(key: "Tags")]
    property tags : Hash(String, String)

    # The Amazon Resource Name (ARN) of the Kinesis resource to which to add tags.
    @[JSON::Field(key: "ResourceARN")]
    property resource_arn : String

    # Not Implemented. Reserved for future use.
    @[JSON::Field(key: "StreamId")]
    property stream_id : String | Nil

    def initialize(
      @tags : Hash(String, String),
      @resource_arn : String,
      @stream_id : String | Nil = nil,
    )
    end
  end
end
