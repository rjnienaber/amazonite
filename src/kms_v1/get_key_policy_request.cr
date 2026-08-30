module Amazonite::KmsV1
  class GetKeyPolicyRequest
    include JSON::Serializable

    # Gets the key policy for the specified KMS key.
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
    # `default`. The only valid name is `default`. To get the names of key policies, use
    # ListKeyPolicies.
    @[JSON::Field(key: "PolicyName")]
    property policy_name : String | Nil

    def initialize(
      @key_id : String,
      @policy_name : String | Nil = nil,
    )
    end

    def_equals_and_hash(@key_id, @policy_name)
  end
end
