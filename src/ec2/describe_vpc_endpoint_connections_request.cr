private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeVpcEndpointConnectionsRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The filters.
    #
    # - `ip-address-type` - The IP address type (`ipv4` | `ipv6`).
    #
    # - `service-id` - The ID of the service.
    #
    # - `vpc-endpoint-owner` - The ID of the Amazon Web Services account ID that owns the endpoint.
    #
    # - `vpc-endpoint-region` - The Region of the endpoint or `cross-region` to find endpoints for
    # other Regions.
    #
    # - `vpc-endpoint-state` - The state of the endpoint (`pendingAcceptance` | `pending` |
    # `available` | `deleting` | `deleted` | `rejected` | `failed`).
    #
    # - `vpc-endpoint-id` - The ID of the endpoint.
    property filters : Array(Filter) | Nil

    # The maximum number of results to return for the request in a single page. The remaining results
    # of the initial request can be seen by sending another request with the returned `NextToken`
    # value. This value can be between 5 and 1,000; if `MaxResults` is given a value larger than
    # 1,000, only 1,000 results are returned.
    property max_results : Int32 | Nil

    # The token to retrieve the next page of results.
    property next_token : String | Nil

    def initialize(
      @dry_run : Bool | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end

    def validate! : Nil
      if value = @filters
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@dry_run, @filters, @max_results, @next_token)
  end
end
