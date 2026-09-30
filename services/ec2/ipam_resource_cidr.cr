private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # The CIDR for an IPAM resource.
  class IpamResourceCidr
    # The IPAM ID for an IPAM resource.
    property ipam_id : String | Nil

    # The scope ID for an IPAM resource.
    property ipam_scope_id : String | Nil

    # The pool ID for an IPAM resource.
    property ipam_pool_id : String | Nil

    # The Amazon Web Services Region for an IPAM resource.
    property resource_region : String | Nil

    # The Amazon Web Services account number of the owner of an IPAM resource.
    property resource_owner_id : String | Nil

    # The ID of an IPAM resource.
    property resource_id : String | Nil

    # The name of an IPAM resource.
    property resource_name : String | Nil

    # The CIDR for an IPAM resource.
    property resource_cidr : String | Nil

    # The type of IPAM resource.
    property resource_type : IpamResourceType | Nil

    # The tags for an IPAM resource.
    property resource_tags : Array(IpamResourceTag) | Nil

    # The percentage of IP address space in use. To convert the decimal to a percentage, multiply the
    # decimal by 100. Note the following:
    #
    # - For resources that are VPCs, this is the percentage of IP address space in the VPC that's
    # taken up by subnet CIDRs.
    #
    # - For resources that are subnets, if the subnet has an IPv4 CIDR provisioned to it, this is the
    # percentage of IPv4 address space in the subnet that's in use. If the subnet has an IPv6 CIDR
    # provisioned to it, the percentage of IPv6 address space in use is not represented. The
    # percentage of IPv6 address space in use cannot currently be calculated.
    #
    # - For resources that are public IPv4 pools, this is the percentage of IP address space in the
    # pool that's been allocated to Elastic IP addresses (EIPs).
    property ip_usage : Float64 | Nil

    # The compliance status of the IPAM resource. For more information on compliance statuses, see
    # [Monitor CIDR usage by
    # resource](https://docs.aws.amazon.com/vpc/latest/ipam/monitor-cidr-compliance-ipam.html) in the
    # *Amazon VPC IPAM User Guide*.
    property compliance_status : IpamComplianceStatus | Nil

    # The management state of the resource. For more information about management states, see [Monitor
    # CIDR usage by
    # resource](https://docs.aws.amazon.com/vpc/latest/ipam/monitor-cidr-compliance-ipam.html) in the
    # *Amazon VPC IPAM User Guide*.
    property management_state : IpamManagementState | Nil

    # The overlap status of an IPAM resource. The overlap status tells you if the CIDR for a resource
    # overlaps with another CIDR in the scope. For more information on overlap statuses, see [Monitor
    # CIDR usage by
    # resource](https://docs.aws.amazon.com/vpc/latest/ipam/monitor-cidr-compliance-ipam.html) in the
    # *Amazon VPC IPAM User Guide*.
    property overlap_status : IpamOverlapStatus | Nil

    # The ID of a VPC.
    property vpc_id : String | Nil

    # The Availability Zone ID.
    property availability_zone_id : String | Nil

    def initialize(
      @ipam_id : String | Nil = nil,
      @ipam_scope_id : String | Nil = nil,
      @ipam_pool_id : String | Nil = nil,
      @resource_region : String | Nil = nil,
      @resource_owner_id : String | Nil = nil,
      @resource_id : String | Nil = nil,
      @resource_name : String | Nil = nil,
      @resource_cidr : String | Nil = nil,
      @resource_type : IpamResourceType | Nil = nil,
      @resource_tags : Array(IpamResourceTag) | Nil = nil,
      @ip_usage : Float64 | Nil = nil,
      @compliance_status : IpamComplianceStatus | Nil = nil,
      @management_state : IpamManagementState | Nil = nil,
      @overlap_status : IpamOverlapStatus | Nil = nil,
      @vpc_id : String | Nil = nil,
      @availability_zone_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @ipam_id
        params << {"#{prefix}IpamId", value}
      end

      if value = @ipam_scope_id
        params << {"#{prefix}IpamScopeId", value}
      end

      if value = @ipam_pool_id
        params << {"#{prefix}IpamPoolId", value}
      end

      if value = @resource_region
        params << {"#{prefix}ResourceRegion", value}
      end

      if value = @resource_owner_id
        params << {"#{prefix}ResourceOwnerId", value}
      end

      if value = @resource_id
        params << {"#{prefix}ResourceId", value}
      end

      if value = @resource_name
        params << {"#{prefix}ResourceName", value}
      end

      if value = @resource_cidr
        params << {"#{prefix}ResourceCidr", value}
      end

      if value = @resource_type
        params << {"#{prefix}ResourceType", value.to_json_object_key}
      end

      (@resource_tags || [] of IpamResourceTag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ResourceTagSet.#{i}."))
      end

      if value = @ip_usage
        params << {"#{prefix}IpUsage", value.to_s}
      end

      if value = @compliance_status
        params << {"#{prefix}ComplianceStatus", value.to_json_object_key}
      end

      if value = @management_state
        params << {"#{prefix}ManagementState", value.to_json_object_key}
      end

      if value = @overlap_status
        params << {"#{prefix}OverlapStatus", value.to_json_object_key}
      end

      if value = @vpc_id
        params << {"#{prefix}VpcId", value}
      end

      if value = @availability_zone_id
        params << {"#{prefix}AvailabilityZoneId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipam_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamId']")),
        ipam_scope_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamScopeId']")),
        ipam_pool_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamPoolId']")),
        resource_region: Core::XMLValue.string(node.xpath_node("*[local-name()='resourceRegion']")),
        resource_owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='resourceOwnerId']")),
        resource_id: Core::XMLValue.string(node.xpath_node("*[local-name()='resourceId']")),
        resource_name: Core::XMLValue.string(node.xpath_node("*[local-name()='resourceName']")),
        resource_cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='resourceCidr']")),
        resource_type: (n = node.xpath_node("*[local-name()='resourceType']")) ? AEC::IpamResourceType.from_json_object_key?(n.content) : nil,
        resource_tags: node.xpath_nodes("*[local-name()='resourceTagSet']/*[local-name()='item']").map { |n| IpamResourceTag.from_xml(n) },
        ip_usage: Core::XMLValue.f64(node.xpath_node("*[local-name()='ipUsage']")),
        compliance_status: (n = node.xpath_node("*[local-name()='complianceStatus']")) ? AEC::IpamComplianceStatus.from_json_object_key?(n.content) : nil,
        management_state: (n = node.xpath_node("*[local-name()='managementState']")) ? AEC::IpamManagementState.from_json_object_key?(n.content) : nil,
        overlap_status: (n = node.xpath_node("*[local-name()='overlapStatus']")) ? AEC::IpamOverlapStatus.from_json_object_key?(n.content) : nil,
        vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcId']")),
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZoneId']")),
      )
    end

    def validate! : Nil
      if value = @resource_tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@ipam_id, @ipam_scope_id, @ipam_pool_id, @resource_region, @resource_owner_id, @resource_id, @resource_name, @resource_cidr, @resource_type, @resource_tags, @ip_usage, @compliance_status, @management_state, @overlap_status, @vpc_id, @availability_zone_id)
  end
end
