module Amazonite::SecretsManagerV1
  class ReplicaRegionType
    include JSON::Serializable

    @[JSON::Field(key: "Region")]
    property region : String | Nil

    @[JSON::Field(key: "KmsKeyId")]
    property kms_key_id : String | Nil

    def initialize(
      @region : String | Nil = nil,
      @kms_key_id : String | Nil = nil,
    )
    end
  end
end
