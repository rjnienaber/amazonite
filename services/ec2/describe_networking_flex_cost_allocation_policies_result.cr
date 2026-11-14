private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeNetworkingFlexCostAllocationPoliciesResult
    # Information about the flex cost allocation policies.
    property flex_cost_allocation_policies : Array(FlexCostAllocationPolicyDescription) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @flex_cost_allocation_policies : Array(FlexCostAllocationPolicyDescription) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@flex_cost_allocation_policies || [] of FlexCostAllocationPolicyDescription).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}FlexCostAllocationPolicies.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        flex_cost_allocation_policies: node.xpath_nodes("*[local-name()='flexCostAllocationPolicies']/*[local-name()='item']").map { |n| FlexCostAllocationPolicyDescription.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @flex_cost_allocation_policies
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@flex_cost_allocation_policies, @next_token)
  end
end
