private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeNetworkingFlexCostAllocationPoliciesRequest
    # The IDs of the flex cost allocation policies to describe.
    property fca_policy_ids : Array(String) | Nil

    # The maximum number of results to return in a single call. The range is 5 to 1000. To retrieve
    # the remaining results, make another call with the returned `nextToken` value.
    #
    # Default: 100
    property max_results : Int32 | Nil

    # The filters.
    #
    # - `fca-policy-id` - The ID of the policy.
    #
    # - `managed-by` - The entity that manages the policy (`account` | `declarative-policy`).
    #
    # - `network-resource-type` - The type of network resource that the policy applies to (`natgw` |
    # `ec2` | `pcx`).
    #
    # - `showback-enabled` - Indicates whether showback reporting is enabled for the policy (`true` |
    # `false`).
    property filters : Array(Filter) | Nil

    # The token for the next page of results.
    property next_token : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @fca_policy_ids : Array(String) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
      @next_token : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@fca_policy_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}FcaPolicyIds.#{i}", item}
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filters.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        fca_policy_ids: node.xpath_nodes("*[local-name()='FcaPolicyIds']/*[local-name()='item']").map { |n| n.content },
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        filters: node.xpath_nodes("*[local-name()='Filters']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
      if value = @fca_policy_ids
        raise Core::ValidationError.new("FcaPolicyIds must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("FcaPolicyIds must have at most 1000 item(s)") if value.size > 1000
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 5") if value < 5
        raise Core::ValidationError.new("MaxResults value must be <= 1000") if value > 1000
      end

      if value = @filters
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@fca_policy_ids, @max_results, @filters, @next_token, @dry_run)
  end
end
