private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetIpamDiscoveredRoutesRequest
    # Checks whether you have the required permissions for the operation, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the IPAM resource discovery.
    property ipam_resource_discovery_id : String

    # The Amazon Web Services Region to retrieve discovered routes for.
    property resource_region : String

    # One or more filters to apply to the results.
    property filters : Array(Filter) | Nil

    # The token for the next page of results.
    property next_token : String | Nil

    # The maximum number of results to return in a single call. If not specified, all available
    # results are returned. To retrieve the remaining results, make another call with the returned
    # `nextToken` value.
    property max_results : Int32 | Nil

    def initialize(
      @ipam_resource_discovery_id : String,
      @resource_region : String,
      @dry_run : Bool | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}IpamResourceDiscoveryId", @ipam_resource_discovery_id}

      params << {"#{prefix}ResourceRegion", @resource_region}

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        ipam_resource_discovery_id: Core::XMLValue.string(node.xpath_node("*[local-name()='IpamResourceDiscoveryId']")).not_nil!,
        resource_region: Core::XMLValue.string(node.xpath_node("*[local-name()='ResourceRegion']")).not_nil!,
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
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

    def_equals_and_hash(@dry_run, @ipam_resource_discovery_id, @resource_region, @filters, @next_token, @max_results)
  end
end
