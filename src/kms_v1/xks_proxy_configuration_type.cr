private alias AK = Amazonite::KmsV1

module Amazonite::KmsV1
  class XksProxyConfigurationType
    include JSON::Serializable

    @[JSON::Field(key: "Connectivity", converter: AK::XksProxyConnectivityType)]
    property connectivity : XksProxyConnectivityType | Nil

    @[JSON::Field(key: "AccessKeyId")]
    property access_key_id : String | Nil

    @[JSON::Field(key: "UriEndpoint")]
    property uri_endpoint : String | Nil

    @[JSON::Field(key: "UriPath")]
    property uri_path : String | Nil

    @[JSON::Field(key: "VpcEndpointServiceName")]
    property vpc_endpoint_service_name : String | Nil

    @[JSON::Field(key: "VpcEndpointServiceOwner")]
    property vpc_endpoint_service_owner : String | Nil

    def initialize(
      @connectivity : XksProxyConnectivityType | Nil = nil,
      @access_key_id : String | Nil = nil,
      @uri_endpoint : String | Nil = nil,
      @uri_path : String | Nil = nil,
      @vpc_endpoint_service_name : String | Nil = nil,
      @vpc_endpoint_service_owner : String | Nil = nil,
    )
    end
  end
end
