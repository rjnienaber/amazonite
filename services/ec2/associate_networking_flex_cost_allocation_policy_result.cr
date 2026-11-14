private alias Core = Amazonite::Core

module Amazonite::EC2
  class AssociateNetworkingFlexCostAllocationPolicyResult
    # Information about the policy associations that were created.
    property fca_policy_associations : Array(FlexCostAllocationPolicyAssociationDescription) | Nil

    # Information about the network resources that could not be associated with the policy.
    property fca_policy_association_failures : Array(FlexCostAllocationOperationFailure) | Nil

    def initialize(
      @fca_policy_associations : Array(FlexCostAllocationPolicyAssociationDescription) | Nil = nil,
      @fca_policy_association_failures : Array(FlexCostAllocationOperationFailure) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@fca_policy_associations || [] of FlexCostAllocationPolicyAssociationDescription).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}FcaPolicyAssociations.#{i}."))
      end

      (@fca_policy_association_failures || [] of FlexCostAllocationOperationFailure).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}FcaPolicyAssociationFailures.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        fca_policy_associations: node.xpath_nodes("*[local-name()='fcaPolicyAssociations']/*[local-name()='item']").map { |n| FlexCostAllocationPolicyAssociationDescription.from_xml(n) },
        fca_policy_association_failures: node.xpath_nodes("*[local-name()='fcaPolicyAssociationFailures']/*[local-name()='item']").map { |n| FlexCostAllocationOperationFailure.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @fca_policy_associations
        value.each(&.validate!)
      end

      if value = @fca_policy_association_failures
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@fca_policy_associations, @fca_policy_association_failures)
  end
end
