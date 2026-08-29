module Amazonite::SecretsManagerV1
  class UntagResourceRequest
    include JSON::Serializable

    @[JSON::Field(key: "SecretId")]
    property secret_id : String

    @[JSON::Field(key: "TagKeys")]
    property tag_keys : Array(String) = [] of String

    def initialize(
      @secret_id : String,
      @tag_keys : Array(String),
    )
    end
  end
end
