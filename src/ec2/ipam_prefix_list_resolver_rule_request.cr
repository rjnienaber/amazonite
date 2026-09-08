private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a CIDR selection rule to include in a request. This is used when creating or modifying
  # resolver rules.
  #
  # CIDR selection rules define the business logic for selecting CIDRs from IPAM. If a CIDR matches
  # any of the rules, it will be included. If a rule has multiple conditions, the CIDR has to match
  # every condition of that rule. You can create a prefix list resolver without any CIDR selection
  # rules, but it will generate empty versions (containing no CIDRs) until you add rules.
  #
  # There are three rule types. Only 2 of the 3 rule types support conditions - **IPAM pool CIDR**
  # and **Scope resource CIDR**. **Static CIDR** rules cannot have conditions.
  #
  # - **Static CIDR**: A fixed list of CIDRs that do not change (like a manual list replicated
  # across Regions)
  #
  # - **IPAM pool CIDR**: CIDRs from specific IPAM pools (like all CIDRs from your IPAM production
  # pool)
  #
  # If you choose this option, choose the following:
  #
  # - **IPAM scope**: Select the IPAM scope to search for resources
  #
  # - **Conditions:**
  #
  # - **Property**
  #
  # - **IPAM pool ID**: Select an IPAM pool that contains the resources
  #
  # - **CIDR** (like 10.24.34.0/23)
  #
  # - **Operation**: Equals/Not equals
  #
  # - **Value**: The value on which to match the condition
  #
  # - **Scope resource CIDR**: CIDRs from Amazon Web Services resources like VPCs, subnets, EIPs
  # within an IPAM scope
  #
  # If you choose this option, choose the following:
  #
  # - **IPAM scope**: Select the IPAM scope to search for resources
  #
  # - **Resource type**: Select a resource, like a VPC or subnet.
  #
  # - **Conditions**:
  #
  # - **Property**:
  #
  # - Resource ID: The unique ID of a resource (like vpc-1234567890abcdef0)
  #
  # - Resource owner (like 111122223333)
  #
  # - Resource region (like us-east-1)
  #
  # - Resource tag (like key: name, value: dev-vpc-1)
  #
  # - CIDR (like 10.24.34.0/23)
  #
  # - **Operation**: Equals/Not equals
  #
  # - **Value**: The value on which to match the condition
  class IpamPrefixListResolverRuleRequest
    # The type of CIDR selection rule. Valid values include `include` for selecting CIDRs that match
    # the conditions, and `exclude` for excluding CIDRs that match the conditions.
    property rule_type : IpamPrefixListResolverRuleType

    # A fixed list of CIDRs that do not change (like a manual list replicated across Regions).
    property static_cidr : String | Nil

    # The ID of the IPAM scope from which to select CIDRs. This determines whether to select from
    # public or private IP address space.
    property ipam_scope_id : String | Nil

    # For rules of type `ipam-resource-cidr`, this is the resource type.
    property resource_type : IpamResourceType | Nil

    # The conditions that determine which CIDRs are selected by this rule. Conditions specify criteria
    # such as resource type, tags, account IDs, and Regions.
    property conditions : Array(IpamPrefixListResolverRuleConditionRequest) | Nil

    def initialize(
      @rule_type : IpamPrefixListResolverRuleType,
      @static_cidr : String | Nil = nil,
      @ipam_scope_id : String | Nil = nil,
      @resource_type : IpamResourceType | Nil = nil,
      @conditions : Array(IpamPrefixListResolverRuleConditionRequest) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}RuleType", @rule_type.to_json_object_key}

      if value = @static_cidr
        params << {"#{prefix}StaticCidr", value}
      end

      if value = @ipam_scope_id
        params << {"#{prefix}IpamScopeId", value}
      end

      if value = @resource_type
        params << {"#{prefix}ResourceType", value.to_json_object_key}
      end

      (@conditions || [] of IpamPrefixListResolverRuleConditionRequest).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Condition.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        rule_type: ((n = node.xpath_node("*[local-name()='RuleType']")) ? AEC::IpamPrefixListResolverRuleType.from_json_object_key?(n.content) : nil).not_nil!,
        static_cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='StaticCidr']")),
        ipam_scope_id: Core::XMLValue.string(node.xpath_node("*[local-name()='IpamScopeId']")),
        resource_type: (n = node.xpath_node("*[local-name()='ResourceType']")) ? AEC::IpamResourceType.from_json_object_key?(n.content) : nil,
        conditions: node.xpath_nodes("*[local-name()='Condition']/*[local-name()='Condition']").map { |n| IpamPrefixListResolverRuleConditionRequest.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @conditions
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@rule_type, @static_cidr, @ipam_scope_id, @resource_type, @conditions)
  end
end
