module Amazonite::KmsV1
  class UpdateAliasRequest
    include JSON::Serializable

    # Identifies the alias that is changing its KMS key. This value must begin with `alias/` followed
    # by the alias name, such as `alias/ExampleAlias`. You cannot use `UpdateAlias` to change the
    # alias name.
    #
    # Do not include confidential or sensitive information in this field. This field may be displayed
    # in plaintext in CloudTrail logs and other output.
    @[JSON::Field(key: "AliasName")]
    property alias_name : String

    # Identifies the [customer managed
    # key](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-mgn-key) to
    # associate with the alias. You don't have permission to associate an alias with an [Amazon Web
    # Services managed
    # key](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-key).
    #
    # The KMS key must be in the same Amazon Web Services account and Region as the alias. Also, the
    # new target KMS key must be the same type as the current target KMS key (both symmetric or both
    # asymmetric or both HMAC) and they must have the same key usage.
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
    #
    # To verify that the alias is mapped to the correct KMS key, use ListAliases.
    @[JSON::Field(key: "TargetKeyId")]
    property target_key_id : String

    def initialize(
      @alias_name : String,
      @target_key_id : String,
    )
    end
  end
end
