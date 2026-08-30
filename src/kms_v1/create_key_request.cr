private alias AK = Amazonite::KmsV1
private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class CreateKeyRequest
    include JSON::Serializable

    # The key policy to attach to the KMS key.
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
    # If either of the required `Resource` or `Action` elements are missing from a key policy
    # statement, the policy statement has no effect. When a key policy statement is missing one of
    # these elements, the KMS console correctly reports an error, but the `CreateKey` and
    # `PutKeyPolicy` API requests succeed, even though the policy statement is ineffective.
    #
    # For more information on required key policy elements, see [Elements in a key
    # policy](https://docs.aws.amazon.com/kms/latest/developerguide/key-policy-overview.html#key-policy-elements)
    # in the *Key Management Service Developer Guide*.
    #
    # If you do not provide a key policy, KMS attaches a default key policy to the KMS key. For more
    # information, see [Default key
    # policy](https://docs.aws.amazon.com/kms/latest/developerguide/key-policy-default.html) in the
    # *Key Management Service Developer Guide*.
    #
    # If the key policy exceeds the length constraint, KMS returns a `LimitExceededException`.
    #
    # For help writing and formatting a JSON policy document, see the [IAM JSON Policy
    # Reference](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies.html) in the *
    # *Identity and Access Management User Guide* *.
    @[JSON::Field(key: "Policy")]
    property policy : String | Nil

    # A description of the KMS key. Use a description that helps you decide whether the KMS key is
    # appropriate for a task. The default value is an empty string (no description).
    #
    # Do not include confidential or sensitive information in this field. This field may be displayed
    # in plaintext in CloudTrail logs and other output.
    #
    # To set or change the description after the key is created, use UpdateKeyDescription.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # Determines the [cryptographic
    # operations](https://docs.aws.amazon.com/kms/latest/developerguide/kms-cryptography.html#cryptographic-operations)
    # for which you can use the KMS key. The default value is `ENCRYPT_DECRYPT`. This parameter is
    # optional when you are creating a symmetric encryption KMS key; otherwise, it is required. You
    # can't change the [ `KeyUsage`
    # ](https://docs.aws.amazon.com/kms/latest/developerguide/create-keys.html#key-usage) value after
    # the KMS key is created. Each KMS key can have only one key usage. This follows key usage best
    # practices according to [NIST SP 800-57 Recommendations for Key
    # Management](https://csrc.nist.gov/pubs/sp/800/57/pt1/r5/final), section 5.2, Key usage.
    #
    # Select only one valid value.
    #
    # - For symmetric encryption KMS keys, omit the parameter or specify `ENCRYPT_DECRYPT`.
    #
    # - For HMAC KMS keys (symmetric), specify `GENERATE_VERIFY_MAC`.
    #
    # - For asymmetric KMS keys with RSA key pairs, specify `ENCRYPT_DECRYPT` or `SIGN_VERIFY`.
    #
    # - For asymmetric KMS keys with NIST-standard elliptic curve key pairs, specify `SIGN_VERIFY` or
    # `KEY_AGREEMENT`.
    #
    # - For asymmetric KMS keys with `ECC_SECG_P256K1` key pairs, specify `SIGN_VERIFY`.
    #
    # - For asymmetric KMS keys with ML-DSA key pairs, specify `SIGN_VERIFY`.
    #
    # - For asymmetric KMS keys with SM2 key pairs (China Regions only), specify `ENCRYPT_DECRYPT`,
    # `SIGN_VERIFY`, or `KEY_AGREEMENT`.
    @[JSON::Field(key: "KeyUsage", converter: AK::KeyUsageType)]
    property key_usage : KeyUsageType | Nil

    # Instead, use the `KeySpec` parameter.
    #
    # The `KeySpec` and `CustomerMasterKeySpec` parameters work the same way. Only the names differ.
    # We recommend that you use `KeySpec` parameter in your code. However, to avoid breaking changes,
    # KMS supports both parameters.
    @[JSON::Field(key: "CustomerMasterKeySpec", converter: AK::CustomerMasterKeySpec)]
    property customer_master_key_spec : CustomerMasterKeySpec | Nil

    # Specifies the type of KMS key to create. The default value, `SYMMETRIC_DEFAULT`, creates a KMS
    # key with a 256-bit AES-GCM key that is used for encryption and decryption, except in China
    # Regions, where it creates a 128-bit symmetric key that uses SM4 encryption. For a detailed
    # description of all supported key specs, see [Key spec
    # reference](https://docs.aws.amazon.com/kms/latest/developerguide/symm-asymm-choose-key-spec.html)
    # in the * *Key Management Service Developer Guide* *.
    #
    # The `KeySpec` determines whether the KMS key contains a symmetric key or an asymmetric key pair.
    # It also determines the algorithms that the KMS key supports. You can't change the `KeySpec`
    # after the KMS key is created. To further restrict the algorithms that can be used with the KMS
    # key, use a condition key in its key policy or IAM policy. For more information, see
    # [kms:EncryptionAlgorithm](https://docs.aws.amazon.com/kms/latest/developerguide/conditions-kms.html#conditions-kms-encryption-algorithm),
    # [kms:MacAlgorithm](https://docs.aws.amazon.com/kms/latest/developerguide/conditions-kms.html#conditions-kms-mac-algorithm),
    # [kms:KeyAgreementAlgorithm](https://docs.aws.amazon.com/kms/latest/developerguide/conditions-kms.html#conditions-kms-key-agreement-algorithm),
    # or
    # [kms:SigningAlgorithm](https://docs.aws.amazon.com/kms/latest/developerguide/conditions-kms.html#conditions-kms-signing-algorithm)
    # in the * *Key Management Service Developer Guide* *.
    #
    # [Amazon Web Services services that are integrated with
    # KMS](http://aws.amazon.com/kms/features/#AWS_Service_Integration) use symmetric encryption KMS
    # keys to protect your data. These services do not support asymmetric KMS keys or HMAC KMS keys.
    #
    # KMS supports the following key specs for KMS keys:
    #
    # - Symmetric encryption key (default)
    #
    # - `SYMMETRIC_DEFAULT`
    #
    # - HMAC keys (symmetric)
    #
    # - `HMAC_224`
    #
    # - `HMAC_256`
    #
    # - `HMAC_384`
    #
    # - `HMAC_512`
    #
    # - Asymmetric RSA key pairs (encryption and decryption -or- signing and verification)
    #
    # - `RSA_2048`
    #
    # - `RSA_3072`
    #
    # - `RSA_4096`
    #
    # - Asymmetric NIST-standard elliptic curve key pairs (signing and verification -or- deriving
    # shared secrets)
    #
    # - `ECC_NIST_P256` (secp256r1)
    #
    # - `ECC_NIST_P384` (secp384r1)
    #
    # - `ECC_NIST_P521` (secp521r1)
    #
    # - `ECC_NIST_EDWARDS25519` (ed25519) - signing and verification only
    #
    # - **Note:** For ECC_NIST_EDWARDS25519 KMS keys, the ED25519_SHA_512 signing algorithm requires [
    # `MessageType:RAW` ](kms/latest/APIReference/API_Sign.html#KMS-Sign-request-MessageType), while
    # ED25519_PH_SHA_512 requires [ `MessageType:DIGEST`
    # ](kms/latest/APIReference/API_Sign.html#KMS-Sign-request-MessageType). These message types
    # cannot be used interchangeably.
    #
    # - Other asymmetric elliptic curve key pairs (signing and verification)
    #
    # - `ECC_SECG_P256K1` (secp256k1), commonly used for cryptocurrencies.
    #
    # - Asymmetric ML-DSA key pairs (signing and verification)
    #
    # - `ML_DSA_44`
    #
    # - `ML_DSA_65`
    #
    # - `ML_DSA_87`
    #
    # - SM2 key pairs (encryption and decryption -or- signing and verification -or- deriving shared
    # secrets)
    #
    # - `SM2` (China Regions only)
    @[JSON::Field(key: "KeySpec", converter: AK::KeySpec)]
    property key_spec : KeySpec | Nil

    # The source of the key material for the KMS key. You cannot change the origin after you create
    # the KMS key. The default is `AWS_KMS`, which means that KMS creates the key material.
    #
    # To [create a KMS key with no key
    # material](https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys-create-cmk.html)
    # (for imported key material), set this value to `EXTERNAL`. For more information about importing
    # key material into KMS, see [Importing Key
    # Material](https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html) in the *Key
    # Management Service Developer Guide*. The `EXTERNAL` origin value is valid only for symmetric KMS
    # keys.
    #
    # To [create a KMS key in an CloudHSM key
    # store](https://docs.aws.amazon.com/kms/latest/developerguide/create-cmk-keystore.html) and
    # create its key material in the associated CloudHSM cluster, set this value to `AWS_CLOUDHSM`.
    # You must also use the `CustomKeyStoreId` parameter to identify the CloudHSM key store. The
    # `KeySpec` value must be `SYMMETRIC_DEFAULT`.
    #
    # To [create a KMS key in an external key
    # store](https://docs.aws.amazon.com/kms/latest/developerguide/create-xks-keys.html), set this
    # value to `EXTERNAL_KEY_STORE`. You must also use the `CustomKeyStoreId` parameter to identify
    # the external key store and the `XksKeyId` parameter to identify the associated external key. The
    # `KeySpec` value must be `SYMMETRIC_DEFAULT`.
    @[JSON::Field(key: "Origin", converter: AK::OriginType)]
    property origin : OriginType | Nil

    # Creates the KMS key in the specified [custom key
    # store](https://docs.aws.amazon.com/kms/latest/developerguide/key-store-overview.html). The
    # `ConnectionState` of the custom key store must be `CONNECTED`. To find the CustomKeyStoreID and
    # ConnectionState use the DescribeCustomKeyStores operation.
    #
    # This parameter is valid only for symmetric encryption KMS keys in a single Region. You cannot
    # create any other type of KMS key in a custom key store.
    #
    # When you create a KMS key in an CloudHSM key store, KMS generates a non-exportable 256-bit
    # symmetric key in its associated CloudHSM cluster and associates it with the KMS key. When you
    # create a KMS key in an external key store, you must use the `XksKeyId` parameter to specify an
    # external key that serves as key material for the KMS key.
    @[JSON::Field(key: "CustomKeyStoreId")]
    property custom_key_store_id : String | Nil

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

    # Assigns one or more tags to the KMS key. Use this parameter to tag the KMS key when it is
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

    # Creates a multi-Region primary key that you can replicate into other Amazon Web Services
    # Regions. You cannot change this value after you create the KMS key.
    #
    # For a multi-Region key, set this parameter to `True`. For a single-Region KMS key, omit this
    # parameter or set it to `False`. The default value is `False`.
    #
    # This operation supports *multi-Region keys*, an KMS feature that lets you create multiple
    # interoperable KMS keys in different Amazon Web Services Regions. Because these KMS keys have the
    # same key ID, key material, and other metadata, you can use them interchangeably to encrypt data
    # in one Amazon Web Services Region and decrypt it in a different Amazon Web Services Region
    # without re-encrypting the data or making a cross-Region call. For more information about
    # multi-Region keys, see [Multi-Region keys in
    # KMS](https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html) in
    # the *Key Management Service Developer Guide*.
    #
    # This value creates a *primary key*, not a replica. To create a *replica key*, use the
    # ReplicateKey operation.
    #
    # You can create a symmetric or asymmetric multi-Region key, and you can create a multi-Region key
    # with imported key material. However, you cannot create a multi-Region key in a custom key store.
    @[JSON::Field(key: "MultiRegion")]
    property multi_region : Bool | Nil

    # Identifies the [external
    # key](https://docs.aws.amazon.com/kms/latest/developerguide/keystore-external.html#concept-external-key)
    # that serves as key material for the KMS key in an [external key
    # store](https://docs.aws.amazon.com/kms/latest/developerguide/keystore-external.html). Specify
    # the ID that the [external key store
    # proxy](https://docs.aws.amazon.com/kms/latest/developerguide/keystore-external.html#concept-xks-proxy)
    # uses to refer to the external key. For help, see the documentation for your external key store
    # proxy.
    #
    # This parameter is required for a KMS key with an `Origin` value of `EXTERNAL_KEY_STORE`. It is
    # not valid for KMS keys with any other `Origin` value.
    #
    # The external key must be an existing 256-bit AES symmetric encryption key hosted outside of
    # Amazon Web Services in an external key manager associated with the external key store specified
    # by the `CustomKeyStoreId` parameter. This key must be enabled and configured to perform
    # encryption and decryption. Each KMS key in an external key store must use a different external
    # key. For details, see [Requirements for a KMS key in an external key
    # store](https://docs.aws.amazon.com/kms/latest/developerguide/create-xks-keys.html#xks-key-requirements)
    # in the *Key Management Service Developer Guide*.
    #
    # Each KMS key in an external key store is associated two backing keys. One is key material that
    # KMS generates. The other is the external key specified by this parameter. When you use the KMS
    # key in an external key store to encrypt data, the encryption operation is performed first by KMS
    # using the KMS key material, and then by the external key manager using the specified external
    # key, a process known as *double encryption*. For details, see [Double
    # encryption](https://docs.aws.amazon.com/kms/latest/developerguide/keystore-external.html#concept-double-encryption)
    # in the *Key Management Service Developer Guide*.
    @[JSON::Field(key: "XksKeyId")]
    property xks_key_id : String | Nil

    def initialize(
      @policy : String | Nil = nil,
      @description : String | Nil = nil,
      @key_usage : KeyUsageType | Nil = nil,
      @customer_master_key_spec : CustomerMasterKeySpec | Nil = nil,
      @key_spec : KeySpec | Nil = nil,
      @origin : OriginType | Nil = nil,
      @custom_key_store_id : String | Nil = nil,
      @bypass_policy_lockout_safety_check : Bool | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @multi_region : Bool | Nil = nil,
      @xks_key_id : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @policy
        raise Core::ValidationError.new("Policy length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Policy length must be <= 131072") if value.size > 131072
        raise Core::ValidationError.new("Policy does not match the required pattern") unless value.matches?(Regex.new("^[\t\n\r -ÿ]+$"))
      end

      if value = @description
        raise Core::ValidationError.new("Description length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Description length must be <= 8192") if value.size > 8192
      end

      if value = @custom_key_store_id
        raise Core::ValidationError.new("CustomKeyStoreId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("CustomKeyStoreId length must be <= 64") if value.size > 64
      end

      if value = @tags
        value.each(&.validate!)
      end

      if value = @xks_key_id
        raise Core::ValidationError.new("XksKeyId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("XksKeyId length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("XksKeyId does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9-_.]+$"))
      end
    end

    def_equals_and_hash(@policy, @description, @key_usage, @customer_master_key_spec, @key_spec, @origin, @custom_key_store_id, @bypass_policy_lockout_safety_check, @tags, @multi_region, @xks_key_id)
  end
end
