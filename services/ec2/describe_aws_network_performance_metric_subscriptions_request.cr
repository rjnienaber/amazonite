private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeAwsNetworkPerformanceMetricSubscriptionsRequest
    # The maximum number of results to return with a single call. To retrieve the remaining results,
    # make another call with the returned `nextToken` value.
    property max_results : Int32 | Nil

    # The token for the next page of results.
    property next_token : String | Nil

    # One or more filters.
    property filters : Array(Filter) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 0") if value < 0
        raise Core::ValidationError.new("MaxResults value must be <= 100") if value > 100
      end

      if value = @filters
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@max_results, @next_token, @filters, @dry_run)
  end
end
