module Amazonite::KinesisV1
  class ListTagsForResourceOutput
    include JSON::Serializable

    # An array of tags associated with the specified Kinesis resource.
    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    def initialize(
      @tags : Array(Tag) | Nil = nil,
    )
    end
  end
end
