private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeIpamResourceDiscoveryAssociationsRequest
    # A check for whether you have the required permissions for the action without actually making the
    # request and provides an error response. If you have the required permissions, the error response
    # is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The resource discovery association IDs.
    property ipam_resource_discovery_association_ids : Array(String) | Nil

    # Specify the pagination token from a previous request to retrieve the next page of results.
    property next_token : String | Nil

    # The maximum number of resource discovery associations to return in one page of results.
    property max_results : Int32 | Nil

    # The resource discovery association filters.
    property filters : Array(Filter) | Nil

    def initialize(
      @dry_run : Bool | Nil = nil,
      @ipam_resource_discovery_association_ids : Array(String) | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      (@ipam_resource_discovery_association_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}IpamResourceDiscoveryAssociationId.#{i}", item}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        ipam_resource_discovery_association_ids: node.xpath_nodes("*[local-name()='IpamResourceDiscoveryAssociationId']/*[local-name()='item']").map { |n| n.content },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 5") if value < 5
        raise Core::ValidationError.new("MaxResults value must be <= 1000") if value > 1000
      end

      if value = @filters
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@dry_run, @ipam_resource_discovery_association_ids, @next_token, @max_results, @filters)
  end
end
