private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyIpamPolicyAllocationRulesResult
    # The modified IPAM policy containing the updated allocation rules.
    property ipam_policy_document : IpamPolicyDocument | Nil

    def initialize(
      @ipam_policy_document : IpamPolicyDocument | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @ipam_policy_document
        params.concat(value.to_query_params("#{prefix}IpamPolicyDocument."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipam_policy_document: node.xpath_node("*[local-name()='ipamPolicyDocument']").try { |n| IpamPolicyDocument.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @ipam_policy_document
        value.validate!
      end
    end

    def_equals_and_hash(@ipam_policy_document)
  end
end
