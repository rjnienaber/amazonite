private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeNetworkInsightsPathsRequest
    # The IDs of the paths.
    property network_insights_path_ids : Array(String) | Nil

    # The filters. The following are the possible values:
    #
    # - destination - The ID of the resource.
    #
    # - filter-at-source.source-address - The source IPv4 address at the source.
    #
    # - filter-at-source.source-port-range - The source port range at the source.
    #
    # - filter-at-source.destination-address - The destination IPv4 address at the source.
    #
    # - filter-at-source.destination-port-range - The destination port range at the source.
    #
    # - filter-at-destination.source-address - The source IPv4 address at the destination.
    #
    # - filter-at-destination.source-port-range - The source port range at the destination.
    #
    # - filter-at-destination.destination-address - The destination IPv4 address at the destination.
    #
    # - filter-at-destination.destination-port-range - The destination port range at the destination.
    #
    # - protocol - The protocol.
    #
    # - source - The ID of the resource.
    property filters : Array(Filter) | Nil

    # The maximum number of results to return with a single call. To retrieve the remaining results,
    # make another call with the returned `nextToken` value.
    property max_results : Int32 | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The token for the next page of results.
    property next_token : String | Nil

    def initialize(
      @network_insights_path_ids : Array(String) | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@network_insights_path_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}NetworkInsightsPathId.#{i}", item}
      end

      (@filters || [] of Filter).each_with_index(1) do |item, i|
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
        network_insights_path_ids: node.xpath_nodes("*[local-name()='NetworkInsightsPathId']/*[local-name()='item']").map { |n| n.content },
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
        raise Core::ValidationError.new("MaxResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxResults value must be <= 100") if value > 100
      end
    end

    def_equals_and_hash(@network_insights_path_ids, @filters, @max_results, @dry_run, @next_token)
  end
end
