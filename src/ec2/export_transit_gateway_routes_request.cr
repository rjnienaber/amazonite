private alias Core = Amazonite::Core

module Amazonite::EC2
  class ExportTransitGatewayRoutesRequest
    # The ID of the route table.
    property transit_gateway_route_table_id : String

    # One or more filters. The possible values are:
    #
    # - `attachment.transit-gateway-attachment-id` - The id of the transit gateway attachment.
    #
    # - `attachment.resource-id` - The resource id of the transit gateway attachment.
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
    # - `transit-gateway-route-destination-cidr-block` - The CIDR range.
    #
    # - `type` - The type of route (`propagated` | `static`).
    property filters : Array(Filter) | Nil

    # The name of the S3 bucket.
    property s3_bucket : String

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @transit_gateway_route_table_id : String,
      @s3_bucket : String,
      @filters : Array(Filter) | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}TransitGatewayRouteTableId", @transit_gateway_route_table_id}

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end

      params << {"#{prefix}S3Bucket", @s3_bucket}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_route_table_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TransitGatewayRouteTableId']")).not_nil!,
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        s3_bucket: Core::XMLValue.string(node.xpath_node("*[local-name()='S3Bucket']")).not_nil!,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
      if value = @filters
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@transit_gateway_route_table_id, @filters, @s3_bucket, @dry_run)
  end
end
