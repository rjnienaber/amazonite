private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # IPAM is a VPC feature that you can use to automate your IP address management workflows
  # including assigning, tracking, troubleshooting, and auditing IP addresses across Amazon Web
  # Services Regions and accounts throughout your Amazon Web Services Organization. For more
  # information, see [What is
  # IPAM?](https://docs.aws.amazon.com/vpc/latest/ipam/what-is-it-ipam.html) in the *Amazon VPC IPAM
  # User Guide*.
  class Ipam
    # The Amazon Web Services account ID of the owner of the IPAM.
    property owner_id : String | Nil

    # The ID of the IPAM.
    property ipam_id : String | Nil

    # The Amazon Resource Name (ARN) of the IPAM.
    property ipam_arn : String | Nil

    # The Amazon Web Services Region of the IPAM.
    property ipam_region : String | Nil

    # The ID of the IPAM's default public scope.
    property public_default_scope_id : String | Nil

    # The ID of the IPAM's default private scope.
    property private_default_scope_id : String | Nil

    # The number of scopes in the IPAM. The scope quota is 5. For more information on quotas, see
    # [Quotas in IPAM](https://docs.aws.amazon.com/vpc/latest/ipam/quotas-ipam.html) in the *Amazon
    # VPC IPAM User Guide*.
    property scope_count : Int32 | Nil

    # The description for the IPAM.
    property description : String | Nil

    # The operating Regions for an IPAM. Operating Regions are Amazon Web Services Regions where the
    # IPAM is allowed to manage IP address CIDRs. IPAM only discovers and monitors resources in the
    # Amazon Web Services Regions you select as operating Regions.
    #
    # For more information about operating Regions, see [Create an
    # IPAM](https://docs.aws.amazon.com/vpc/latest/ipam/create-ipam.html) in the *Amazon VPC IPAM User
    # Guide*.
    property operating_regions : Array(IpamOperatingRegion) | Nil

    # The state of the IPAM.
    property state : IpamState | Nil

    # The key/value combination of a tag assigned to the resource. Use the tag key in the filter name
    # and the tag value as the filter value. For example, to find all resources that have a tag with
    # the key `Owner` and the value `TeamA`, specify `tag:Owner` for the filter name and `TeamA` for
    # the filter value.
    property tags : Array(Tag) | Nil

    # The IPAM's default resource discovery ID.
    property default_resource_discovery_id : String | Nil

    # The IPAM's default resource discovery association ID.
    property default_resource_discovery_association_id : String | Nil

    # The IPAM's resource discovery association count.
    property resource_discovery_association_count : Int32 | Nil

    # The state message.
    property state_message : String | Nil

    # IPAM is offered in a Free Tier and an Advanced Tier. For more information about the features
    # available in each tier and the costs associated with the tiers, see [Amazon VPC pricing > IPAM
    # tab](http://aws.amazon.com/vpc/pricing/).
    property tier : IpamTier | Nil

    # Enable this option to use your own GUA ranges as private IPv6 addresses. This option is disabled
    # by default.
    property enable_private_gua : Bool | Nil

    # A metered account is an Amazon Web Services account that is charged for active IP addresses
    # managed in IPAM. For more information, see [Enable cost
    # distribution](https://docs.aws.amazon.com/vpc/latest/ipam/ipam-enable-cost-distro.html) in the
    # *Amazon VPC IPAM User Guide*.
    #
    # Possible values:
    #
    # - `ipam-owner` (default): The Amazon Web Services account which owns the IPAM is charged for all
    # active IP addresses managed in IPAM.
    #
    # - `resource-owner`: The Amazon Web Services account that owns the IP address is charged for the
    # active IP address.
    property metered_account : IpamMeteredAccount | Nil

    def initialize(
      @owner_id : String | Nil = nil,
      @ipam_id : String | Nil = nil,
      @ipam_arn : String | Nil = nil,
      @ipam_region : String | Nil = nil,
      @public_default_scope_id : String | Nil = nil,
      @private_default_scope_id : String | Nil = nil,
      @scope_count : Int32 | Nil = nil,
      @description : String | Nil = nil,
      @operating_regions : Array(IpamOperatingRegion) | Nil = nil,
      @state : IpamState | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @default_resource_discovery_id : String | Nil = nil,
      @default_resource_discovery_association_id : String | Nil = nil,
      @resource_discovery_association_count : Int32 | Nil = nil,
      @state_message : String | Nil = nil,
      @tier : IpamTier | Nil = nil,
      @enable_private_gua : Bool | Nil = nil,
      @metered_account : IpamMeteredAccount | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end

      if value = @ipam_id
        params << {"#{prefix}IpamId", value}
      end

      if value = @ipam_arn
        params << {"#{prefix}IpamArn", value}
      end

      if value = @ipam_region
        params << {"#{prefix}IpamRegion", value}
      end

      if value = @public_default_scope_id
        params << {"#{prefix}PublicDefaultScopeId", value}
      end

      if value = @private_default_scope_id
        params << {"#{prefix}PrivateDefaultScopeId", value}
      end

      if value = @scope_count
        params << {"#{prefix}ScopeCount", value.to_s}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      (@operating_regions || [] of IpamOperatingRegion).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}OperatingRegionSet.#{i}."))
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @default_resource_discovery_id
        params << {"#{prefix}DefaultResourceDiscoveryId", value}
      end

      if value = @default_resource_discovery_association_id
        params << {"#{prefix}DefaultResourceDiscoveryAssociationId", value}
      end

      if value = @resource_discovery_association_count
        params << {"#{prefix}ResourceDiscoveryAssociationCount", value.to_s}
      end

      if value = @state_message
        params << {"#{prefix}StateMessage", value}
      end

      if value = @tier
        params << {"#{prefix}Tier", value.to_json_object_key}
      end

      if value = @enable_private_gua
        params << {"#{prefix}EnablePrivateGua", Core::QueryValue.bool(value)}
      end

      if value = @metered_account
        params << {"#{prefix}MeteredAccount", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        ipam_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamId']")),
        ipam_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamArn']")),
        ipam_region: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamRegion']")),
        public_default_scope_id: Core::XMLValue.string(node.xpath_node("*[local-name()='publicDefaultScopeId']")),
        private_default_scope_id: Core::XMLValue.string(node.xpath_node("*[local-name()='privateDefaultScopeId']")),
        scope_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='scopeCount']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        operating_regions: node.xpath_nodes("*[local-name()='operatingRegionSet']/*[local-name()='item']").map { |n| IpamOperatingRegion.from_xml(n) },
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::IpamState.from_json_object_key?(n.content) : nil,
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        default_resource_discovery_id: Core::XMLValue.string(node.xpath_node("*[local-name()='defaultResourceDiscoveryId']")),
        default_resource_discovery_association_id: Core::XMLValue.string(node.xpath_node("*[local-name()='defaultResourceDiscoveryAssociationId']")),
        resource_discovery_association_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='resourceDiscoveryAssociationCount']")),
        state_message: Core::XMLValue.string(node.xpath_node("*[local-name()='stateMessage']")),
        tier: (n = node.xpath_node("*[local-name()='tier']")) ? AEC::IpamTier.from_json_object_key?(n.content) : nil,
        enable_private_gua: Core::XMLValue.bool(node.xpath_node("*[local-name()='enablePrivateGua']")),
        metered_account: (n = node.xpath_node("*[local-name()='meteredAccount']")) ? AEC::IpamMeteredAccount.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
      if value = @ipam_arn
        raise Core::ValidationError.new("IpamArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("IpamArn length must be <= 1283") if value.size > 1283
      end

      if value = @operating_regions
        value.each(&.validate!)
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@owner_id, @ipam_id, @ipam_arn, @ipam_region, @public_default_scope_id, @private_default_scope_id, @scope_count, @description, @operating_regions, @state, @tags, @default_resource_discovery_id, @default_resource_discovery_association_id, @resource_discovery_association_count, @state_message, @tier, @enable_private_gua, @metered_account)
  end
end
