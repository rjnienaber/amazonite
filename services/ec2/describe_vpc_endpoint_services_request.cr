private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeVpcEndpointServicesRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The service names.
    property service_names : Array(String) | Nil

    # The filters.
    #
    # - `owner` - The ID or alias of the Amazon Web Services account that owns the service.
    #
    # - `service-name` - The name of the service.
    #
    # - `service-region` - The Region of the service.
    #
    # - `service-type` - The type of service (`Interface` | `Gateway` | `GatewayLoadBalancer`).
    #
    # - `supported-ip-address-types` - The IP address type (`ipv4` | `ipv6`).
    #
    # - `tag`: - The key/value combination of a tag assigned to the resource. Use the tag key in the
    # filter name and the tag value as the filter value. For example, to find all resources that have
    # a tag with the key `Owner` and the value `TeamA`, specify `tag:Owner` for the filter name and
    # `TeamA` for the filter value.
    #
    # - `tag-key` - The key of a tag assigned to the resource. Use this filter to find all resources
    # assigned a tag with a specific key, regardless of the tag value.
    property filters : Array(Filter) | Nil

    # The maximum number of items to return for this request. The request returns a token that you can
    # specify in a subsequent call to get the next set of results.
    #
    # Constraint: If the value is greater than 1,000, we return only 1,000 items.
    property max_results : Int32 | Nil

    # The token for the next set of items to return. (You received this token from a prior call.)
    property next_token : String | Nil

    # The service Regions.
    property service_regions : Array(String) | Nil

    def initialize(
      @dry_run : Bool | Nil = nil,
      @service_names : Array(String) | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
      @service_regions : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      (@service_names || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ServiceName.#{i}", item}
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

      (@service_regions || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ServiceRegion.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        service_names: node.xpath_nodes("*[local-name()='ServiceName']/*[local-name()='item']").map { |n| n.content },
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        service_regions: node.xpath_nodes("*[local-name()='ServiceRegion']/*[local-name()='item']").map { |n| n.content },
      )
    end

    def validate! : Nil
      if value = @filters
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@dry_run, @service_names, @filters, @max_results, @next_token, @service_regions)
  end
end
