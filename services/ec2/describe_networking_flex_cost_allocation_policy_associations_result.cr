private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeNetworkingFlexCostAllocationPolicyAssociationsResult
    # Information about the policy associations.
    property fca_policy_associations : Array(FlexCostAllocationPolicyAssociationDescription) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @fca_policy_associations : Array(FlexCostAllocationPolicyAssociationDescription) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@fca_policy_associations || [] of FlexCostAllocationPolicyAssociationDescription).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}FcaPolicyAssociations.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        fca_policy_associations: node.xpath_nodes("*[local-name()='fcaPolicyAssociations']/*[local-name()='item']").map { |n| FlexCostAllocationPolicyAssociationDescription.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @fca_policy_associations
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@fca_policy_associations, @next_token)
  end
end
