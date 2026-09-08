private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteRouteRequest
    # The ID of the prefix list for the route.
    property destination_prefix_list_id : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the route table.
    property route_table_id : String

    # The IPv4 CIDR range for the route. The value you specify must match the CIDR for the route
    # exactly.
    property destination_cidr_block : String | Nil

    # The IPv6 CIDR range for the route. The value you specify must match the CIDR for the route
    # exactly.
    property destination_ipv_6_cidr_block : String | Nil

    def initialize(
      @route_table_id : String,
      @destination_prefix_list_id : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @destination_cidr_block : String | Nil = nil,
      @destination_ipv_6_cidr_block : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @destination_prefix_list_id
        params << {"#{prefix}DestinationPrefixListId", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}RouteTableId", @route_table_id}

      if value = @destination_cidr_block
        params << {"#{prefix}DestinationCidrBlock", value}
      end

      if value = @destination_ipv_6_cidr_block
        params << {"#{prefix}DestinationIpv6CidrBlock", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        destination_prefix_list_id: Core::XMLValue.string(node.xpath_node("*[local-name()='DestinationPrefixListId']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        route_table_id: Core::XMLValue.string(node.xpath_node("*[local-name()='routeTableId']")).not_nil!,
        destination_cidr_block: Core::XMLValue.string(node.xpath_node("*[local-name()='destinationCidrBlock']")),
        destination_ipv_6_cidr_block: Core::XMLValue.string(node.xpath_node("*[local-name()='destinationIpv6CidrBlock']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@destination_prefix_list_id, @dry_run, @route_table_id, @destination_cidr_block, @destination_ipv_6_cidr_block)
  end
end
