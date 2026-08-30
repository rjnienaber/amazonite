private alias AK = Amazonite::KmsV1
private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class ListKeyRotationsRequest
    include JSON::Serializable

    # Gets the key rotations for the specified KMS key.
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

    # Use this optional parameter to control which key materials associated with this key are listed
    # in the response. The default value of this parameter is `ROTATIONS_ONLY`. If you omit this
    # parameter, KMS returns information on the key materials created by automatic or on-demand key
    # rotation. When you specify a value of `ALL_KEY_MATERIAL`, KMS adds the first key material and
    # any imported key material pending rotation to the response. This parameter can only be used with
    # KMS keys that support automatic or on-demand key rotation.
    @[JSON::Field(key: "IncludeKeyMaterial", converter: AK::IncludeKeyMaterial)]
    property include_key_material : IncludeKeyMaterial | Nil

    # Use this parameter to specify the maximum number of items to return. When this value is present,
    # KMS does not return more than the specified number of items, but it might return fewer.
    #
    # This value is optional. If you include a value, it must be between 1 and 1000, inclusive. If you
    # do not include a value, it defaults to 100.
    @[JSON::Field(key: "Limit")]
    property limit : Int32 | Nil

    # Use this parameter in a subsequent request after you receive a response with truncated results.
    # Set it to the value of `NextMarker` from the truncated response you just received.
    @[JSON::Field(key: "Marker")]
    property marker : String | Nil

    def initialize(
      @key_id : String,
      @include_key_material : IncludeKeyMaterial | Nil = nil,
      @limit : Int32 | Nil = nil,
      @marker : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @key_id
        raise Core::ValidationError.new("KeyId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("KeyId length must be <= 2048") if value.size > 2048
      end

      if value = @limit
        raise Core::ValidationError.new("Limit value must be >= 1") if value < 1
        raise Core::ValidationError.new("Limit value must be <= 1000") if value > 1000
      end

      if value = @marker
        raise Core::ValidationError.new("Marker length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Marker length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("Marker does not match the required pattern") unless value.matches?(Regex.new("^[ -ÿ]*$"))
      end
    end

    def_equals_and_hash(@key_id, @include_key_material, @limit, @marker)
  end
end
