private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetIpamDiscoveredAccountsRequest
    # A check for whether you have the required permissions for the action without actually making the
    # request and provides an error response. If you have the required permissions, the error response
    # is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # A resource discovery ID.
    property ipam_resource_discovery_id : String

    # The Amazon Web Services Region that the account information is returned from.
    property discovery_region : String

    # Discovered account filters.
    property filters : Array(Filter) | Nil

    # Specify the pagination token from a previous request to retrieve the next page of results.
    property next_token : String | Nil

    # The maximum number of discovered accounts to return in one page of results.
    property max_results : Int32 | Nil

    def initialize(
      @ipam_resource_discovery_id : String,
      @discovery_region : String,
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

      params << {"#{prefix}DiscoveryRegion", @discovery_region}

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
        discovery_region: Core::XMLValue.string(node.xpath_node("*[local-name()='DiscoveryRegion']")).not_nil!,
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

    def_equals_and_hash(@dry_run, @ipam_resource_discovery_id, @discovery_region, @filters, @next_token, @max_results)
  end
end
