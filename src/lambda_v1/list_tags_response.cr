module Amazonite::LambdaV1
  class ListTagsResponse
    include JSON::Serializable

    @[JSON::Field(key: "Tags")]
    property tags : Hash(String, String) | Nil

    def initialize(
      @tags : Hash(String, String) | Nil = nil,
    )
    end
  end
end
