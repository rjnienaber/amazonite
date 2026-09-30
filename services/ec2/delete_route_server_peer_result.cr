private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteRouteServerPeerResult
    # Information about the deleted route server peer.
    property route_server_peer : RouteServerPeer | Nil

    def initialize(
      @route_server_peer : RouteServerPeer | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @route_server_peer
        params.concat(value.to_query_params("#{prefix}RouteServerPeer."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        route_server_peer: node.xpath_node("*[local-name()='routeServerPeer']").try { |n| RouteServerPeer.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @route_server_peer
        value.validate!
      end
    end

    def_equals_and_hash(@route_server_peer)
  end
end
