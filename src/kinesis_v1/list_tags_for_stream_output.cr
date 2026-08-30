private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @tags
        raise Core::ValidationError.new("Tags must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Tags must have at most 200 item(s)") if value.size > 200
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@tags, @has_more_tags)
  end
end
