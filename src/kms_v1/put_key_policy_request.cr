module Amazonite::KmsV1
  class PutKeyPolicyRequest
    include JSON::Serializable

    # Sets the key policy on the specified KMS key.
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

    # The name of the key policy. If no policy name is specified, the default value is `default`. The
    # only valid value is `default`.
    @[JSON::Field(key: "PolicyName")]
    property policy_name : String | Nil

    # The key policy to attach to the KMS key.
    #
    # The key policy must meet the following criteria:
    #
    # - The key policy must allow the calling principal to make a subsequent `PutKeyPolicy` request on
    # the KMS key. This reduces the risk that the KMS key becomes unmanageable. For more information,
    # see [Default key
    # policy](https://docs.aws.amazon.com/kms/latest/developerguide/key-policy-default.html#prevent-unmanageable-key)
    # in the *Key Management Service Developer Guide*. (To omit this condition, set
    # `BypassPolicyLockoutSafetyCheck` to true.)
    #
    # - Each statement in the key policy must contain one or more principals. The principals in the
    # key policy must exist and be visible to KMS. When you create a new Amazon Web Services
    # principal, you might need to enforce a delay before including the new principal in a key policy
    # because the new principal might not be immediately visible to KMS. For more information, see
    # [Changes that I make are not always immediately
    # visible](https://docs.aws.amazon.com/IAM/latest/UserGuide/troubleshoot_general.html#troubleshoot_general_eventual-consistency)
    # in the *Amazon Web Services Identity and Access Management User Guide*.
    #
    # If either of the required `Resource` or `Action` elements are missing from a key policy
    # statement, the policy statement has no effect. When a key policy statement is missing one of
    # these elements, the KMS console correctly reports an error, but the `PutKeyPolicy` API request
    # succeeds, even though the policy statement is ineffective.
    #
    # For more information on required key policy elements, see [Elements in a key
    # policy](https://docs.aws.amazon.com/kms/latest/developerguide/key-policy-overview.html#key-policy-elements)
    # in the *Key Management Service Developer Guide*.
    #
    # A key policy document can include only the following characters:
    #
    # - Printable ASCII characters from the space character (`\u0020`) through the end of the ASCII
    # character range.
    #
    # - Printable characters in the Basic Latin and Latin-1 Supplement character set (through
    # `\u00FF`).
    #
    # - The tab (`\u0009`), line feed (`\u000A`), and carriage return (`\u000D`) special characters
    #
    # If the key policy exceeds the length constraint, KMS returns a `LimitExceededException`.
    #
    # For information about key policies, see [Key policies in
    # KMS](https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html) in the *Key
    # Management Service Developer Guide*.For help writing and formatting a JSON policy document, see
    # the [IAM JSON Policy
    # Reference](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies.html) in the *
    # *Identity and Access Management User Guide* *.
    @[JSON::Field(key: "Policy")]
    property policy : String

    # Skips ("bypasses") the key policy lockout safety check. The default value is false.
    #
    # Setting this value to true increases the risk that the KMS key becomes unmanageable. Do not set
    # this value to true indiscriminately.
    #
    # For more information, see [Default key
    # policy](https://docs.aws.amazon.com/kms/latest/developerguide/key-policy-default.html#prevent-unmanageable-key)
    # in the *Key Management Service Developer Guide*.
    #
    # Use this parameter only when you intend to prevent the principal that is making the request from
    # making a subsequent
    # [PutKeyPolicy](https://docs.aws.amazon.com/kms/latest/APIReference/API_PutKeyPolicy.html)
    # request on the KMS key.
    @[JSON::Field(key: "BypassPolicyLockoutSafetyCheck")]
    property bypass_policy_lockout_safety_check : Bool | Nil

    def initialize(
      @key_id : String,
      @policy : String,
      @policy_name : String | Nil = nil,
      @bypass_policy_lockout_safety_check : Bool | Nil = nil,
    )
    end
  end
end
