private alias Core = Amazonite::Core

module Amazonite::Kms
  class GetKeyPolicyRequest
    include JSON::Serializable

    # Identifies the KMS key whose key policy you want to get.
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

    # Specifies the name of the key policy. If no policy name is specified, the default value is
    # `default`. Valid values are `default` and `AWS_RAM`. Use `AWS_RAM` to get the key policy that
    # RAM manages for a KMS key that you share through RAM. If the KMS key doesn't have an `AWS_RAM`
    # key policy, the request fails with a `NotFoundException`. To get the names of key policies, use
    # ListKeyPolicies.
    @[JSON::Field(key: "PolicyName")]
    property policy_name : String | Nil

    def initialize(
      @key_id : String,
      @policy_name : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @key_id
        raise Core::ValidationError.new("KeyId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("KeyId length must be <= 2048") if value.size > 2048
      end

      if value = @policy_name
        raise Core::ValidationError.new("PolicyName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("PolicyName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("PolicyName does not match the required pattern") unless value.matches?(Regex.new("^[\\w]+$"))
      end
    end

    def_equals_and_hash(@key_id, @policy_name)
  end
end
