private alias Core = Amazonite::Core

module Amazonite::EC2
  class DisassociateNetworkingFlexCostAllocationPolicyResult
    # The IDs of the policy associations that were removed.
    property fca_policy_disassociations : Array(String) | Nil

    # Information about the policy associations that could not be removed.
    property fca_policy_disassociation_failures : Array(FlexCostAllocationOperationFailure) | Nil

    def initialize(
      @fca_policy_disassociations : Array(String) | Nil = nil,
      @fca_policy_disassociation_failures : Array(FlexCostAllocationOperationFailure) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@fca_policy_disassociations || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}FcaPolicyDisassociations.#{i}", item}
      end

      (@fca_policy_disassociation_failures || [] of FlexCostAllocationOperationFailure).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}FcaPolicyDisassociationFailures.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        fca_policy_disassociations: node.xpath_nodes("*[local-name()='fcaPolicyDisassociations']/*[local-name()='item']").map { |n| n.content },
        fca_policy_disassociation_failures: node.xpath_nodes("*[local-name()='fcaPolicyDisassociationFailures']/*[local-name()='item']").map { |n| FlexCostAllocationOperationFailure.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @fca_policy_disassociations
        raise Core::ValidationError.new("FcaPolicyDisassociations must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("FcaPolicyDisassociations must have at most 1000 item(s)") if value.size > 1000
      end

      if value = @fca_policy_disassociation_failures
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@fca_policy_disassociations, @fca_policy_disassociation_failures)
  end
end
