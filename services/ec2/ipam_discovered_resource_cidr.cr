private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # An IPAM discovered resource CIDR. A discovered resource is a resource CIDR monitored under a
  # resource discovery. The following resources can be discovered: VPCs, Public IPv4 pools, VPC
  # subnets, and Elastic IP addresses. The discovered resource CIDR is the IP address range in CIDR
  # notation that is associated with the resource.
  class IpamDiscoveredResourceCidr
    # The resource discovery ID.
    property ipam_resource_discovery_id : String | Nil

    # The resource Region.
    property resource_region : String | Nil

    # The resource ID.
    property resource_id : String | Nil

    # The resource owner ID.
    property resource_owner_id : String | Nil

    # The resource CIDR.
    property resource_cidr : String | Nil

    # The source that allocated the IP address space. `byoip` or `amazon` indicates public IP address
    # space allocated by Amazon or space that you have allocated with Bring your own IP (BYOIP).
    # `none` indicates private space.
    property ip_source : IpamResourceCidrIpSource | Nil

    # The resource type.
    property resource_type : IpamResourceType | Nil

    # The resource tags.
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

    # The VPC ID.
    property vpc_id : String | Nil

    # The subnet ID.
    property subnet_id : String | Nil

    # For elastic network interfaces, this is the status of whether or not the elastic network
    # interface is attached.
    property network_interface_attachment_status : IpamNetworkInterfaceAttachmentStatus | Nil

    # The last successful resource discovery time.
    property sample_time : Time | Nil

    # The Availability Zone ID.
    property availability_zone_id : String | Nil

    def initialize(
      @ipam_resource_discovery_id : String | Nil = nil,
      @resource_region : String | Nil = nil,
      @resource_id : String | Nil = nil,
      @resource_owner_id : String | Nil = nil,
      @resource_cidr : String | Nil = nil,
      @ip_source : IpamResourceCidrIpSource | Nil = nil,
      @resource_type : IpamResourceType | Nil = nil,
      @resource_tags : Array(IpamResourceTag) | Nil = nil,
      @ip_usage : Float64 | Nil = nil,
      @vpc_id : String | Nil = nil,
      @subnet_id : String | Nil = nil,
      @network_interface_attachment_status : IpamNetworkInterfaceAttachmentStatus | Nil = nil,
      @sample_time : Time | Nil = nil,
      @availability_zone_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @ipam_resource_discovery_id
        params << {"#{prefix}IpamResourceDiscoveryId", value}
      end

      if value = @resource_region
        params << {"#{prefix}ResourceRegion", value}
      end

      if value = @resource_id
        params << {"#{prefix}ResourceId", value}
      end

      if value = @resource_owner_id
        params << {"#{prefix}ResourceOwnerId", value}
      end

      if value = @resource_cidr
        params << {"#{prefix}ResourceCidr", value}
      end

      if value = @ip_source
        params << {"#{prefix}IpSource", value.to_json_object_key}
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

      if value = @vpc_id
        params << {"#{prefix}VpcId", value}
      end

      if value = @subnet_id
        params << {"#{prefix}SubnetId", value}
      end

      if value = @network_interface_attachment_status
        params << {"#{prefix}NetworkInterfaceAttachmentStatus", value.to_json_object_key}
      end

      if value = @sample_time
        params << {"#{prefix}SampleTime", Core::QueryValue.time(value)}
      end

      if value = @availability_zone_id
        params << {"#{prefix}AvailabilityZoneId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipam_resource_discovery_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamResourceDiscoveryId']")),
        resource_region: Core::XMLValue.string(node.xpath_node("*[local-name()='resourceRegion']")),
        resource_id: Core::XMLValue.string(node.xpath_node("*[local-name()='resourceId']")),
        resource_owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='resourceOwnerId']")),
        resource_cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='resourceCidr']")),
        ip_source: (n = node.xpath_node("*[local-name()='ipSource']")) ? AEC::IpamResourceCidrIpSource.from_json_object_key?(n.content) : nil,
        resource_type: (n = node.xpath_node("*[local-name()='resourceType']")) ? AEC::IpamResourceType.from_json_object_key?(n.content) : nil,
        resource_tags: node.xpath_nodes("*[local-name()='resourceTagSet']/*[local-name()='item']").map { |n| IpamResourceTag.from_xml(n) },
        ip_usage: Core::XMLValue.f64(node.xpath_node("*[local-name()='ipUsage']")),
        vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcId']")),
        subnet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='subnetId']")),
        network_interface_attachment_status: (n = node.xpath_node("*[local-name()='networkInterfaceAttachmentStatus']")) ? AEC::IpamNetworkInterfaceAttachmentStatus.from_json_object_key?(n.content) : nil,
        sample_time: Core::XMLValue.time(node.xpath_node("*[local-name()='sampleTime']")),
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZoneId']")),
      )
    end

    def validate! : Nil
      if value = @resource_tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@ipam_resource_discovery_id, @resource_region, @resource_id, @resource_owner_id, @resource_cidr, @ip_source, @resource_type, @resource_tags, @ip_usage, @vpc_id, @subnet_id, @network_interface_attachment_status, @sample_time, @availability_zone_id)
  end
end
