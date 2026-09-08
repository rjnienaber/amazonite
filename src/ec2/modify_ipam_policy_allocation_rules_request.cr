private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyIpamPolicyAllocationRulesRequest
    # A check for whether you have the required permissions for the action without actually making the
    # request and provides an error response. If you have the required permissions, the error response
    # is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the IPAM policy whose allocation rules you want to modify.
    property ipam_policy_id : String

    # The locale for which to modify the allocation rules.
    property locale : String

    # The resource type for which to modify the allocation rules.
    #
    # The Amazon Web Services service or resource type that can use IP addresses through IPAM
    # policies. Supported services and resource types include:
    #
    # - Elastic IP addresses
    property resource_type : IpamPolicyResourceType

    # The new allocation rules to apply to the IPAM policy.
    #
    # Allocation rules are optional configurations within an IPAM policy that map Amazon Web Services
    # resource types to specific IPAM pools. If no rules are defined, the resource types default to
    # using Amazon-provided IP addresses.
    property allocation_rules : Array(IpamPolicyAllocationRuleRequest) | Nil

    def initialize(
      @ipam_policy_id : String,
      @locale : String,
      @resource_type : IpamPolicyResourceType,
      @dry_run : Bool | Nil = nil,
      @allocation_rules : Array(IpamPolicyAllocationRuleRequest) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}IpamPolicyId", @ipam_policy_id}

      params << {"#{prefix}Locale", @locale}

      params << {"#{prefix}ResourceType", @resource_type.to_json_object_key}

      (@allocation_rules || [] of IpamPolicyAllocationRuleRequest).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}AllocationRule.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        ipam_policy_id: Core::XMLValue.string(node.xpath_node("*[local-name()='IpamPolicyId']")).not_nil!,
        locale: Core::XMLValue.string(node.xpath_node("*[local-name()='Locale']")).not_nil!,
        resource_type: ((n = node.xpath_node("*[local-name()='ResourceType']")) ? AEC::IpamPolicyResourceType.from_json_object_key?(n.content) : nil).not_nil!,
        allocation_rules: node.xpath_nodes("*[local-name()='AllocationRule']/*[local-name()='item']").map { |n| IpamPolicyAllocationRuleRequest.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @allocation_rules
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@dry_run, @ipam_policy_id, @locale, @resource_type, @allocation_rules)
  end
end
