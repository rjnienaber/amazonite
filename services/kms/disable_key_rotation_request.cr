private alias Core = Amazonite::Core

module Amazonite::Kms
  class DisableKeyRotationRequest
    include JSON::Serializable

    # Identifies a symmetric encryption KMS key. You cannot enable or disable automatic rotation of
    # [asymmetric KMS
    # keys](https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html#asymmetric-cmks),
    # [HMAC KMS keys](https://docs.aws.amazon.com/kms/latest/developerguide/hmac.html), KMS keys with
    # [imported key
    # material](https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html), or KMS
    # keys in a [custom key
    # store](https://docs.aws.amazon.com/kms/latest/developerguide/key-store-overview.html).
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

    def initialize(
      @key_id : String,
    )
    end

    def validate! : Nil
      if value = @key_id
        raise Core::ValidationError.new("KeyId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("KeyId length must be <= 2048") if value.size > 2048
      end
    end

    def_equals_and_hash(@key_id)
  end
end
