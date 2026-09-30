private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateIpamPoolRequest
    # A check for whether you have the required permissions for the action without actually making the
    # request and provides an error response. If you have the required permissions, the error response
    # is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the scope in which you would like to create the IPAM pool.
    property ipam_scope_id : String

    # The locale for the pool should be one of the following:
    #
    # - An Amazon Web Services Region where you want this IPAM pool to be available for allocations.
    #
    # - The network border group for an Amazon Web Services Local Zone where you want this IPAM pool
    # to be available for allocations ([supported Local
    # Zones](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-byoip.html#byoip-zone-avail)).
    # This option is only available for IPAM IPv4 pools in the public scope.
    #
    # Possible values: Any Amazon Web Services Region or supported Amazon Web Services Local Zone.
    # Default is `none` and means any locale.
    property locale : String | Nil

    # The ID of the source IPAM pool. Use this option to create a pool within an existing pool. Note
    # that the CIDR you provision for the pool within the source pool must be available in the source
    # pool's CIDR range.
    property source_ipam_pool_id : String | Nil

    # A description for the IPAM pool.
    property description : String | Nil

    # The IP protocol assigned to this IPAM pool. You must choose either IPv4 or IPv6 protocol for a
    # pool.
    property address_family : AddressFamily

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

    # Determines if the pool is publicly advertisable. The request can only contain
    # `PubliclyAdvertisable` if `AddressFamily` is `ipv6` and `PublicIpSource` is `byoip`.
    property publicly_advertisable : Bool | Nil

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
    property allocation_resource_tags : Array(RequestIpamResourceTag) | Nil

    # The key/value combination of a tag assigned to the resource. Use the tag key in the filter name
    # and the tag value as the filter value. For example, to find all resources that have a tag with
    # the key `Owner` and the value `TeamA`, specify `tag:Owner` for the filter name and `TeamA` for
    # the filter value.
    property tag_specifications : Array(TagSpecification) | Nil

    # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
    # For more information, see [Ensuring
    # idempotency](https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html).
    property client_token : String | Nil

    # Limits which service in Amazon Web Services that the pool can be used in. "ec2", for example,
    # allows users to use space for Elastic IP addresses and VPCs.
    property aws_service : IpamPoolAwsService | Nil

    # The IP address source for pools in the public scope. Only used for provisioning IP address CIDRs
    # to pools in the public scope. Default is `byoip`. For more information, see [Create IPv6
    # pools](https://docs.aws.amazon.com/vpc/latest/ipam/intro-create-ipv6-pools.html) in the *Amazon
    # VPC IPAM User Guide*. By default, you can add only one Amazon-provided IPv6 CIDR block to a
    # top-level IPv6 pool if PublicIpSource is `amazon`. For information on increasing the default
    # limit, see [ Quotas for your IPAM](https://docs.aws.amazon.com/vpc/latest/ipam/quotas-ipam.html)
    # in the *Amazon VPC IPAM User Guide*.
    property public_ip_source : IpamPoolPublicIpSource | Nil

    # The resource used to provision CIDRs to a resource planning pool.
    property source_resource : IpamPoolSourceResourceRequest | Nil

    def initialize(
      @ipam_scope_id : String,
      @address_family : AddressFamily,
      @dry_run : Bool | Nil = nil,
      @locale : String | Nil = nil,
      @source_ipam_pool_id : String | Nil = nil,
      @description : String | Nil = nil,
      @auto_import : Bool | Nil = nil,
      @publicly_advertisable : Bool | Nil = nil,
      @allocation_min_netmask_length : Int32 | Nil = nil,
      @allocation_max_netmask_length : Int32 | Nil = nil,
      @allocation_default_netmask_length : Int32 | Nil = nil,
      @allocation_resource_tags : Array(RequestIpamResourceTag) | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @client_token : String | Nil = nil,
      @aws_service : IpamPoolAwsService | Nil = nil,
      @public_ip_source : IpamPoolPublicIpSource | Nil = nil,
      @source_resource : IpamPoolSourceResourceRequest | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}IpamScopeId", @ipam_scope_id}

      if value = @locale
        params << {"#{prefix}Locale", value}
      end

      if value = @source_ipam_pool_id
        params << {"#{prefix}SourceIpamPoolId", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      params << {"#{prefix}AddressFamily", @address_family.to_json_object_key}

      if value = @auto_import
        params << {"#{prefix}AutoImport", Core::QueryValue.bool(value)}
      end

      if value = @publicly_advertisable
        params << {"#{prefix}PubliclyAdvertisable", Core::QueryValue.bool(value)}
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

      (@allocation_resource_tags || [] of RequestIpamResourceTag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}AllocationResourceTag.#{i}."))
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
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
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        ipam_scope_id: Core::XMLValue.string(node.xpath_node("*[local-name()='IpamScopeId']")).not_nil!,
        locale: Core::XMLValue.string(node.xpath_node("*[local-name()='Locale']")),
        source_ipam_pool_id: Core::XMLValue.string(node.xpath_node("*[local-name()='SourceIpamPoolId']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        address_family: ((n = node.xpath_node("*[local-name()='AddressFamily']")) ? AEC::AddressFamily.from_json_object_key?(n.content) : nil).not_nil!,
        auto_import: Core::XMLValue.bool(node.xpath_node("*[local-name()='AutoImport']")),
        publicly_advertisable: Core::XMLValue.bool(node.xpath_node("*[local-name()='PubliclyAdvertisable']")),
        allocation_min_netmask_length: Core::XMLValue.i32(node.xpath_node("*[local-name()='AllocationMinNetmaskLength']")),
        allocation_max_netmask_length: Core::XMLValue.i32(node.xpath_node("*[local-name()='AllocationMaxNetmaskLength']")),
        allocation_default_netmask_length: Core::XMLValue.i32(node.xpath_node("*[local-name()='AllocationDefaultNetmaskLength']")),
        allocation_resource_tags: node.xpath_nodes("*[local-name()='AllocationResourceTag']/*[local-name()='item']").map { |n| RequestIpamResourceTag.from_xml(n) },
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        aws_service: (n = node.xpath_node("*[local-name()='AwsService']")) ? AEC::IpamPoolAwsService.from_json_object_key?(n.content) : nil,
        public_ip_source: (n = node.xpath_node("*[local-name()='PublicIpSource']")) ? AEC::IpamPoolPublicIpSource.from_json_object_key?(n.content) : nil,
        source_resource: node.xpath_node("*[local-name()='SourceResource']").try { |n| IpamPoolSourceResourceRequest.from_xml(n) },
      )
    end

    def validate! : Nil
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

      if value = @tag_specifications
        value.each(&.validate!)
      end

      if value = @source_resource
        value.validate!
      end
    end

    def_equals_and_hash(@dry_run, @ipam_scope_id, @locale, @source_ipam_pool_id, @description, @address_family, @auto_import, @publicly_advertisable, @allocation_min_netmask_length, @allocation_max_netmask_length, @allocation_default_netmask_length, @allocation_resource_tags, @tag_specifications, @client_token, @aws_service, @public_ip_source, @source_resource)
  end
end
