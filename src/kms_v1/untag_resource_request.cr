module Amazonite::KmsV1
  class UntagResourceRequest
    include JSON::Serializable

    @[JSON::Field(key: "KeyId")]
    property key_id : String

    @[JSON::Field(key: "TagKeys")]
    property tag_keys : Array(String) = [] of String

    def initialize(
      @key_id : String,
      @tag_keys : Array(String),
    )
    end
  end
end
