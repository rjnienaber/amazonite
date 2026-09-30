private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a condition within a CIDR selection rule. Conditions define the criteria for selecting
  # CIDRs from IPAM's database based on resource attributes.
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
  class IpamPrefixListResolverRuleCondition
    # The operation to perform when evaluating this condition. Valid values include `equals`,
    # `not-equals`, `contains`, and `not-contains`.
    property operation : IpamPrefixListResolverRuleConditionOperation | Nil

    # The ID of the IPAM pool to match against. This condition selects CIDRs that belong to the
    # specified IPAM pool.
    property ipam_pool_id : String | Nil

    # The ID of the Amazon Web Services resource to match against. This condition selects CIDRs
    # associated with the specified resource.
    property resource_id : String | Nil

    # The Amazon Web Services account ID that owns the resources to match against. This condition
    # selects CIDRs from resources owned by the specified account.
    property resource_owner : String | Nil

    # The Amazon Web Services Region where the resources are located. This condition selects CIDRs
    # from resources in the specified Region.
    property resource_region : String | Nil

    # A tag key-value pair to match against. This condition selects CIDRs from resources that have the
    # specified tag.
    property resource_tag : IpamResourceTag | Nil

    # A CIDR block to match against. This condition selects CIDRs that fall within or match the
    # specified CIDR range.
    property cidr : String | Nil

    def initialize(
      @operation : IpamPrefixListResolverRuleConditionOperation | Nil = nil,
      @ipam_pool_id : String | Nil = nil,
      @resource_id : String | Nil = nil,
      @resource_owner : String | Nil = nil,
      @resource_region : String | Nil = nil,
      @resource_tag : IpamResourceTag | Nil = nil,
      @cidr : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @operation
        params << {"#{prefix}Operation", value.to_json_object_key}
      end

      if value = @ipam_pool_id
        params << {"#{prefix}IpamPoolId", value}
      end

      if value = @resource_id
        params << {"#{prefix}ResourceId", value}
      end

      if value = @resource_owner
        params << {"#{prefix}ResourceOwner", value}
      end

      if value = @resource_region
        params << {"#{prefix}ResourceRegion", value}
      end

      if value = @resource_tag
        params.concat(value.to_query_params("#{prefix}ResourceTag."))
      end

      if value = @cidr
        params << {"#{prefix}Cidr", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        operation: (n = node.xpath_node("*[local-name()='operation']")) ? AEC::IpamPrefixListResolverRuleConditionOperation.from_json_object_key?(n.content) : nil,
        ipam_pool_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamPoolId']")),
        resource_id: Core::XMLValue.string(node.xpath_node("*[local-name()='resourceId']")),
        resource_owner: Core::XMLValue.string(node.xpath_node("*[local-name()='resourceOwner']")),
        resource_region: Core::XMLValue.string(node.xpath_node("*[local-name()='resourceRegion']")),
        resource_tag: node.xpath_node("*[local-name()='resourceTag']").try { |n| IpamResourceTag.from_xml(n) },
        cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='cidr']")),
      )
    end

    def validate! : Nil
      if value = @resource_tag
        value.validate!
      end
    end

    def_equals_and_hash(@operation, @ipam_pool_id, @resource_id, @resource_owner, @resource_region, @resource_tag, @cidr)
  end
end
