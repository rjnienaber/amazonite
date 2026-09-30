private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a CIDR selection rule.
  #
  # CIDR selection rules define the business logic for selecting CIDRs from IPAM. If a CIDR matches
  # any of the rules, it will be included. If a rule has multiple conditions, the CIDR has to match
  # every condition of that rule. You can create a prefix list resolver without any CIDR selection
  # rules, but it will generate empty versions (containing no CIDRs) until you add rules.
  class IpamPrefixListResolverRule
    # The type of CIDR selection rule. Valid values include `include` for selecting CIDRs that match
    # the conditions, and `exclude` for excluding CIDRs that match the conditions.
    property rule_type : IpamPrefixListResolverRuleType | Nil

    # A fixed list of CIDRs that do not change (like a manual list replicated across Regions).
    property static_cidr : String | Nil

    # The ID of the IPAM scope from which to select CIDRs. This determines whether to select from
    # public or private IP address space.
    property ipam_scope_id : String | Nil

    # For rules of type `ipam-resource-cidr`, this is the resource type.
    property resource_type : IpamResourceType | Nil

    # The conditions that determine which CIDRs are selected by this rule. Conditions specify criteria
    # such as resource type, tags, account IDs, and Regions.
    property conditions : Array(IpamPrefixListResolverRuleCondition) | Nil

    def initialize(
      @rule_type : IpamPrefixListResolverRuleType | Nil = nil,
      @static_cidr : String | Nil = nil,
      @ipam_scope_id : String | Nil = nil,
      @resource_type : IpamResourceType | Nil = nil,
      @conditions : Array(IpamPrefixListResolverRuleCondition) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @rule_type
        params << {"#{prefix}RuleType", value.to_json_object_key}
      end

      if value = @static_cidr
        params << {"#{prefix}StaticCidr", value}
      end

      if value = @ipam_scope_id
        params << {"#{prefix}IpamScopeId", value}
      end

      if value = @resource_type
        params << {"#{prefix}ResourceType", value.to_json_object_key}
      end

      (@conditions || [] of IpamPrefixListResolverRuleCondition).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ConditionSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        rule_type: (n = node.xpath_node("*[local-name()='ruleType']")) ? AEC::IpamPrefixListResolverRuleType.from_json_object_key?(n.content) : nil,
        static_cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='staticCidr']")),
        ipam_scope_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamScopeId']")),
        resource_type: (n = node.xpath_node("*[local-name()='resourceType']")) ? AEC::IpamResourceType.from_json_object_key?(n.content) : nil,
        conditions: node.xpath_nodes("*[local-name()='conditionSet']/*[local-name()='item']").map { |n| IpamPrefixListResolverRuleCondition.from_xml(n) },
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
