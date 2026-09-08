private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyVpnConnectionOptionsResult
    # Information about the VPN connection.
    property vpn_connection : VpnConnection | Nil

    def initialize(
      @vpn_connection : VpnConnection | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @vpn_connection
        params.concat(value.to_query_params("#{prefix}VpnConnection."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        vpn_connection: node.xpath_node("*[local-name()='vpnConnection']").try { |n| VpnConnection.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @vpn_connection
        value.validate!
      end
    end

    def_equals_and_hash(@vpn_connection)
  end
end
