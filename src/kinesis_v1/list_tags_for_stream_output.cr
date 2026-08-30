module Amazonite::KinesisV1
  # Represents the output for `ListTagsForStream`.
  class ListTagsForStreamOutput
    include JSON::Serializable

    # A list of tags associated with `StreamName`, starting with the first tag after
    # `ExclusiveStartTagKey` and up to the specified `Limit`.
    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) = [] of Tag

    # If set to `true`, more tags are available. To request additional tags, set
    # `ExclusiveStartTagKey` to the key of the last tag returned.
    @[JSON::Field(key: "HasMoreTags")]
    property has_more_tags : Bool

    def initialize(
      @tags : Array(Tag),
      @has_more_tags : Bool,
    )
    end
  end
end
