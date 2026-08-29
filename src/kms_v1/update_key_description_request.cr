module Amazonite::KmsV1
  class UpdateKeyDescriptionRequest
    include JSON::Serializable

    @[JSON::Field(key: "KeyId")]
    property key_id : String

    @[JSON::Field(key: "Description")]
    property description : String

    def initialize(
      @key_id : String,
      @description : String,
    )
    end
  end
end
