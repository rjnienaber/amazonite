private alias AK = Amazonite::KmsV1

module Amazonite::KmsV1
  class CreateKeyRequest
    include JSON::Serializable

    @[JSON::Field(key: "Policy")]
    property policy : String | Nil

    @[JSON::Field(key: "Description")]
    property description : String | Nil

    @[JSON::Field(key: "KeyUsage", converter: AK::KeyUsageType)]
    property key_usage : KeyUsageType | Nil

    @[JSON::Field(key: "CustomerMasterKeySpec", converter: AK::CustomerMasterKeySpec)]
    property customer_master_key_spec : CustomerMasterKeySpec | Nil

    @[JSON::Field(key: "KeySpec", converter: AK::KeySpec)]
    property key_spec : KeySpec | Nil

    @[JSON::Field(key: "Origin", converter: AK::OriginType)]
    property origin : OriginType | Nil

    @[JSON::Field(key: "CustomKeyStoreId")]
    property custom_key_store_id : String | Nil

    @[JSON::Field(key: "BypassPolicyLockoutSafetyCheck")]
    property bypass_policy_lockout_safety_check : Bool | Nil

    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    @[JSON::Field(key: "MultiRegion")]
    property multi_region : Bool | Nil

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
  end
end
