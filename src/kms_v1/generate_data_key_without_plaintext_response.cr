private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class GenerateDataKeyWithoutPlaintextResponse
    include JSON::Serializable

    # The encrypted data key. When you use the HTTP API or the Amazon Web Services CLI, the value is
    # Base64-encoded. Otherwise, it is not Base64-encoded.
    @[JSON::Field(key: "CiphertextBlob", converter: Core::Base64Converter)]
    property ciphertext_blob : Bytes | Nil

    # The Amazon Resource Name ([key
    # ARN](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN)) of the
    # KMS key that encrypted the data key.
    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    # The identifier of the key material used to encrypt the data key.
    @[JSON::Field(key: "KeyMaterialId")]
    property key_material_id : String | Nil

    def initialize(
      @ciphertext_blob : Bytes | Nil = nil,
      @key_id : String | Nil = nil,
      @key_material_id : String | Nil = nil,
    )
    end

    def_equals_and_hash(@ciphertext_blob, @key_id, @key_material_id)
  end
end
