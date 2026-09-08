private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a route in the route server's routing database.
  class RouteServerRoute
    # The ID of the route server endpoint that received this route.
    property route_server_endpoint_id : String | Nil

    # The ID of the route server peer that advertised this route.
    property route_server_peer_id : String | Nil

    # Details about the installation status of this route in route tables.
    property route_installation_details : Array(RouteServerRouteInstallationDetail) | Nil

    # The current status of the route in the routing database. Values are `in-rib` or `in-fib`
    # depending on if the routes are in the RIB or the FIB database.
    #
    # The [Routing Information Base (RIB)](https://en.wikipedia.org/wiki/Routing_table) serves as a
    # database that stores all the routing information and network topology data collected by a router
    # or routing system, such as routes learned from BGP peers. The RIB is constantly updated as new
    # routing information is received or existing routes change. This ensures that the route server
    # always has the most current view of the network topology and can make optimal routing decisions.
    #
    # The [Forwarding Information Base
    # (FIB)](https://en.wikipedia.org/wiki/Forwarding_information_base) serves as a forwarding table
    # for what route server has determined are the best-path routes in the RIB after evaluating all
    # available routing information and policies. The FIB routes are installed on the route tables.
    # The FIB is recomputed whenever there are changes to the RIB.
    property route_status : RouteServerRouteStatus | Nil

    # The destination CIDR block of the route.
    property prefix : String | Nil

    # The AS path attributes of the BGP route.
    property as_paths : Array(String) | Nil

    # The Multi-Exit Discriminator (MED) value of the BGP route.
    property med : Int32 | Nil

    # The IP address for the next hop.
    property next_hop_ip : String | Nil

    def initialize(
      @route_server_endpoint_id : String | Nil = nil,
      @route_server_peer_id : String | Nil = nil,
      @route_installation_details : Array(RouteServerRouteInstallationDetail) | Nil = nil,
      @route_status : RouteServerRouteStatus | Nil = nil,
      @prefix : String | Nil = nil,
      @as_paths : Array(String) | Nil = nil,
      @med : Int32 | Nil = nil,
      @next_hop_ip : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @route_server_endpoint_id
        params << {"#{prefix}RouteServerEndpointId", value}
      end

      if value = @route_server_peer_id
        params << {"#{prefix}RouteServerPeerId", value}
      end

      (@route_installation_details || [] of RouteServerRouteInstallationDetail).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}RouteInstallationDetailSet.#{i}."))
      end

      if value = @route_status
        params << {"#{prefix}RouteStatus", value.to_json_object_key}
      end

      if value = @prefix
        params << {"#{prefix}Prefix", value}
      end

      (@as_paths || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}AsPathSet.#{i}", item}
      end

      if value = @med
        params << {"#{prefix}Med", value.to_s}
      end

      if value = @next_hop_ip
        params << {"#{prefix}NextHopIp", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        route_server_endpoint_id: Core::XMLValue.string(node.xpath_node("*[local-name()='routeServerEndpointId']")),
        route_server_peer_id: Core::XMLValue.string(node.xpath_node("*[local-name()='routeServerPeerId']")),
        route_installation_details: node.xpath_nodes("*[local-name()='routeInstallationDetailSet']/*[local-name()='item']").map { |n| RouteServerRouteInstallationDetail.from_xml(n) },
        route_status: (n = node.xpath_node("*[local-name()='routeStatus']")) ? AEC::RouteServerRouteStatus.from_json_object_key?(n.content) : nil,
        prefix: Core::XMLValue.string(node.xpath_node("*[local-name()='prefix']")),
        as_paths: node.xpath_nodes("*[local-name()='asPathSet']/*[local-name()='item']").map { |n| n.content },
        med: Core::XMLValue.i32(node.xpath_node("*[local-name()='med']")),
        next_hop_ip: Core::XMLValue.string(node.xpath_node("*[local-name()='nextHopIp']")),
      )
    end

    def validate! : Nil
      if value = @route_installation_details
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@route_server_endpoint_id, @route_server_peer_id, @route_installation_details, @route_status, @prefix, @as_paths, @med, @next_hop_ip)
  end
end
