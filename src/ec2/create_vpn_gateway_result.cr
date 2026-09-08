private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the output of CreateVpnGateway.
  class CreateVpnGatewayResult
    # Information about the virtual private gateway.
    property vpn_gateway : VpnGateway | Nil

    def initialize(
      @vpn_gateway : VpnGateway | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @vpn_gateway
        params.concat(value.to_query_params("#{prefix}VpnGateway."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        vpn_gateway: node.xpath_node("*[local-name()='vpnGateway']").try { |n| VpnGateway.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @vpn_gateway
        value.validate!
      end
    end

    def_equals_and_hash(@vpn_gateway)
  end
end
