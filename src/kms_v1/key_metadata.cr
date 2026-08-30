private alias AK = Amazonite::KmsV1
private alias Core = Amazonite::Core

module Amazonite::KmsV1
  # Contains metadata about a KMS key.
  #
  # This data type is used as a response element for the CreateKey, DescribeKey, and ReplicateKey
  # operations.
  class KeyMetadata
    include JSON::Serializable

    # The twelve-digit account ID of the Amazon Web Services account that owns the KMS key.
    @[JSON::Field(key: "AWSAccountId")]
    property aws_account_id : String | Nil

    # The globally unique identifier for the KMS key.
    @[JSON::Field(key: "KeyId")]
    property key_id : String

    # The Amazon Resource Name (ARN) of the KMS key. For examples, see [Key Management Service
    # (KMS)](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kms)
    # in the Example ARNs section of the *Amazon Web Services General Reference*.
    @[JSON::Field(key: "Arn")]
    property arn : String | Nil

    # The date and time when the KMS key was created.
    @[JSON::Field(key: "CreationDate", converter: Core::AWSEpochConverter)]
    property creation_date : Time | Nil

    # Specifies whether the KMS key is enabled. When `KeyState` is `Enabled` this value is true,
    # otherwise it is false.
    @[JSON::Field(key: "Enabled")]
    property enabled : Bool | Nil

    # The description of the KMS key.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # The [cryptographic
    # operations](https://docs.aws.amazon.com/kms/latest/developerguide/kms-cryptography.html#cryptographic-operations)
    # for which you can use the KMS key.
    @[JSON::Field(key: "KeyUsage", converter: AK::KeyUsageType)]
    property key_usage : KeyUsageType | Nil

    # The current status of the KMS key.
    #
    # For more information about how key state affects the use of a KMS key, see [Key states of KMS
    # keys](https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html) in the *Key
    # Management Service Developer Guide*.
    @[JSON::Field(key: "KeyState", converter: AK::KeyState)]
    property key_state : KeyState | Nil

    # The date and time after which KMS deletes this KMS key. This value is present only when the KMS
    # key is scheduled for deletion, that is, when its `KeyState` is `PendingDeletion`.
    #
    # When the primary key in a multi-Region key is scheduled for deletion but still has replica keys,
    # its key state is `PendingReplicaDeletion` and the length of its waiting period is displayed in
    # the `PendingDeletionWindowInDays` field.
    @[JSON::Field(key: "DeletionDate", converter: Core::AWSEpochConverter)]
    property deletion_date : Time | Nil

    # The earliest time at which any imported key material permanently associated with this KMS key
    # expires. When a key material expires, KMS deletes the key material and the KMS key becomes
    # unusable. This value is present only for KMS keys whose `Origin` is `EXTERNAL` and the
    # `ExpirationModel` is `KEY_MATERIAL_EXPIRES`, otherwise this value is omitted.
    @[JSON::Field(key: "ValidTo", converter: Core::AWSEpochConverter)]
    property valid_to : Time | Nil

    # The source of the key material for the KMS key. When this value is `AWS_KMS`, KMS created the
    # key material. When this value is `EXTERNAL`, the key material was imported or the KMS key
    # doesn't have any key material. When this value is `AWS_CLOUDHSM`, the key material was created
    # in the CloudHSM cluster associated with a custom key store.
    @[JSON::Field(key: "Origin", converter: AK::OriginType)]
    property origin : OriginType | Nil

    # A unique identifier for the [custom key
    # store](https://docs.aws.amazon.com/kms/latest/developerguide/key-store-overview.html) that
    # contains the KMS key. This field is present only when the KMS key is created in a custom key
    # store.
    @[JSON::Field(key: "CustomKeyStoreId")]
    property custom_key_store_id : String | Nil

    # The cluster ID of the CloudHSM cluster that contains the key material for the KMS key. When you
    # create a KMS key in an CloudHSM [custom key
    # store](https://docs.aws.amazon.com/kms/latest/developerguide/key-store-overview.html), KMS
    # creates the key material for the KMS key in the associated CloudHSM cluster. This field is
    # present only when the KMS key is created in an CloudHSM key store.
    @[JSON::Field(key: "CloudHsmClusterId")]
    property cloud_hsm_cluster_id : String | Nil

    # Specifies whether the KMS key's key material expires. This value is present only when `Origin`
    # is `EXTERNAL`, otherwise this value is omitted.
    @[JSON::Field(key: "ExpirationModel", converter: AK::ExpirationModelType)]
    property expiration_model : ExpirationModelType | Nil

    # The manager of the KMS key. KMS keys in your Amazon Web Services account are either customer
    # managed or Amazon Web Services managed. For more information about the difference, see [KMS
    # keys](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#kms_keys) in the *Key
    # Management Service Developer Guide*.
    @[JSON::Field(key: "KeyManager", converter: AK::KeyManagerType)]
    property key_manager : KeyManagerType | Nil

    # Instead, use the `KeySpec` field.
    #
    # The `KeySpec` and `CustomerMasterKeySpec` fields have the same value. We recommend that you use
    # the `KeySpec` field in your code. However, to avoid breaking changes, KMS supports both fields.
    @[JSON::Field(key: "CustomerMasterKeySpec", converter: AK::CustomerMasterKeySpec)]
    property customer_master_key_spec : CustomerMasterKeySpec | Nil

    # Describes the type of key material in the KMS key.
    @[JSON::Field(key: "KeySpec", converter: AK::KeySpec)]
    property key_spec : KeySpec | Nil

    # The encryption algorithms that the KMS key supports. You cannot use the KMS key with other
    # encryption algorithms within KMS.
    #
    # This value is present only when the `KeyUsage` of the KMS key is `ENCRYPT_DECRYPT`.
    @[JSON::Field(key: "EncryptionAlgorithms", converter: Core::ArrayConverter(AK::EncryptionAlgorithmSpec))]
    property encryption_algorithms : Array(EncryptionAlgorithmSpec) | Nil

    # The signing algorithms that the KMS key supports. You cannot use the KMS key with other signing
    # algorithms within KMS.
    #
    # This field appears only when the `KeyUsage` of the KMS key is `SIGN_VERIFY`.
    @[JSON::Field(key: "SigningAlgorithms", converter: Core::ArrayConverter(AK::SigningAlgorithmSpec))]
    property signing_algorithms : Array(SigningAlgorithmSpec) | Nil

    # The key agreement algorithm used to derive a shared secret.
    @[JSON::Field(key: "KeyAgreementAlgorithms", converter: Core::ArrayConverter(AK::KeyAgreementAlgorithmSpec))]
    property key_agreement_algorithms : Array(KeyAgreementAlgorithmSpec) | Nil

    # Indicates whether the KMS key is a multi-Region (`True`) or regional (`False`) key. This value
    # is `True` for multi-Region primary and replica keys and `False` for regional KMS keys.
    #
    # For more information about multi-Region keys, see [Multi-Region keys in
    # KMS](https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html) in
    # the *Key Management Service Developer Guide*.
    @[JSON::Field(key: "MultiRegion")]
    property multi_region : Bool | Nil

    # Lists the primary and replica keys in same multi-Region key. This field is present only when the
    # value of the `MultiRegion` field is `True`.
    #
    # For more information about any listed KMS key, use the DescribeKey operation.
    #
    # - `MultiRegionKeyType` indicates whether the KMS key is a `PRIMARY` or `REPLICA` key.
    #
    # - `PrimaryKey` displays the key ARN and Region of the primary key. This field displays the
    # current KMS key if it is the primary key.
    #
    # - `ReplicaKeys` displays the key ARNs and Regions of all replica keys. This field includes the
    # current KMS key if it is a replica key.
    @[JSON::Field(key: "MultiRegionConfiguration")]
    property multi_region_configuration : MultiRegionConfiguration | Nil

    # The waiting period before the primary key in a multi-Region key is deleted. This waiting period
    # begins when the last of its replica keys is deleted. This value is present only when the
    # `KeyState` of the KMS key is `PendingReplicaDeletion`. That indicates that the KMS key is the
    # primary key in a multi-Region key, it is scheduled for deletion, and it still has existing
    # replica keys.
    #
    # When a single-Region KMS key or a multi-Region replica key is scheduled for deletion, its
    # deletion date is displayed in the `DeletionDate` field. However, when the primary key in a
    # multi-Region key is scheduled for deletion, its waiting period doesn't begin until all of its
    # replica keys are deleted. This value displays that waiting period. When the last replica key in
    # the multi-Region key is deleted, the `KeyState` of the scheduled primary key changes from
    # `PendingReplicaDeletion` to `PendingDeletion` and the deletion date appears in the
    # `DeletionDate` field.
    @[JSON::Field(key: "PendingDeletionWindowInDays")]
    property pending_deletion_window_in_days : Int32 | Nil

    # The message authentication code (MAC) algorithm that the HMAC KMS key supports.
    #
    # This value is present only when the `KeyUsage` of the KMS key is `GENERATE_VERIFY_MAC`.
    @[JSON::Field(key: "MacAlgorithms", converter: Core::ArrayConverter(AK::MacAlgorithmSpec))]
    property mac_algorithms : Array(MacAlgorithmSpec) | Nil

    # Information about the external key that is associated with a KMS key in an external key store.
    #
    # For more information, see [External
    # key](https://docs.aws.amazon.com/kms/latest/developerguide/keystore-external.html#concept-external-key)
    # in the *Key Management Service Developer Guide*.
    @[JSON::Field(key: "XksKeyConfiguration")]
    property xks_key_configuration : XksKeyConfigurationType | Nil

    # Identifies the current key material. This value is present for symmetric encryption keys with
    # `AWS_KMS` or `EXTERNAL` origin. These KMS keys support automatic or on-demand key rotation and
    # can have multiple key materials associated with them. KMS uses the current key material for both
    # encryption and decryption, and the non-current key material for decryption operations only.
    @[JSON::Field(key: "CurrentKeyMaterialId")]
    property current_key_material_id : String | Nil

    def initialize(
      @key_id : String,
      @aws_account_id : String | Nil = nil,
      @arn : String | Nil = nil,
      @creation_date : Time | Nil = nil,
      @enabled : Bool | Nil = nil,
      @description : String | Nil = nil,
      @key_usage : KeyUsageType | Nil = nil,
      @key_state : KeyState | Nil = nil,
      @deletion_date : Time | Nil = nil,
      @valid_to : Time | Nil = nil,
      @origin : OriginType | Nil = nil,
      @custom_key_store_id : String | Nil = nil,
      @cloud_hsm_cluster_id : String | Nil = nil,
      @expiration_model : ExpirationModelType | Nil = nil,
      @key_manager : KeyManagerType | Nil = nil,
      @customer_master_key_spec : CustomerMasterKeySpec | Nil = nil,
      @key_spec : KeySpec | Nil = nil,
      @encryption_algorithms : Array(EncryptionAlgorithmSpec) | Nil = nil,
      @signing_algorithms : Array(SigningAlgorithmSpec) | Nil = nil,
      @key_agreement_algorithms : Array(KeyAgreementAlgorithmSpec) | Nil = nil,
      @multi_region : Bool | Nil = nil,
      @multi_region_configuration : MultiRegionConfiguration | Nil = nil,
      @pending_deletion_window_in_days : Int32 | Nil = nil,
      @mac_algorithms : Array(MacAlgorithmSpec) | Nil = nil,
      @xks_key_configuration : XksKeyConfigurationType | Nil = nil,
      @current_key_material_id : String | Nil = nil,
    )
    end

    def_equals_and_hash(@aws_account_id, @key_id, @arn, @creation_date, @enabled, @description, @key_usage, @key_state, @deletion_date, @valid_to, @origin, @custom_key_store_id, @cloud_hsm_cluster_id, @expiration_model, @key_manager, @customer_master_key_spec, @key_spec, @encryption_algorithms, @signing_algorithms, @key_agreement_algorithms, @multi_region, @multi_region_configuration, @pending_deletion_window_in_days, @mac_algorithms, @xks_key_configuration, @current_key_material_id)
  end
end
