private alias AAG = Amazonite::ApiGatewayV1
private alias Core = Amazonite::Core

module Amazonite::ApiGatewayV1
  # The endpoint configuration to indicate the types of endpoints an API (RestApi) or its custom
  # domain name (DomainName) has and the IP address types that can invoke it.
  class EndpointConfiguration
    include JSON::Serializable

    # A list of endpoint types of an API (RestApi) or its custom domain name (DomainName). For an
    # edge-optimized API and its custom domain name, the endpoint type is `"EDGE"`. For a regional API
    # and its custom domain name, the endpoint type is `REGIONAL`. For a private API, the endpoint
    # type is `PRIVATE`.
    @[JSON::Field(key: "types", converter: Core::ArrayConverter(AAG::EndpointType))]
    property types : Array(EndpointType) | Nil

    # The IP address types that can invoke an API (RestApi) or a DomainName. Use `ipv4` to allow only
    # IPv4 addresses to invoke an API or DomainName, or use `dualstack` to allow both IPv4 and IPv6
    # addresses to invoke an API or a DomainName. For the `PRIVATE` endpoint type, only `dualstack` is
    # supported.
    @[JSON::Field(key: "ipAddressType", converter: AAG::IpAddressType)]
    property ip_address_type : IpAddressType | Nil

    # A list of VpcEndpointIds of an API (RestApi) against which to create Route53 ALIASes. It is only
    # supported for `PRIVATE` endpoint type.
    @[JSON::Field(key: "vpcEndpointIds")]
    property vpc_endpoint_ids : Array(String) | Nil

    def initialize(
      @types : Array(EndpointType) | Nil = nil,
      @ip_address_type : IpAddressType | Nil = nil,
      @vpc_endpoint_ids : Array(String) | Nil = nil,
    )
    end
  end
end
