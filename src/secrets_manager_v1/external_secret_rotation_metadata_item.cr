module Amazonite::SecretsManagerV1
  class ExternalSecretRotationMetadataItem
    include JSON::Serializable

    @[JSON::Field(key: "Key")]
    property key : String | Nil

    @[JSON::Field(key: "Value")]
    property value : String | Nil

    def initialize(
      @key : String | Nil = nil,
      @value : String | Nil = nil,
    )
    end
  end
end
