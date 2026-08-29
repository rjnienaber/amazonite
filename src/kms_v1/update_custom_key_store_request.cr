private alias AK = Amazonite::KmsV1

module Amazonite::KmsV1
  class UpdateCustomKeyStoreRequest
    include JSON::Serializable

    @[JSON::Field(key: "CustomKeyStoreId")]
    property custom_key_store_id : String

    @[JSON::Field(key: "NewCustomKeyStoreName")]
    property new_custom_key_store_name : String | Nil

    @[JSON::Field(key: "KeyStorePassword")]
    property key_store_password : String | Nil

    @[JSON::Field(key: "CloudHsmClusterId")]
    property cloud_hsm_cluster_id : String | Nil

    @[JSON::Field(key: "XksProxyUriEndpoint")]
    property xks_proxy_uri_endpoint : String | Nil

    @[JSON::Field(key: "XksProxyUriPath")]
    property xks_proxy_uri_path : String | Nil

    @[JSON::Field(key: "XksProxyVpcEndpointServiceName")]
    property xks_proxy_vpc_endpoint_service_name : String | Nil

    @[JSON::Field(key: "XksProxyVpcEndpointServiceOwner")]
    property xks_proxy_vpc_endpoint_service_owner : String | Nil

    @[JSON::Field(key: "XksProxyAuthenticationCredential")]
    property xks_proxy_authentication_credential : XksProxyAuthenticationCredentialType | Nil

    @[JSON::Field(key: "XksProxyConnectivity", converter: AK::XksProxyConnectivityType)]
    property xks_proxy_connectivity : XksProxyConnectivityType | Nil

    def initialize(
      @custom_key_store_id : String,
      @new_custom_key_store_name : String | Nil = nil,
      @key_store_password : String | Nil = nil,
      @cloud_hsm_cluster_id : String | Nil = nil,
      @xks_proxy_uri_endpoint : String | Nil = nil,
      @xks_proxy_uri_path : String | Nil = nil,
      @xks_proxy_vpc_endpoint_service_name : String | Nil = nil,
      @xks_proxy_vpc_endpoint_service_owner : String | Nil = nil,
      @xks_proxy_authentication_credential : XksProxyAuthenticationCredentialType | Nil = nil,
      @xks_proxy_connectivity : XksProxyConnectivityType | Nil = nil,
    )
    end
  end
end
