private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeRouteServerPeersResult
    # Information about the described route server peers.
    property route_server_peers : Array(RouteServerPeer) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @route_server_peers : Array(RouteServerPeer) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@route_server_peers || [] of RouteServerPeer).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}RouteServerPeerSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        route_server_peers: node.xpath_nodes("*[local-name()='routeServerPeerSet']/*[local-name()='item']").map { |n| RouteServerPeer.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @route_server_peers
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@route_server_peers, @next_token)
  end
end
