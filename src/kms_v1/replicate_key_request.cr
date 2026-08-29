module Amazonite::KmsV1
  class ReplicateKeyRequest
    include JSON::Serializable

    # Identifies the multi-Region primary key that is being replicated. To determine whether a KMS key
    # is a multi-Region primary key, use the DescribeKey operation to check the value of the
    # `MultiRegionKeyType` property.
    #
    # Specify the key ID or key ARN of a multi-Region primary key.
    #
    # For example:
    #
    # - Key ID: `mrk-1234abcd12ab34cd56ef1234567890ab`
    #
    # - Key ARN: `arn:aws:kms:us-east-2:111122223333:key/mrk-1234abcd12ab34cd56ef1234567890ab`
    #
    # To get the key ID and key ARN for a KMS key, use ListKeys or DescribeKey.
    @[JSON::Field(key: "KeyId")]
    property key_id : String

    # The Region ID of the Amazon Web Services Region for this replica key.
    #
    # Enter the Region ID, such as `us-east-1` or `ap-southeast-2`. For a list of Amazon Web Services
    # Regions in which KMS is supported, see [KMS service
    # endpoints](https://docs.aws.amazon.com/general/latest/gr/kms.html#kms_region) in the *Amazon Web
    # Services General Reference*.
    #
    # The replica must be in a different Amazon Web Services Region than its primary key and other
    # replicas of that primary key, but in the same Amazon Web Services partition. KMS must be
    # available in the replica Region. If the Region is not enabled by default, the Amazon Web
    # Services account must be enabled in the Region. For information about Amazon Web Services
    # partitions, see [Amazon Resource Names
    # (ARNs)](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html) in the
    # *Amazon Web Services General Reference*. For information about enabling and disabling Regions,
    # see [Enabling a
    # Region](https://docs.aws.amazon.com/general/latest/gr/rande-manage.html#rande-manage-enable) and
    # [Disabling a
    # Region](https://docs.aws.amazon.com/general/latest/gr/rande-manage.html#rande-manage-disable) in
    # the *Amazon Web Services General Reference*.
    @[JSON::Field(key: "ReplicaRegion")]
    property replica_region : String

    # The key policy to attach to the KMS key. This parameter is optional. If you do not provide a key
    # policy, KMS attaches the [default key
    # policy](https://docs.aws.amazon.com/kms/latest/developerguide/key-policy-default.html) to the
    # KMS key.
    #
    # The key policy is not a shared property of multi-Region keys. You can specify the same key
    # policy or a different key policy for each key in a set of related multi-Region keys. KMS does
    # not synchronize this property.
    #
    # If you provide a key policy, it must meet the following criteria:
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
    # For information about key policies, see [Key policies in
    # KMS](https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html) in the *Key
    # Management Service Developer Guide*. For help writing and formatting a JSON policy document, see
    # the [IAM JSON Policy
    # Reference](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies.html) in the *
    # *Identity and Access Management User Guide* *.
    @[JSON::Field(key: "Policy")]
    property policy : String | Nil

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

    # A description of the KMS key. The default value is an empty string (no description).
    #
    # Do not include confidential or sensitive information in this field. This field may be displayed
    # in plaintext in CloudTrail logs and other output.
    #
    # The description is not a shared property of multi-Region keys. You can specify the same
    # description or a different description for each key in a set of related multi-Region keys. KMS
    # does not synchronize this property.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # Assigns one or more tags to the replica key. Use this parameter to tag the KMS key when it is
    # created. To tag an existing KMS key, use the TagResource operation.
    #
    # Do not include confidential or sensitive information in this field. This field may be displayed
    # in plaintext in CloudTrail logs and other output.
    #
    # Tagging or untagging a KMS key can allow or deny permission to the KMS key. For details, see
    # [ABAC for KMS](https://docs.aws.amazon.com/kms/latest/developerguide/abac.html) in the *Key
    # Management Service Developer Guide*.
    #
    # To use this parameter, you must have
    # [kms:TagResource](https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html)
    # permission in an IAM policy.
    #
    # Tags are not a shared property of multi-Region keys. You can specify the same tags or different
    # tags for each key in a set of related multi-Region keys. KMS does not synchronize this property.
    #
    # Each tag consists of a tag key and a tag value. Both the tag key and the tag value are required,
    # but the tag value can be an empty (null) string. You cannot have more than one tag on a KMS key
    # with the same tag key. If you specify an existing tag key with a different tag value, KMS
    # replaces the current tag value with the specified one.
    #
    # When you add tags to an Amazon Web Services resource, Amazon Web Services generates a cost
    # allocation report with usage and costs aggregated by tags. Tags can also be used to control
    # access to a KMS key. For details, see [Tags in
    # KMS](https://docs.aws.amazon.com/kms/latest/developerguide/tagging-keys.html).
    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    def initialize(
      @key_id : String,
      @replica_region : String,
      @policy : String | Nil = nil,
      @bypass_policy_lockout_safety_check : Bool | Nil = nil,
      @description : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end
  end
end
