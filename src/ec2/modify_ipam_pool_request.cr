private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyIpamPoolRequest
    # A check for whether you have the required permissions for the action without actually making the
    # request and provides an error response. If you have the required permissions, the error response
    # is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the IPAM pool you want to modify.
    property ipam_pool_id : String

    # The description of the IPAM pool you want to modify.
    property description : String | Nil

    # If true, IPAM will continuously look for resources within the CIDR range of this pool and
    # automatically import them as allocations into your IPAM. The CIDRs that will be allocated for
    # these resources must not already be allocated to other resources in order for the import to
    # succeed. IPAM will import a CIDR regardless of its compliance with the pool's allocation rules,
    # so a resource might be imported and subsequently marked as noncompliant. If IPAM discovers
    # multiple CIDRs that overlap, IPAM will import the largest CIDR only. If IPAM discovers multiple
    # CIDRs with matching CIDRs, IPAM will randomly import one of them only.
    #
    # A locale must be set on the pool for this feature to work.
    property auto_import : Bool | Nil

    # The minimum netmask length required for CIDR allocations in this IPAM pool to be compliant.
    # Possible netmask lengths for IPv4 addresses are 0 - 32. Possible netmask lengths for IPv6
    # addresses are 0 - 128. The minimum netmask length must be less than the maximum netmask length.
    property allocation_min_netmask_length : Int32 | Nil

    # The maximum netmask length possible for CIDR allocations in this IPAM pool to be compliant.
    # Possible netmask lengths for IPv4 addresses are 0 - 32. Possible netmask lengths for IPv6
    # addresses are 0 - 128.The maximum netmask length must be greater than the minimum netmask
    # length.
    property allocation_max_netmask_length : Int32 | Nil

    # The default netmask length for allocations added to this pool. If, for example, the CIDR
    # assigned to this pool is 10.0.0.0/8 and you enter 16 here, new allocations will default to
    # 10.0.0.0/16.
    property allocation_default_netmask_length : Int32 | Nil

    # Clear the default netmask length allocation rule for this pool.
    property clear_allocation_default_netmask_length : Bool | Nil

    # Add tag allocation rules to a pool. For more information about allocation rules, see [Create a
    # top-level pool](https://docs.aws.amazon.com/vpc/latest/ipam/create-top-ipam.html) in the *Amazon
    # VPC IPAM User Guide*.
    property add_allocation_resource_tags : Array(RequestIpamResourceTag) | Nil

    # Remove tag allocation rules from a pool.
    property remove_allocation_resource_tags : Array(RequestIpamResourceTag) | Nil

    def initialize(
      @ipam_pool_id : String,
      @dry_run : Bool | Nil = nil,
      @description : String | Nil = nil,
      @auto_import : Bool | Nil = nil,
      @allocation_min_netmask_length : Int32 | Nil = nil,
      @allocation_max_netmask_length : Int32 | Nil = nil,
      @allocation_default_netmask_length : Int32 | Nil = nil,
      @clear_allocation_default_netmask_length : Bool | Nil = nil,
      @add_allocation_resource_tags : Array(RequestIpamResourceTag) | Nil = nil,
      @remove_allocation_resource_tags : Array(RequestIpamResourceTag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}IpamPoolId", @ipam_pool_id}

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @auto_import
        params << {"#{prefix}AutoImport", Core::QueryValue.bool(value)}
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

      if value = @clear_allocation_default_netmask_length
        params << {"#{prefix}ClearAllocationDefaultNetmaskLength", Core::QueryValue.bool(value)}
      end

      (@add_allocation_resource_tags || [] of RequestIpamResourceTag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}AddAllocationResourceTag.#{i}."))
      end

      (@remove_allocation_resource_tags || [] of RequestIpamResourceTag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}RemoveAllocationResourceTag.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        ipam_pool_id: Core::XMLValue.string(node.xpath_node("*[local-name()='IpamPoolId']")).not_nil!,
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        auto_import: Core::XMLValue.bool(node.xpath_node("*[local-name()='AutoImport']")),
        allocation_min_netmask_length: Core::XMLValue.i32(node.xpath_node("*[local-name()='AllocationMinNetmaskLength']")),
        allocation_max_netmask_length: Core::XMLValue.i32(node.xpath_node("*[local-name()='AllocationMaxNetmaskLength']")),
        allocation_default_netmask_length: Core::XMLValue.i32(node.xpath_node("*[local-name()='AllocationDefaultNetmaskLength']")),
        clear_allocation_default_netmask_length: Core::XMLValue.bool(node.xpath_node("*[local-name()='ClearAllocationDefaultNetmaskLength']")),
        add_allocation_resource_tags: node.xpath_nodes("*[local-name()='AddAllocationResourceTag']/*[local-name()='item']").map { |n| RequestIpamResourceTag.from_xml(n) },
        remove_allocation_resource_tags: node.xpath_nodes("*[local-name()='RemoveAllocationResourceTag']/*[local-name()='item']").map { |n| RequestIpamResourceTag.from_xml(n) },
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

      if value = @add_allocation_resource_tags
        value.each(&.validate!)
      end

      if value = @remove_allocation_resource_tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@dry_run, @ipam_pool_id, @description, @auto_import, @allocation_min_netmask_length, @allocation_max_netmask_length, @allocation_default_netmask_length, @clear_allocation_default_netmask_length, @add_allocation_resource_tags, @remove_allocation_resource_tags)
  end
end
