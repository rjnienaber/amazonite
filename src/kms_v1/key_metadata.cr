private alias AK = Amazonite::KmsV1
private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class KeyMetadata
    include JSON::Serializable

    @[JSON::Field(key: "AWSAccountId")]
    property aws_account_id : String | Nil

    @[JSON::Field(key: "KeyId")]
    property key_id : String

    @[JSON::Field(key: "Arn")]
    property arn : String | Nil

    @[JSON::Field(key: "CreationDate", converter: Core::AWSEpochConverter)]
    property creation_date : Time | Nil

    @[JSON::Field(key: "Enabled")]
    property enabled : Bool | Nil

    @[JSON::Field(key: "Description")]
    property description : String | Nil

    @[JSON::Field(key: "KeyUsage", converter: AK::KeyUsageType)]
    property key_usage : KeyUsageType | Nil

    @[JSON::Field(key: "KeyState", converter: AK::KeyState)]
    property key_state : KeyState | Nil

    @[JSON::Field(key: "DeletionDate", converter: Core::AWSEpochConverter)]
    property deletion_date : Time | Nil

    @[JSON::Field(key: "ValidTo", converter: Core::AWSEpochConverter)]
    property valid_to : Time | Nil

    @[JSON::Field(key: "Origin", converter: AK::OriginType)]
    property origin : OriginType | Nil

    @[JSON::Field(key: "CustomKeyStoreId")]
    property custom_key_store_id : String | Nil

    @[JSON::Field(key: "CloudHsmClusterId")]
    property cloud_hsm_cluster_id : String | Nil

    @[JSON::Field(key: "ExpirationModel", converter: AK::ExpirationModelType)]
    property expiration_model : ExpirationModelType | Nil

    @[JSON::Field(key: "KeyManager", converter: AK::KeyManagerType)]
    property key_manager : KeyManagerType | Nil

    @[JSON::Field(key: "CustomerMasterKeySpec", converter: AK::CustomerMasterKeySpec)]
    property customer_master_key_spec : CustomerMasterKeySpec | Nil

    @[JSON::Field(key: "KeySpec", converter: AK::KeySpec)]
    property key_spec : KeySpec | Nil

    @[JSON::Field(key: "EncryptionAlgorithms", converter: Core::ArrayConverter(AK::EncryptionAlgorithmSpec))]
    property encryption_algorithms : Array(EncryptionAlgorithmSpec) | Nil

    @[JSON::Field(key: "SigningAlgorithms", converter: Core::ArrayConverter(AK::SigningAlgorithmSpec))]
    property signing_algorithms : Array(SigningAlgorithmSpec) | Nil

    @[JSON::Field(key: "KeyAgreementAlgorithms", converter: Core::ArrayConverter(AK::KeyAgreementAlgorithmSpec))]
    property key_agreement_algorithms : Array(KeyAgreementAlgorithmSpec) | Nil

    @[JSON::Field(key: "MultiRegion")]
    property multi_region : Bool | Nil

    @[JSON::Field(key: "MultiRegionConfiguration")]
    property multi_region_configuration : MultiRegionConfiguration | Nil

    @[JSON::Field(key: "PendingDeletionWindowInDays")]
    property pending_deletion_window_in_days : Int32 | Nil

    @[JSON::Field(key: "MacAlgorithms", converter: Core::ArrayConverter(AK::MacAlgorithmSpec))]
    property mac_algorithms : Array(MacAlgorithmSpec) | Nil

    @[JSON::Field(key: "XksKeyConfiguration")]
    property xks_key_configuration : XksKeyConfigurationType | Nil

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
  end
end
