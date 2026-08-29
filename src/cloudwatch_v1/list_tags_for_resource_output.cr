module Amazonite::CloudWatchV1
  class ListTagsForResourceOutput
    include JSON::Serializable

    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    def initialize(
      @tags : Array(Tag) | Nil = nil,
    )
    end
  end
end
