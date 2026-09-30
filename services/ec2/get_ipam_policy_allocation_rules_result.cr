private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetIpamPolicyAllocationRulesResult
    # The IPAM policy documents containing the allocation rules.
    #
    # Allocation rules are optional configurations within an IPAM policy that map Amazon Web Services
    # resource types to specific IPAM pools. If no rules are defined, the resource types default to
    # using Amazon-provided IP addresses.
    property ipam_policy_documents : Array(IpamPolicyDocument) | Nil

    # The token to use to retrieve the next page of results.
    property next_token : String | Nil

    def initialize(
      @ipam_policy_documents : Array(IpamPolicyDocument) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@ipam_policy_documents || [] of IpamPolicyDocument).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}IpamPolicyDocumentSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipam_policy_documents: node.xpath_nodes("*[local-name()='ipamPolicyDocumentSet']/*[local-name()='item']").map { |n| IpamPolicyDocument.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @ipam_policy_documents
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@ipam_policy_documents, @next_token)
  end
end
