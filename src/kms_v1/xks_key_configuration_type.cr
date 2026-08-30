private alias Core = Amazonite::Core

module Amazonite::KmsV1
  # Information about the [external key
  # ](https://docs.aws.amazon.com/kms/latest/developerguide/keystore-external.html#concept-external-key)that
  # is associated with a KMS key in an external key store.
  #
  # This element appears in a CreateKey or DescribeKey response only for a KMS key in an external
  # key store.
  #
  # The *external key* is a symmetric encryption key that is hosted by an external key manager
  # outside of Amazon Web Services. When you use the KMS key in an external key store in a
  # cryptographic operation, the cryptographic operation is performed in the external key manager
  # using the specified external key. For more information, see [External
  # key](https://docs.aws.amazon.com/kms/latest/developerguide/keystore-external.html#concept-external-key)
  # in the *Key Management Service Developer Guide*.
  class XksKeyConfigurationType
    include JSON::Serializable

    # The ID of the external key in its external key manager. This is the ID that the external key
    # store proxy uses to identify the external key.
    @[JSON::Field(key: "Id")]
    property id : String | Nil

    def initialize(
      @id : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @id
        raise Core::ValidationError.new("Id length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Id length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("Id does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9-_.]+$"))
      end
    end

    def_equals_and_hash(@id)
  end
end
