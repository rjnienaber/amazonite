private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetNetworkingFlexCostAllocationPolicyVersionsResult
    # Information about the policy versions.
    property fca_policy_versions : Array(FlexCostAllocationPolicyVersion) | Nil

    def initialize(
      @fca_policy_versions : Array(FlexCostAllocationPolicyVersion) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@fca_policy_versions || [] of FlexCostAllocationPolicyVersion).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}FcaPolicyVersions.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        fca_policy_versions: node.xpath_nodes("*[local-name()='fcaPolicyVersions']/*[local-name()='item']").map { |n| FlexCostAllocationPolicyVersion.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @fca_policy_versions
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@fca_policy_versions)
  end
end
