module Amazonite::KmsV1
  class TagResourceRequest
    include JSON::Serializable

    @[JSON::Field(key: "KeyId")]
    property key_id : String

    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) = [] of Tag

    def initialize(
      @key_id : String,
      @tags : Array(Tag),
    )
    end
  end
end
