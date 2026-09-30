private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateClientVpnEndpointResult
    # The ID of the Client VPN endpoint.
    property client_vpn_endpoint_id : String | Nil

    # The current state of the Client VPN endpoint.
    property status : ClientVpnEndpointStatus | Nil

    # The DNS name to be used by clients when establishing their VPN session.
    property dns_name : String | Nil

    def initialize(
      @client_vpn_endpoint_id : String | Nil = nil,
      @status : ClientVpnEndpointStatus | Nil = nil,
      @dns_name : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @client_vpn_endpoint_id
        params << {"#{prefix}ClientVpnEndpointId", value}
      end

      if value = @status
        params.concat(value.to_query_params("#{prefix}Status."))
      end

      if value = @dns_name
        params << {"#{prefix}DnsName", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        client_vpn_endpoint_id: Core::XMLValue.string(node.xpath_node("*[local-name()='clientVpnEndpointId']")),
        status: node.xpath_node("*[local-name()='status']").try { |n| ClientVpnEndpointStatus.from_xml(n) },
        dns_name: Core::XMLValue.string(node.xpath_node("*[local-name()='dnsName']")),
      )
    end

    def validate! : Nil
      if value = @status
        value.validate!
      end
    end

    def_equals_and_hash(@client_vpn_endpoint_id, @status, @dns_name)
  end
end
