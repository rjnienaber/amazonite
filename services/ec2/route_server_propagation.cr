private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the route propagation configuration between a route server and a route table.
  #
  # When enabled, route server propagation installs the routes in the FIB on the route table you've
  # specified. Route server supports IPv4 and IPv6 route propagation.
  class RouteServerPropagation
    # The ID of the route server configured for route propagation.
    property route_server_id : String | Nil

    # The ID of the route table configured for route server propagation.
    property route_table_id : String | Nil

    # The current state of route propagation.
    property state : RouteServerPropagationState | Nil

    def initialize(
      @route_server_id : String | Nil = nil,
      @route_table_id : String | Nil = nil,
      @state : RouteServerPropagationState | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @route_server_id
        params << {"#{prefix}RouteServerId", value}
      end

      if value = @route_table_id
        params << {"#{prefix}RouteTableId", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        route_server_id: Core::XMLValue.string(node.xpath_node("*[local-name()='routeServerId']")),
        route_table_id: Core::XMLValue.string(node.xpath_node("*[local-name()='routeTableId']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::RouteServerPropagationState.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@route_server_id, @route_table_id, @state)
  end
end
