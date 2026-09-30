private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeIpamInternetRegistryAssociationsRequest
    # Checks whether you have the required permissions for the operation, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The IDs of the internet registry associations to describe.
    property ipam_internet_registry_association_ids : Array(String) | Nil

    # The maximum number of results to return in a single call. If not specified, all available
    # results are returned. To retrieve the remaining results, make another call with the returned
    # `nextToken` value.
    property max_results : Int32 | Nil

    # The token for the next page of results.
    property next_token : String | Nil

    # One or more filters to apply to the results.
    property filters : Array(Filter) | Nil

    def initialize(
      @dry_run : Bool | Nil = nil,
      @ipam_internet_registry_association_ids : Array(String) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      (@ipam_internet_registry_association_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}IpamInternetRegistryAssociationId.#{i}", item}
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        ipam_internet_registry_association_ids: node.xpath_nodes("*[local-name()='IpamInternetRegistryAssociationId']/*[local-name()='item']").map { |n| n.content },
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
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

    def_equals_and_hash(@dry_run, @ipam_internet_registry_association_ids, @max_results, @next_token, @filters)
  end
end
