private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the parameters for DeleteVpnConnectionRoute.
  class DeleteVpnConnectionRouteRequest
    # The CIDR block associated with the local subnet of the customer network.
    property destination_cidr_block : String

    # The ID of the VPN connection.
    property vpn_connection_id : String

    def initialize(
      @destination_cidr_block : String,
      @vpn_connection_id : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}DestinationCidrBlock", @destination_cidr_block}

      params << {"#{prefix}VpnConnectionId", @vpn_connection_id}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        destination_cidr_block: Core::XMLValue.string(node.xpath_node("*[local-name()='DestinationCidrBlock']")).not_nil!,
        vpn_connection_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VpnConnectionId']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@destination_cidr_block, @vpn_connection_id)
  end
end
