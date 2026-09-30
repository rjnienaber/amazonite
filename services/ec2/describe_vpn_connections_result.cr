private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the output of DescribeVpnConnections.
  class DescribeVpnConnectionsResult
    # Information about one or more VPN connections.
    property vpn_connections : Array(VpnConnection) | Nil

    def initialize(
      @vpn_connections : Array(VpnConnection) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@vpn_connections || [] of VpnConnection).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}VpnConnectionSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        vpn_connections: node.xpath_nodes("*[local-name()='vpnConnectionSet']/*[local-name()='item']").map { |n| VpnConnection.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @vpn_connections
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@vpn_connections)
  end
end
