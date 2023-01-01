module Amazonite::SsmV1
  class ListTagsForResourceResult
    include JSON::Serializable

    @[JSON::Field(key: "TagList")]
    property tag_list : Array(Tag) | Nil

    def initialize(
      @tag_list : Array(Tag) | Nil = nil
    )
    end
  end
end
