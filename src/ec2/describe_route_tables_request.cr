private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeRouteTablesRequest
    # The token returned from a previous paginated request. Pagination continues from the end of the
    # items returned by the previous request.
    property next_token : String | Nil

    # The maximum number of items to return for this request. To get the next page of items, make
    # another request with the token returned in the output. For more information, see
    # [Pagination](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Query-Requests.html#api-pagination).
    property max_results : Int32 | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The IDs of the route tables.
    property route_table_ids : Array(String) | Nil

    # The filters.
    #
    # - `association.gateway-id` - The ID of the gateway involved in the association.
    #
    # - `association.route-table-association-id` - The ID of an association ID for the route table.
    #
    # - `association.route-table-id` - The ID of the route table involved in the association.
    #
    # - `association.subnet-id` - The ID of the subnet involved in the association.
    #
    # - `association.main` - Indicates whether the route table is the main route table for the VPC
    # (`true` | `false`). Route tables that do not have an association ID are not returned in the
    # response.
    #
    # - `owner-id` - The ID of the Amazon Web Services account that owns the route table.
    #
    # - `route-table-id` - The ID of the route table.
    #
    # - `route.destination-cidr-block` - The IPv4 CIDR range specified in a route in the table.
    #
    # - `route.destination-ipv6-cidr-block` - The IPv6 CIDR range specified in a route in the route
    # table.
    #
    # - `route.destination-prefix-list-id` - The ID (prefix) of the Amazon Web Services service
    # specified in a route in the table.
    #
    # - `route.egress-only-internet-gateway-id` - The ID of an egress-only Internet gateway specified
    # in a route in the route table.
    #
    # - `route.gateway-id` - The ID of a gateway specified in a route in the table.
    #
    # - `route.instance-id` - The ID of an instance specified in a route in the table.
    #
    # - `route.nat-gateway-id` - The ID of a NAT gateway.
    #
    # - `route.transit-gateway-id` - The ID of a transit gateway.
    #
    # - `route.origin` - Describes how the route was created. `CreateRouteTable` indicates that the
    # route was automatically created when the route table was created; `CreateRoute` indicates that
    # the route was manually added to the route table; `EnableVgwRoutePropagation` indicates that the
    # route was propagated by route propagation.
    #
    # - `route.state` - The state of a route in the route table (`active` | `blackhole`). The
    # blackhole state indicates that the route's target isn't available (for example, the specified
    # gateway isn't attached to the VPC, the specified NAT instance has been terminated, and so on).
    #
    # - `route.vpc-peering-connection-id` - The ID of a VPC peering connection specified in a route in
    # the table.
    #
    # - `tag` - The key/value combination of a tag assigned to the resource. Use the tag key in the
    # filter name and the tag value as the filter value. For example, to find all resources that have
    # a tag with the key `Owner` and the value `TeamA`, specify `tag:Owner` for the filter name and
    # `TeamA` for the filter value.
    #
    # - `tag-key` - The key of a tag assigned to the resource. Use this filter to find all resources
    # assigned a tag with a specific key, regardless of the tag value.
    #
    # - `vpc-id` - The ID of the VPC for the route table.
    property filters : Array(Filter) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @route_table_ids : Array(String) | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      (@route_table_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}RouteTableId.#{i}", item}
      end

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        route_table_ids: node.xpath_nodes("*[local-name()='RouteTableId']/*[local-name()='item']").map { |n| n.content },
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 5") if value < 5
        raise Core::ValidationError.new("MaxResults value must be <= 100") if value > 100
      end

      if value = @filters
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@next_token, @max_results, @dry_run, @route_table_ids, @filters)
  end
end
