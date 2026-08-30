module Amazonite::SecretsManagerV1
  # A custom type that specifies a `Region` and the `KmsKeyId` for a replica secret.
  class ReplicaRegionType
    include JSON::Serializable

    # A Region code. For a list of Region codes, see [Name and code of
    # Regions](https://docs.aws.amazon.com/general/latest/gr/rande.html#regional-endpoints).
    @[JSON::Field(key: "Region")]
    property region : String | Nil

    # The ARN, key ID, or alias of the KMS key to encrypt the secret. If you don't include this field,
    # Secrets Manager uses `aws/secretsmanager`.
    @[JSON::Field(key: "KmsKeyId")]
    property kms_key_id : String | Nil

    def initialize(
      @region : String | Nil = nil,
      @kms_key_id : String | Nil = nil,
    )
    end

    def_equals_and_hash(@region, @kms_key_id)
  end
end
