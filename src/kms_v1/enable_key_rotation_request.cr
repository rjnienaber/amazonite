module Amazonite::KmsV1
  class EnableKeyRotationRequest
    include JSON::Serializable

    # Identifies a symmetric encryption KMS key. You cannot enable automatic rotation of [asymmetric
    # KMS keys](https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html),
    # [HMAC KMS keys](https://docs.aws.amazon.com/kms/latest/developerguide/hmac.html), KMS keys with
    # [imported key
    # material](https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html), or KMS
    # keys in a [custom key
    # store](https://docs.aws.amazon.com/kms/latest/developerguide/key-store-overview.html). To enable
    # or disable automatic rotation of a set of related [multi-Region
    # keys](https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html#multi-region-rotate),
    # set the property on the primary key.
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

    # Use this parameter to specify a custom period of time between each rotation date. If no value is
    # specified, the default value is 365 days.
    #
    # The rotation period defines the number of days after you enable automatic key rotation that KMS
    # will rotate your key material, and the number of days between each automatic rotation
    # thereafter.
    #
    # You can use the [ `kms:RotationPeriodInDays`
    # ](https://docs.aws.amazon.com/kms/latest/developerguide/conditions-kms.html#conditions-kms-rotation-period-in-days)
    # condition key to further constrain the values that principals can specify in the
    # `RotationPeriodInDays` parameter.
    @[JSON::Field(key: "RotationPeriodInDays")]
    property rotation_period_in_days : Int32 | Nil

    def initialize(
      @key_id : String,
      @rotation_period_in_days : Int32 | Nil = nil,
    )
    end

    def_equals_and_hash(@key_id, @rotation_period_in_days)
  end
end
