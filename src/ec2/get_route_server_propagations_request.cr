private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetRouteServerPropagationsRequest
    # The ID of the route server for which to get propagation information.
    property route_server_id : String

    # The ID of the route table for which to get propagation information.
    property route_table_id : String | Nil

    # A check for whether you have the required permissions for the action without actually making the
    # request and provides an error response. If you have the required permissions, the error response
    # is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @route_server_id : String,
      @route_table_id : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}RouteServerId", @route_server_id}

      if value = @route_table_id
        params << {"#{prefix}RouteTableId", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        route_server_id: Core::XMLValue.string(node.xpath_node("*[local-name()='RouteServerId']")).not_nil!,
        route_table_id: Core::XMLValue.string(node.xpath_node("*[local-name()='RouteTableId']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@route_server_id, @route_table_id, @dry_run)
  end
end
