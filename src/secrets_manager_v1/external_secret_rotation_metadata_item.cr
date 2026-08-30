module Amazonite::SecretsManagerV1
  # The metadata needed to successfully rotate a managed external secret. A list of key value pairs
  # in JSON format specified by the partner. For more information, see [Managed external secret
  # partners](https://docs.aws.amazon.com/secretsmanager/latest/userguide/mes-partners.html).
  class ExternalSecretRotationMetadataItem
    include JSON::Serializable

    # The key that identifies the item.
    @[JSON::Field(key: "Key")]
    property key : String | Nil

    # The value of the specified item.
    @[JSON::Field(key: "Value")]
    property value : String | Nil

    def initialize(
      @key : String | Nil = nil,
      @value : String | Nil = nil,
    )
    end

    def_equals_and_hash(@key, @value)
  end
end
