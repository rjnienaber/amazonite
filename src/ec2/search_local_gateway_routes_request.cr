private alias Core = Amazonite::Core

module Amazonite::EC2
  class SearchLocalGatewayRoutesRequest
    # The ID of the local gateway route table.
    property local_gateway_route_table_id : String

    # One or more filters.
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
    # `supernet-of-match` as 10.0.1.0/30, then the result returns 10.0.1.0/29.
    #
    # - `state` - The state of the route.
    #
    # - `type` - The route type.
    property filters : Array(Filter) | Nil

    # The maximum number of results to return with a single call. To retrieve the remaining results,
    # make another call with the returned `nextToken` value.
    property max_results : Int32 | Nil

    # The token for the next page of results.
    property next_token : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @local_gateway_route_table_id : String,
      @filters : Array(Filter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}LocalGatewayRouteTableId", @local_gateway_route_table_id}

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        local_gateway_route_table_id: Core::XMLValue.string(node.xpath_node("*[local-name()='LocalGatewayRouteTableId']")).not_nil!,
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
      if value = @filters
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@local_gateway_route_table_id, @filters, @max_results, @next_token, @dry_run)
  end
end
