private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetTransitGatewayPolicyTableEntriesRequest
    # The ID of the transit gateway policy table.
    property transit_gateway_policy_table_id : String

    # One or more filters. The possible values are:
    #
    # - `policy-rule-number` - The rule number for the transit gateway policy table entry.
    #
    # - `target-route-table-id` - The ID of the target route table.
    #
    # - `policy-rule.source-ip` - The source CIDR block for the policy rule.
    #
    # - `policy-rule.destination-ip` - The destination CIDR block for the policy rule.
    #
    # - `policy-rule.source-port` - The source port or port range for the policy rule.
    #
    # - `policy-rule.destination-port` - The destination port or port range for the policy rule.
    #
    # - `policy-rule.protocol` - The protocol for the policy rule.
    #
    # - `policy-rule.meta-data.key` - The metadata key for the policy rule.
    #
    # - `policy-rule.meta-data.value` - The metadata value for the policy rule.
    property filters : Array(Filter) | Nil

    # The maximum number of results to return with a single call. To retrieve the remaining results,
    # make another call with the returned `nextToken` value.
    property max_results : Int32 | Nil

    # The token for the next page of results.
    property next_token : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @transit_gateway_policy_table_id : String,
      @filters : Array(Filter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}TransitGatewayPolicyTableId", @transit_gateway_policy_table_id}

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
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
        transit_gateway_policy_table_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TransitGatewayPolicyTableId']")).not_nil!,
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
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

    def_equals_and_hash(@transit_gateway_policy_table_id, @filters, @max_results, @next_token, @dry_run)
  end
end
