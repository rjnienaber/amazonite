private alias AK = Amazonite::Kms
private alias Core = Amazonite::Core

module Amazonite::Kms
  class ImportKeyMaterialRequest
    include JSON::Serializable

    # The identifier of the KMS key that will be associated with the imported key material. This must
    # be the same KMS key specified in the `KeyID` parameter of the corresponding
    # GetParametersForImport request. The `Origin` of the KMS key must be `EXTERNAL` and its
    # `KeyState` must be `PendingImport`.
    #
    # The KMS key can be a symmetric encryption KMS key, HMAC KMS key, asymmetric encryption KMS key,
    # or asymmetric signing KMS key, including a [multi-Region
    # key](https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html) of
    # any supported type. You cannot perform this operation on a KMS key in a custom key store, or on
    # a KMS key in a different Amazon Web Services account.
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

    # The import token that you received in the response to a previous GetParametersForImport request.
    # It must be from the same response that contained the public key that you used to encrypt the key
    # material.
    @[JSON::Field(key: "ImportToken", converter: Core::Base64Converter)]
    property import_token : Bytes

    # The encrypted key material to import. The key material must be encrypted under the public
    # wrapping key that GetParametersForImport returned, using the wrapping algorithm that you
    # specified in the same `GetParametersForImport` request.
    @[JSON::Field(key: "EncryptedKeyMaterial", converter: Core::Base64Converter)]
    property encrypted_key_material : Bytes

    # The date and time when the imported key material expires. This parameter is required when the
    # value of the `ExpirationModel` parameter is `KEY_MATERIAL_EXPIRES`. Otherwise it is not valid.
    #
    # The value of this parameter must be a future date and time. The maximum value is 365 days from
    # the request date.
    #
    # When the key material expires, KMS deletes the key material from the KMS key. Without its key
    # material, the KMS key is unusable. To use the KMS key in cryptographic operations, you must
    # reimport the same key material.
    #
    # You cannot change the `ExpirationModel` or `ValidTo` values for the current import after the
    # request completes. To change either value, you must delete (DeleteImportedKeyMaterial) and
    # reimport the key material.
    @[JSON::Field(key: "ValidTo", converter: Core::AWSEpochConverter)]
    property valid_to : Time | Nil

    # Specifies whether the key material expires. The default is `KEY_MATERIAL_EXPIRES`. For help with
    # this choice, see [Setting an expiration
    # time](https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys-import-key-material.html#importing-keys-expiration)
    # in the *Key Management Service Developer Guide*.
    #
    # When the value of `ExpirationModel` is `KEY_MATERIAL_EXPIRES`, you must specify a value for the
    # `ValidTo` parameter. When value is `KEY_MATERIAL_DOES_NOT_EXPIRE`, you must omit the `ValidTo`
    # parameter.
    #
    # You cannot change the `ExpirationModel` or `ValidTo` values for the current import after the
    # request completes. To change either value, you must reimport the key material.
    @[JSON::Field(key: "ExpirationModel", converter: AK::ExpirationModelType)]
    property expiration_model : ExpirationModelType | Nil

    # Indicates whether the key material being imported is previously associated with this KMS key or
    # not. This parameter is optional and only usable with symmetric encryption keys. If no key
    # material has ever been imported into the KMS key, and this parameter is omitted, the parameter
    # defaults to `NEW_KEY_MATERIAL`. After the first key material is imported, if this parameter is
    # omitted then the parameter defaults to `EXISTING_KEY_MATERIAL`.
    #
    # For multi-Region keys, you must first import new key material into the primary Region key. You
    # should use the `NEW_KEY_MATERIAL` import type when importing key material into the primary
    # Region key. Then, you can import the same key material into the replica Region key. The import
    # type for the replica Region key should be `EXISTING_KEY_MATERIAL`.
    @[JSON::Field(key: "ImportType", converter: AK::ImportType)]
    property import_type : ImportType | Nil

    # Description for the key material being imported. This parameter is optional and only usable with
    # symmetric encryption keys. If you do not specify a key material description, KMS retains the
    # value you specified when you last imported the same key material into this KMS key.
    @[JSON::Field(key: "KeyMaterialDescription")]
    property key_material_description : String | Nil

    # Identifies the key material being imported. This parameter is optional and only usable with
    # symmetric encryption keys. You cannot specify a key material ID with `ImportType` set to
    # `NEW_KEY_MATERIAL`. Whenever you import key material into a symmetric encryption key, KMS
    # assigns a unique identifier to the key material based on the KMS key ID and the imported key
    # material. When you re-import key material with a specified key material ID, KMS:
    #
    # - Computes the identifier for the key material
    #
    # - Matches the computed identifier against the specified key material ID
    #
    # - Verifies that the key material ID is already associated with the KMS key
    #
    # To get the list of key material IDs associated with a KMS key, use ListKeyRotations.
    @[JSON::Field(key: "KeyMaterialId")]
    property key_material_id : String | Nil

    def initialize(
      @key_id : String,
      @import_token : Bytes,
      @encrypted_key_material : Bytes,
      @valid_to : Time | Nil = nil,
      @expiration_model : ExpirationModelType | Nil = nil,
      @import_type : ImportType | Nil = nil,
      @key_material_description : String | Nil = nil,
      @key_material_id : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @key_id
        raise Core::ValidationError.new("KeyId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("KeyId length must be <= 2048") if value.size > 2048
      end

      if value = @import_token
        raise Core::ValidationError.new("ImportToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ImportToken length must be <= 6144") if value.size > 6144
      end

      if value = @encrypted_key_material
        raise Core::ValidationError.new("EncryptedKeyMaterial length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("EncryptedKeyMaterial length must be <= 6144") if value.size > 6144
      end

      if value = @key_material_description
        raise Core::ValidationError.new("KeyMaterialDescription length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("KeyMaterialDescription length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("KeyMaterialDescription does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9:/_\\s.-]+$"))
      end

      if value = @key_material_id
        raise Core::ValidationError.new("KeyMaterialId length must be >= 64") if value.size < 64
        raise Core::ValidationError.new("KeyMaterialId length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("KeyMaterialId does not match the required pattern") unless value.matches?(Regex.new("^[a-f0-9]+$"))
      end
    end

    def_equals_and_hash(@key_id, @import_token, @encrypted_key_material, @valid_to, @expiration_model, @import_type, @key_material_description, @key_material_id)
  end
end
