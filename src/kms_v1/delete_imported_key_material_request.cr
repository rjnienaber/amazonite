module Amazonite::KmsV1
  class DeleteImportedKeyMaterialRequest
    include JSON::Serializable

    # Identifies the KMS key from which you are deleting imported key material. The `Origin` of the
    # KMS key must be `EXTERNAL`.
    #
    # Specify the key ID or key ARN of the KMS key.
    #
    # For example:
    #
    # - Key ID: `1234abcd-12ab-34cd-56ef-1234567890ab`
    #
    # - Key ARN: `arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab`
    #
    # To get the key ID and key ARN for a KMS key, use ListKeys or DescribeKey.
    @[JSON::Field(key: "KeyId")]
    property key_id : String

    # Identifies the imported key material you are deleting.
    #
    # If no KeyMaterialId is specified, KMS deletes the current key material.
    #
    # To get the list of key material IDs associated with a KMS key, use ListKeyRotations.
    @[JSON::Field(key: "KeyMaterialId")]
    property key_material_id : String | Nil

    def initialize(
      @key_id : String,
      @key_material_id : String | Nil = nil,
    )
    end

    def_equals_and_hash(@key_id, @key_material_id)
  end
end
