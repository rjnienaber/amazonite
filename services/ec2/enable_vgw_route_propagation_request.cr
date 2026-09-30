private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the parameters for EnableVgwRoutePropagation.
  class EnableVgwRoutePropagationRequest
    # The ID of the virtual private gateway that is attached to a VPC. The virtual private gateway
    # must be attached to the same VPC that the routing tables are associated with.
    property gateway_id : String

    # The ID of the route table. The routing table must be associated with the same VPC that the
    # virtual private gateway is attached to.
    property route_table_id : String

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @gateway_id : String,
      @route_table_id : String,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}GatewayId", @gateway_id}

      params << {"#{prefix}RouteTableId", @route_table_id}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='GatewayId']")).not_nil!,
        route_table_id: Core::XMLValue.string(node.xpath_node("*[local-name()='RouteTableId']")).not_nil!,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@gateway_id, @route_table_id, @dry_run)
  end
end
