private alias AK = Amazonite::KmsV1
private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class CustomKeyStoresListEntry
    include JSON::Serializable

    @[JSON::Field(key: "CustomKeyStoreId")]
    property custom_key_store_id : String | Nil

    @[JSON::Field(key: "CustomKeyStoreName")]
    property custom_key_store_name : String | Nil

    @[JSON::Field(key: "CloudHsmClusterId")]
    property cloud_hsm_cluster_id : String | Nil

    @[JSON::Field(key: "TrustAnchorCertificate")]
    property trust_anchor_certificate : String | Nil

    @[JSON::Field(key: "ConnectionState", converter: AK::ConnectionStateType)]
    property connection_state : ConnectionStateType | Nil

    @[JSON::Field(key: "ConnectionErrorCode", converter: AK::ConnectionErrorCodeType)]
    property connection_error_code : ConnectionErrorCodeType | Nil

    @[JSON::Field(key: "CreationDate", converter: Core::AWSEpochConverter)]
    property creation_date : Time | Nil

    @[JSON::Field(key: "CustomKeyStoreType", converter: AK::CustomKeyStoreType)]
    property custom_key_store_type : CustomKeyStoreType | Nil

    @[JSON::Field(key: "XksProxyConfiguration")]
    property xks_proxy_configuration : XksProxyConfigurationType | Nil

    def initialize(
      @custom_key_store_id : String | Nil = nil,
      @custom_key_store_name : String | Nil = nil,
      @cloud_hsm_cluster_id : String | Nil = nil,
      @trust_anchor_certificate : String | Nil = nil,
      @connection_state : ConnectionStateType | Nil = nil,
      @connection_error_code : ConnectionErrorCodeType | Nil = nil,
      @creation_date : Time | Nil = nil,
      @custom_key_store_type : CustomKeyStoreType | Nil = nil,
      @xks_proxy_configuration : XksProxyConfigurationType | Nil = nil,
    )
    end
  end
end
