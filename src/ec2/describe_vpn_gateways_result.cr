private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the output of DescribeVpnGateways.
  class DescribeVpnGatewaysResult
    # Information about one or more virtual private gateways.
    property vpn_gateways : Array(VpnGateway) | Nil

    def initialize(
      @vpn_gateways : Array(VpnGateway) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@vpn_gateways || [] of VpnGateway).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}VpnGatewaySet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        vpn_gateways: node.xpath_nodes("*[local-name()='vpnGatewaySet']/*[local-name()='item']").map { |n| VpnGateway.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @vpn_gateways
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@vpn_gateways)
  end
end
