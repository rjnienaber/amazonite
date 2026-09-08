private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the association between a route server and a VPC.
  #
  # A route server association is the connection established between a route server and a VPC.
  class RouteServerAssociation
    # The ID of the associated route server.
    property route_server_id : String | Nil

    # The ID of the associated VPC.
    property vpc_id : String | Nil

    # The current state of the association.
    property state : RouteServerAssociationState | Nil

    def initialize(
      @route_server_id : String | Nil = nil,
      @vpc_id : String | Nil = nil,
      @state : RouteServerAssociationState | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @route_server_id
        params << {"#{prefix}RouteServerId", value}
      end

      if value = @vpc_id
        params << {"#{prefix}VpcId", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        route_server_id: Core::XMLValue.string(node.xpath_node("*[local-name()='routeServerId']")),
        vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcId']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::RouteServerAssociationState.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@route_server_id, @vpc_id, @state)
  end
end
