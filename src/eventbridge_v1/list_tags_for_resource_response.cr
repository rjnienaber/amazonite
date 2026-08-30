module Amazonite::EventBridgeV1
  class ListTagsForResourceResponse
    include JSON::Serializable

    # The list of tag keys and values associated with the resource you specified
    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    def initialize(
      @tags : Array(Tag) | Nil = nil,
    )
    end
  end
end
