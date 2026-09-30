private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Information about an IPAM policy.
  class IpamPolicyDocument
    # The ID of the IPAM policy.
    property ipam_policy_id : String | Nil

    # The locale of the IPAM policy document.
    property locale : String | Nil

    # The resource type of the IPAM policy document.
    #
    # The Amazon Web Services service or resource type that can use IP addresses through IPAM
    # policies. Supported services and resource types include:
    #
    # - Elastic IP addresses
    property resource_type : IpamPolicyResourceType | Nil

    # The allocation rules in the IPAM policy document.
    #
    # Allocation rules are optional configurations within an IPAM policy that map Amazon Web Services
    # resource types to specific IPAM pools. If no rules are defined, the resource types default to
    # using Amazon-provided IP addresses.
    property allocation_rules : Array(IpamPolicyAllocationRule) | Nil

    def initialize(
      @ipam_policy_id : String | Nil = nil,
      @locale : String | Nil = nil,
      @resource_type : IpamPolicyResourceType | Nil = nil,
      @allocation_rules : Array(IpamPolicyAllocationRule) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @ipam_policy_id
        params << {"#{prefix}IpamPolicyId", value}
      end

      if value = @locale
        params << {"#{prefix}Locale", value}
      end

      if value = @resource_type
        params << {"#{prefix}ResourceType", value.to_json_object_key}
      end

      (@allocation_rules || [] of IpamPolicyAllocationRule).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}AllocationRuleSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipam_policy_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamPolicyId']")),
        locale: Core::XMLValue.string(node.xpath_node("*[local-name()='locale']")),
        resource_type: (n = node.xpath_node("*[local-name()='resourceType']")) ? AEC::IpamPolicyResourceType.from_json_object_key?(n.content) : nil,
        allocation_rules: node.xpath_nodes("*[local-name()='allocationRuleSet']/*[local-name()='item']").map { |n| IpamPolicyAllocationRule.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @allocation_rules
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@ipam_policy_id, @locale, @resource_type, @allocation_rules)
  end
end
