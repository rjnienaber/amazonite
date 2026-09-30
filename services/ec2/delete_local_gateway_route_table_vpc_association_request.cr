private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteLocalGatewayRouteTableVpcAssociationRequest
    # The ID of the association.
    property local_gateway_route_table_vpc_association_id : String

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @local_gateway_route_table_vpc_association_id : String,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}LocalGatewayRouteTableVpcAssociationId", @local_gateway_route_table_vpc_association_id}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        local_gateway_route_table_vpc_association_id: Core::XMLValue.string(node.xpath_node("*[local-name()='LocalGatewayRouteTableVpcAssociationId']")).not_nil!,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@local_gateway_route_table_vpc_association_id, @dry_run)
  end
end
