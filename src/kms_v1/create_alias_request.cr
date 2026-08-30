private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class CreateAliasRequest
    include JSON::Serializable

    # Specifies the alias name. This value must begin with `alias/` followed by a name, such as
    # `alias/ExampleAlias`.
    #
    # Do not include confidential or sensitive information in this field. This field may be displayed
    # in plaintext in CloudTrail logs and other output.
    #
    # The `AliasName` value must be string of 1-256 characters. It can contain only alphanumeric
    # characters, forward slashes (/), underscores (_), and dashes (-). The alias name cannot begin
    # with `alias/aws/`. The `alias/aws/` prefix is reserved for [Amazon Web Services managed
    # keys](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-key).
    @[JSON::Field(key: "AliasName")]
    property alias_name : String

    # Associates the alias with the specified [customer managed
    # key](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-mgn-key). The
    # KMS key must be in the same Amazon Web Services Region.
    #
    # A valid key ID is required. If you supply a null or empty string value, this operation returns
    # an error.
    #
    # For help finding the key ID and ARN, see [Find the key ID and key
    # ARN](https://docs.aws.amazon.com/kms/latest/developerguide/find-cmk-id-arn.html) in the * *Key
    # Management Service Developer Guide* *.
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
    @[JSON::Field(key: "TargetKeyId")]
    property target_key_id : String

    def initialize(
      @alias_name : String,
      @target_key_id : String,
    )
    end

    def validate! : Nil
      if value = @alias_name
        raise Core::ValidationError.new("AliasName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("AliasName length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("AliasName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9:/_-]+$"))
      end

      if value = @target_key_id
        raise Core::ValidationError.new("TargetKeyId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TargetKeyId length must be <= 2048") if value.size > 2048
      end
    end

    def_equals_and_hash(@alias_name, @target_key_id)
  end
end
