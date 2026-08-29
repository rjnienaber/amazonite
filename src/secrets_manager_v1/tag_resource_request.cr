module Amazonite::SecretsManagerV1
  class TagResourceRequest
    include JSON::Serializable

    @[JSON::Field(key: "SecretId")]
    property secret_id : String

    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) = [] of Tag

    def initialize(
      @secret_id : String,
      @tags : Array(Tag),
    )
    end
  end
end
