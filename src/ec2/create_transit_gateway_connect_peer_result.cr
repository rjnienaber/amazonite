private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateTransitGatewayConnectPeerResult
    # Information about the Connect peer.
    property transit_gateway_connect_peer : TransitGatewayConnectPeer | Nil

    def initialize(
      @transit_gateway_connect_peer : TransitGatewayConnectPeer | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @transit_gateway_connect_peer
        params.concat(value.to_query_params("#{prefix}TransitGatewayConnectPeer."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_connect_peer: node.xpath_node("*[local-name()='transitGatewayConnectPeer']").try { |n| TransitGatewayConnectPeer.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @transit_gateway_connect_peer
        value.validate!
      end
    end

    def_equals_and_hash(@transit_gateway_connect_peer)
  end
end
