private alias Core = Amazonite::Core

module Amazonite::EC2
  class ReplaceRouteTableAssociationRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The association ID.
    property association_id : String

    # The ID of the new route table to associate with the subnet.
    property route_table_id : String

    def initialize(
      @association_id : String,
      @route_table_id : String,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}AssociationId", @association_id}

      params << {"#{prefix}RouteTableId", @route_table_id}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        association_id: Core::XMLValue.string(node.xpath_node("*[local-name()='associationId']")).not_nil!,
        route_table_id: Core::XMLValue.string(node.xpath_node("*[local-name()='routeTableId']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @association_id, @route_table_id)
  end
end
