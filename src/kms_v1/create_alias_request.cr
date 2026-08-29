module Amazonite::KmsV1
  class CreateAliasRequest
    include JSON::Serializable

    @[JSON::Field(key: "AliasName")]
    property alias_name : String

    @[JSON::Field(key: "TargetKeyId")]
    property target_key_id : String

    def initialize(
      @alias_name : String,
      @target_key_id : String,
    )
    end
  end
end
