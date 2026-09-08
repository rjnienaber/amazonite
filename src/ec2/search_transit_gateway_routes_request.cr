private alias Core = Amazonite::Core

module Amazonite::EC2
  class SearchTransitGatewayRoutesRequest
    # The ID of the transit gateway route table.
    property transit_gateway_route_table_id : String

    # One or more filters. The possible values are:
    #
    # - `attachment.transit-gateway-attachment-id`- The id of the transit gateway attachment.
    #
    # - `attachment.resource-id` - The resource id of the transit gateway attachment.
    #
    # - `attachment.resource-type` - The attachment resource type. Valid values are `vpc` | `vpn` |
    # `direct-connect-gateway` | `peering` | `connect`.
    #
    # - `prefix-list-id` - The ID of the prefix list.
    #
    # - `route-search.exact-match` - The exact match of the specified filter.
    #
    # - `route-search.longest-prefix-match` - The longest prefix that matches the route.
    #
    # - `route-search.subnet-of-match` - The routes with a subnet that match the specified CIDR
    # filter.
    #
    # - `route-search.supernet-of-match` - The routes with a CIDR that encompass the CIDR filter. For
    # example, if you have 10.0.1.0/29 and 10.0.1.0/31 routes in your route table and you specify
    # supernet-of-match as 10.0.1.0/30, then the result returns 10.0.1.0/29.
    #
    # - `state` - The state of the route (`active` | `blackhole`).
    #
    # - `type` - The type of route (`propagated` | `static`).
    property filters : Array(Filter) = [] of Filter

    # The maximum number of routes to return. If a value is not provided, the default is 1000.
    property max_results : Int32 | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The token for the next page of results.
    property next_token : String | Nil

    def initialize(
      @transit_gateway_route_table_id : String,
      @filters : Array(Filter),
      @max_results : Int32 | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}TransitGatewayRouteTableId", @transit_gateway_route_table_id}

      @filters.each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_route_table_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TransitGatewayRouteTableId']")).not_nil!,
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end

    def validate! : Nil
      if value = @filters
        value.each(&.validate!)
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 5") if value < 5
        raise Core::ValidationError.new("MaxResults value must be <= 1000") if value > 1000
      end
    end

    def_equals_and_hash(@transit_gateway_route_table_id, @filters, @max_results, @dry_run, @next_token)
  end
end
