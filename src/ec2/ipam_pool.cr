private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # In IPAM, a pool is a collection of contiguous IP addresses CIDRs. Pools enable you to organize
  # your IP addresses according to your routing and security needs. For example, if you have
  # separate routing and security needs for development and production applications, you can create
  # a pool for each.
  class IpamPool
    # The Amazon Web Services account ID of the owner of the IPAM pool.
    property owner_id : String | Nil

    # The ID of the IPAM pool.
    property ipam_pool_id : String | Nil

    # The ID of the source IPAM pool. You can use this option to create an IPAM pool within an
    # existing source pool.
    property source_ipam_pool_id : String | Nil

    # The Amazon Resource Name (ARN) of the IPAM pool.
    property ipam_pool_arn : String | Nil

    # The ARN of the scope of the IPAM pool.
    property ipam_scope_arn : String | Nil

    # In IPAM, a scope is the highest-level container within IPAM. An IPAM contains two default
    # scopes. Each scope represents the IP space for a single network. The private scope is intended
    # for all private IP address space. The public scope is intended for all public IP address space.
    # Scopes enable you to reuse IP addresses across multiple unconnected networks without causing IP
    # address overlap or conflict.
    property ipam_scope_type : IpamScopeType | Nil

    # The ARN of the IPAM.
    property ipam_arn : String | Nil

    # The Amazon Web Services Region of the IPAM pool.
    property ipam_region : String | Nil

    # The locale of the IPAM pool.
    #
    # The locale for the pool should be one of the following:
    #
    # - An Amazon Web Services Region where you want this IPAM pool to be available for allocations.
    #
    # - The network border group for an Amazon Web Services Local Zone where you want this IPAM pool
    # to be available for allocations ([supported Local
    # Zones](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-byoip.html#byoip-zone-avail)).
    # This option is only available for IPAM IPv4 pools in the public scope.
    #
    # If you choose an Amazon Web Services Region for locale that has not been configured as an
    # operating Region for the IPAM, you'll get an error.
    property locale : String | Nil

    # The depth of pools in your IPAM pool. The pool depth quota is 10. For more information, see
    # [Quotas in IPAM](https://docs.aws.amazon.com/vpc/latest/ipam/quotas-ipam.html) in the *Amazon
    # VPC IPAM User Guide*.
    property pool_depth : Int32 | Nil

    # The state of the IPAM pool.
    property state : IpamPoolState | Nil

    # The state message.
    property state_message : String | Nil

    # The description of the IPAM pool.
    property description : String | Nil

    # If selected, IPAM will continuously look for resources within the CIDR range of this pool and
    # automatically import them as allocations into your IPAM. The CIDRs that will be allocated for
    # these resources must not already be allocated to other resources in order for the import to
    # succeed. IPAM will import a CIDR regardless of its compliance with the pool's allocation rules,
    # so a resource might be imported and subsequently marked as noncompliant. If IPAM discovers
    # multiple CIDRs that overlap, IPAM will import the largest CIDR only. If IPAM discovers multiple
    # CIDRs with matching CIDRs, IPAM will randomly import one of them only.
    #
    # A locale must be set on the pool for this feature to work.
    property auto_import : Bool | Nil

    # Determines if a pool is publicly advertisable. This option is not available for pools with
    # AddressFamily set to `ipv4`.
    property publicly_advertisable : Bool | Nil

    # The address family of the pool.
    property address_family : AddressFamily | Nil

    # The minimum netmask length required for CIDR allocations in this IPAM pool to be compliant. The
    # minimum netmask length must be less than the maximum netmask length. Possible netmask lengths
    # for IPv4 addresses are 0 - 32. Possible netmask lengths for IPv6 addresses are 0 - 128.
    property allocation_min_netmask_length : Int32 | Nil

    # The maximum netmask length possible for CIDR allocations in this IPAM pool to be compliant. The
    # maximum netmask length must be greater than the minimum netmask length. Possible netmask lengths
    # for IPv4 addresses are 0 - 32. Possible netmask lengths for IPv6 addresses are 0 - 128.
    property allocation_max_netmask_length : Int32 | Nil

    # The default netmask length for allocations added to this pool. If, for example, the CIDR
    # assigned to this pool is 10.0.0.0/8 and you enter 16 here, new allocations will default to
    # 10.0.0.0/16.
    property allocation_default_netmask_length : Int32 | Nil

    # Tags that are required for resources that use CIDRs from this IPAM pool. Resources that do not
    # have these tags will not be allowed to allocate space from the pool. If the resources have their
    # tags changed after they have allocated space or if the allocation tagging requirements are
    # changed on the pool, the resource may be marked as noncompliant.
    property allocation_resource_tags : Array(IpamResourceTag) | Nil

    # The key/value combination of a tag assigned to the resource. Use the tag key in the filter name
    # and the tag value as the filter value. For example, to find all resources that have a tag with
    # the key `Owner` and the value `TeamA`, specify `tag:Owner` for the filter name and `TeamA` for
    # the filter value.
    property tags : Array(Tag) | Nil

    # Limits which service in Amazon Web Services that the pool can be used in. "ec2", for example,
    # allows users to use space for Elastic IP addresses and VPCs.
    property aws_service : IpamPoolAwsService | Nil

    # The IP address source for pools in the public scope. Only used for provisioning IP address CIDRs
    # to pools in the public scope. Default is `BYOIP`. For more information, see [Create IPv6
    # pools](https://docs.aws.amazon.com/vpc/latest/ipam/intro-create-ipv6-pools.html) in the *Amazon
    # VPC IPAM User Guide*. By default, you can add only one Amazon-provided IPv6 CIDR block to a
    # top-level IPv6 pool. For information on increasing the default limit, see [Quotas for your
    # IPAM](https://docs.aws.amazon.com/vpc/latest/ipam/quotas-ipam.html) in the *Amazon VPC IPAM User
    # Guide*.
    property public_ip_source : IpamPoolPublicIpSource | Nil

    # The resource used to provision CIDRs to a resource planning pool.
    property source_resource : IpamPoolSourceResource | Nil

    def initialize(
      @owner_id : String | Nil = nil,
      @ipam_pool_id : String | Nil = nil,
      @source_ipam_pool_id : String | Nil = nil,
      @ipam_pool_arn : String | Nil = nil,
      @ipam_scope_arn : String | Nil = nil,
      @ipam_scope_type : IpamScopeType | Nil = nil,
      @ipam_arn : String | Nil = nil,
      @ipam_region : String | Nil = nil,
      @locale : String | Nil = nil,
      @pool_depth : Int32 | Nil = nil,
      @state : IpamPoolState | Nil = nil,
      @state_message : String | Nil = nil,
      @description : String | Nil = nil,
      @auto_import : Bool | Nil = nil,
      @publicly_advertisable : Bool | Nil = nil,
      @address_family : AddressFamily | Nil = nil,
      @allocation_min_netmask_length : Int32 | Nil = nil,
      @allocation_max_netmask_length : Int32 | Nil = nil,
      @allocation_default_netmask_length : Int32 | Nil = nil,
      @allocation_resource_tags : Array(IpamResourceTag) | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @aws_service : IpamPoolAwsService | Nil = nil,
      @public_ip_source : IpamPoolPublicIpSource | Nil = nil,
      @source_resource : IpamPoolSourceResource | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end

      if value = @ipam_pool_id
        params << {"#{prefix}IpamPoolId", value}
      end

      if value = @source_ipam_pool_id
        params << {"#{prefix}SourceIpamPoolId", value}
      end

      if value = @ipam_pool_arn
        params << {"#{prefix}IpamPoolArn", value}
      end

      if value = @ipam_scope_arn
        params << {"#{prefix}IpamScopeArn", value}
      end

      if value = @ipam_scope_type
        params << {"#{prefix}IpamScopeType", value.to_json_object_key}
      end

      if value = @ipam_arn
        params << {"#{prefix}IpamArn", value}
      end

      if value = @ipam_region
        params << {"#{prefix}IpamRegion", value}
      end

      if value = @locale
        params << {"#{prefix}Locale", value}
      end

      if value = @pool_depth
        params << {"#{prefix}PoolDepth", value.to_s}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @state_message
        params << {"#{prefix}StateMessage", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @auto_import
        params << {"#{prefix}AutoImport", Core::QueryValue.bool(value)}
      end

      if value = @publicly_advertisable
        params << {"#{prefix}PubliclyAdvertisable", Core::QueryValue.bool(value)}
      end

      if value = @address_family
        params << {"#{prefix}AddressFamily", value.to_json_object_key}
      end

      if value = @allocation_min_netmask_length
        params << {"#{prefix}AllocationMinNetmaskLength", value.to_s}
      end

      if value = @allocation_max_netmask_length
        params << {"#{prefix}AllocationMaxNetmaskLength", value.to_s}
      end

      if value = @allocation_default_netmask_length
        params << {"#{prefix}AllocationDefaultNetmaskLength", value.to_s}
      end

      (@allocation_resource_tags || [] of IpamResourceTag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}AllocationResourceTagSet.#{i}."))
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @aws_service
        params << {"#{prefix}AwsService", value.to_json_object_key}
      end

      if value = @public_ip_source
        params << {"#{prefix}PublicIpSource", value.to_json_object_key}
      end

      if value = @source_resource
        params.concat(value.to_query_params("#{prefix}SourceResource."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        ipam_pool_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamPoolId']")),
        source_ipam_pool_id: Core::XMLValue.string(node.xpath_node("*[local-name()='sourceIpamPoolId']")),
        ipam_pool_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamPoolArn']")),
        ipam_scope_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamScopeArn']")),
        ipam_scope_type: (n = node.xpath_node("*[local-name()='ipamScopeType']")) ? AEC::IpamScopeType.from_json_object_key?(n.content) : nil,
        ipam_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamArn']")),
        ipam_region: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamRegion']")),
        locale: Core::XMLValue.string(node.xpath_node("*[local-name()='locale']")),
        pool_depth: Core::XMLValue.i32(node.xpath_node("*[local-name()='poolDepth']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::IpamPoolState.from_json_object_key?(n.content) : nil,
        state_message: Core::XMLValue.string(node.xpath_node("*[local-name()='stateMessage']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        auto_import: Core::XMLValue.bool(node.xpath_node("*[local-name()='autoImport']")),
        publicly_advertisable: Core::XMLValue.bool(node.xpath_node("*[local-name()='publiclyAdvertisable']")),
        address_family: (n = node.xpath_node("*[local-name()='addressFamily']")) ? AEC::AddressFamily.from_json_object_key?(n.content) : nil,
        allocation_min_netmask_length: Core::XMLValue.i32(node.xpath_node("*[local-name()='allocationMinNetmaskLength']")),
        allocation_max_netmask_length: Core::XMLValue.i32(node.xpath_node("*[local-name()='allocationMaxNetmaskLength']")),
        allocation_default_netmask_length: Core::XMLValue.i32(node.xpath_node("*[local-name()='allocationDefaultNetmaskLength']")),
        allocation_resource_tags: node.xpath_nodes("*[local-name()='allocationResourceTagSet']/*[local-name()='item']").map { |n| IpamResourceTag.from_xml(n) },
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        aws_service: (n = node.xpath_node("*[local-name()='awsService']")) ? AEC::IpamPoolAwsService.from_json_object_key?(n.content) : nil,
        public_ip_source: (n = node.xpath_node("*[local-name()='publicIpSource']")) ? AEC::IpamPoolPublicIpSource.from_json_object_key?(n.content) : nil,
        source_resource: node.xpath_node("*[local-name()='sourceResource']").try { |n| IpamPoolSourceResource.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @ipam_pool_arn
        raise Core::ValidationError.new("IpamPoolArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("IpamPoolArn length must be <= 1283") if value.size > 1283
      end

      if value = @ipam_scope_arn
        raise Core::ValidationError.new("IpamScopeArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("IpamScopeArn length must be <= 1283") if value.size > 1283
      end

      if value = @ipam_arn
        raise Core::ValidationError.new("IpamArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("IpamArn length must be <= 1283") if value.size > 1283
      end

      if value = @allocation_min_netmask_length
        raise Core::ValidationError.new("AllocationMinNetmaskLength value must be >= 0") if value < 0
        raise Core::ValidationError.new("AllocationMinNetmaskLength value must be <= 128") if value > 128
      end

      if value = @allocation_max_netmask_length
        raise Core::ValidationError.new("AllocationMaxNetmaskLength value must be >= 0") if value < 0
        raise Core::ValidationError.new("AllocationMaxNetmaskLength value must be <= 128") if value > 128
      end

      if value = @allocation_default_netmask_length
        raise Core::ValidationError.new("AllocationDefaultNetmaskLength value must be >= 0") if value < 0
        raise Core::ValidationError.new("AllocationDefaultNetmaskLength value must be <= 128") if value > 128
      end

      if value = @allocation_resource_tags
        value.each(&.validate!)
      end

      if value = @tags
        value.each(&.validate!)
      end

      if value = @source_resource
        value.validate!
      end
    end

    def_equals_and_hash(@owner_id, @ipam_pool_id, @source_ipam_pool_id, @ipam_pool_arn, @ipam_scope_arn, @ipam_scope_type, @ipam_arn, @ipam_region, @locale, @pool_depth, @state, @state_message, @description, @auto_import, @publicly_advertisable, @address_family, @allocation_min_netmask_length, @allocation_max_netmask_length, @allocation_default_netmask_length, @allocation_resource_tags, @tags, @aws_service, @public_ip_source, @source_resource)
  end
end
