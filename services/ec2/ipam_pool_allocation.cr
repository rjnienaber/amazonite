private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # In IPAM, an allocation is a CIDR assignment from an IPAM pool to another IPAM pool or to a
  # resource.
  class IpamPoolAllocation
    # The CIDR for the allocation. A CIDR is a representation of an IP address and its associated
    # network mask (or netmask) and refers to a range of IP addresses. An IPv4 CIDR example is
    # `10.24.34.0/23`. An IPv6 CIDR example is `2001:DB8::/32`.
    property cidr : String | Nil

    # The ID of an allocation.
    property ipam_pool_allocation_id : String | Nil

    # A description of the pool allocation.
    property description : String | Nil

    # The ID of the resource.
    property resource_id : String | Nil

    # The type of the resource.
    property resource_type : IpamPoolAllocationResourceType | Nil

    # The Amazon Web Services Region of the resource.
    property resource_region : String | Nil

    # The owner of the resource.
    property resource_owner : String | Nil

    # The tags for the IPAM pool allocation.
    property tags : Array(Tag) | Nil

    def initialize(
      @cidr : String | Nil = nil,
      @ipam_pool_allocation_id : String | Nil = nil,
      @description : String | Nil = nil,
      @resource_id : String | Nil = nil,
      @resource_type : IpamPoolAllocationResourceType | Nil = nil,
      @resource_region : String | Nil = nil,
      @resource_owner : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @cidr
        params << {"#{prefix}Cidr", value}
      end

      if value = @ipam_pool_allocation_id
        params << {"#{prefix}IpamPoolAllocationId", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @resource_id
        params << {"#{prefix}ResourceId", value}
      end

      if value = @resource_type
        params << {"#{prefix}ResourceType", value.to_json_object_key}
      end

      if value = @resource_region
        params << {"#{prefix}ResourceRegion", value}
      end

      if value = @resource_owner
        params << {"#{prefix}ResourceOwner", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='cidr']")),
        ipam_pool_allocation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamPoolAllocationId']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        resource_id: Core::XMLValue.string(node.xpath_node("*[local-name()='resourceId']")),
        resource_type: (n = node.xpath_node("*[local-name()='resourceType']")) ? AEC::IpamPoolAllocationResourceType.from_json_object_key?(n.content) : nil,
        resource_region: Core::XMLValue.string(node.xpath_node("*[local-name()='resourceRegion']")),
        resource_owner: Core::XMLValue.string(node.xpath_node("*[local-name()='resourceOwner']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@cidr, @ipam_pool_allocation_id, @description, @resource_id, @resource_type, @resource_region, @resource_owner, @tags)
  end
end
