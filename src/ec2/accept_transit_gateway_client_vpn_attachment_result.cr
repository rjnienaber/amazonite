private alias Core = Amazonite::Core

module Amazonite::EC2
  class AcceptTransitGatewayClientVpnAttachmentResult
    # Information about the Transit Gateway Client VPN attachment.
    property transit_gateway_client_vpn_attachment : TransitGatewayClientVpnAttachment | Nil

    def initialize(
      @transit_gateway_client_vpn_attachment : TransitGatewayClientVpnAttachment | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @transit_gateway_client_vpn_attachment
        params.concat(value.to_query_params("#{prefix}TransitGatewayClientVpnAttachment."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_client_vpn_attachment: node.xpath_node("*[local-name()='transitGatewayClientVpnAttachment']").try { |n| TransitGatewayClientVpnAttachment.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @transit_gateway_client_vpn_attachment
        value.validate!
      end
    end

    def_equals_and_hash(@transit_gateway_client_vpn_attachment)
  end
end
