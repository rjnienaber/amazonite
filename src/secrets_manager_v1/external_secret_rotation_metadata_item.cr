private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @key
        raise Core::ValidationError.new("Key length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Key length must be <= 256") if value.size > 256
      end

      if value = @value
        raise Core::ValidationError.new("Value length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Value length must be <= 2048") if value.size > 2048
      end
    end

    def_equals_and_hash(@key, @value)
  end
end
