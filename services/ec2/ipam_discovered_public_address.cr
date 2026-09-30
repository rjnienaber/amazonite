private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # A public IP Address discovered by IPAM.
  class IpamDiscoveredPublicAddress
    # The resource discovery ID.
    property ipam_resource_discovery_id : String | Nil

    # The Region of the resource the IP address is assigned to.
    property address_region : String | Nil

    # The IP address.
    property address : String | Nil

    # The ID of the owner of the resource the IP address is assigned to.
    property address_owner_id : String | Nil

    # The allocation ID of the resource the IP address is assigned to.
    property address_allocation_id : String | Nil

    # The association status.
    property association_status : IpamPublicAddressAssociationStatus | Nil

    # The IP address type.
    property address_type : IpamPublicAddressType | Nil

    # The Amazon Web Services service associated with the IP address.
    property service : IpamPublicAddressAwsService | Nil

    # The resource ARN or ID.
    property service_resource : String | Nil

    # The ID of the VPC that the resource with the assigned IP address is in.
    property vpc_id : String | Nil

    # The ID of the subnet that the resource with the assigned IP address is in.
    property subnet_id : String | Nil

    # The ID of the public IPv4 pool that the resource with the assigned IP address is from.
    property public_ipv_4_pool_id : String | Nil

    # The network interface ID of the resource with the assigned IP address.
    property network_interface_id : String | Nil

    # The description of the network interface that IP address is assigned to.
    property network_interface_description : String | Nil

    # The instance ID of the instance the assigned IP address is assigned to.
    property instance_id : String | Nil

    # Tags associated with the IP address.
    property tags : IpamPublicAddressTags | Nil

    # The Availability Zone (AZ) or Local Zone (LZ) network border group that the resource that the IP
    # address is assigned to is in. Defaults to an AZ network border group. For more information on
    # available Local Zones, see [Local Zone
    # availability](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-byoip.html#byoip-zone-avail)
    # in the *Amazon EC2 User Guide*.
    property network_border_group : String | Nil

    # Security groups associated with the resource that the IP address is assigned to.
    property security_groups : Array(IpamPublicAddressSecurityGroup) | Nil

    # The last successful resource discovery time.
    property sample_time : Time | Nil

    def initialize(
      @ipam_resource_discovery_id : String | Nil = nil,
      @address_region : String | Nil = nil,
      @address : String | Nil = nil,
      @address_owner_id : String | Nil = nil,
      @address_allocation_id : String | Nil = nil,
      @association_status : IpamPublicAddressAssociationStatus | Nil = nil,
      @address_type : IpamPublicAddressType | Nil = nil,
      @service : IpamPublicAddressAwsService | Nil = nil,
      @service_resource : String | Nil = nil,
      @vpc_id : String | Nil = nil,
      @subnet_id : String | Nil = nil,
      @public_ipv_4_pool_id : String | Nil = nil,
      @network_interface_id : String | Nil = nil,
      @network_interface_description : String | Nil = nil,
      @instance_id : String | Nil = nil,
      @tags : IpamPublicAddressTags | Nil = nil,
      @network_border_group : String | Nil = nil,
      @security_groups : Array(IpamPublicAddressSecurityGroup) | Nil = nil,
      @sample_time : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @ipam_resource_discovery_id
        params << {"#{prefix}IpamResourceDiscoveryId", value}
      end

      if value = @address_region
        params << {"#{prefix}AddressRegion", value}
      end

      if value = @address
        params << {"#{prefix}Address", value}
      end

      if value = @address_owner_id
        params << {"#{prefix}AddressOwnerId", value}
      end

      if value = @address_allocation_id
        params << {"#{prefix}AddressAllocationId", value}
      end

      if value = @association_status
        params << {"#{prefix}AssociationStatus", value.to_json_object_key}
      end

      if value = @address_type
        params << {"#{prefix}AddressType", value.to_json_object_key}
      end

      if value = @service
        params << {"#{prefix}Service", value.to_json_object_key}
      end

      if value = @service_resource
        params << {"#{prefix}ServiceResource", value}
      end

      if value = @vpc_id
        params << {"#{prefix}VpcId", value}
      end

      if value = @subnet_id
        params << {"#{prefix}SubnetId", value}
      end

      if value = @public_ipv_4_pool_id
        params << {"#{prefix}PublicIpv4PoolId", value}
      end

      if value = @network_interface_id
        params << {"#{prefix}NetworkInterfaceId", value}
      end

      if value = @network_interface_description
        params << {"#{prefix}NetworkInterfaceDescription", value}
      end

      if value = @instance_id
        params << {"#{prefix}InstanceId", value}
      end

      if value = @tags
        params.concat(value.to_query_params("#{prefix}Tags."))
      end

      if value = @network_border_group
        params << {"#{prefix}NetworkBorderGroup", value}
      end

      (@security_groups || [] of IpamPublicAddressSecurityGroup).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}SecurityGroupSet.#{i}."))
      end

      if value = @sample_time
        params << {"#{prefix}SampleTime", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipam_resource_discovery_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamResourceDiscoveryId']")),
        address_region: Core::XMLValue.string(node.xpath_node("*[local-name()='addressRegion']")),
        address: Core::XMLValue.string(node.xpath_node("*[local-name()='address']")),
        address_owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='addressOwnerId']")),
        address_allocation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='addressAllocationId']")),
        association_status: (n = node.xpath_node("*[local-name()='associationStatus']")) ? AEC::IpamPublicAddressAssociationStatus.from_json_object_key?(n.content) : nil,
        address_type: (n = node.xpath_node("*[local-name()='addressType']")) ? AEC::IpamPublicAddressType.from_json_object_key?(n.content) : nil,
        service: (n = node.xpath_node("*[local-name()='service']")) ? AEC::IpamPublicAddressAwsService.from_json_object_key?(n.content) : nil,
        service_resource: Core::XMLValue.string(node.xpath_node("*[local-name()='serviceResource']")),
        vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcId']")),
        subnet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='subnetId']")),
        public_ipv_4_pool_id: Core::XMLValue.string(node.xpath_node("*[local-name()='publicIpv4PoolId']")),
        network_interface_id: Core::XMLValue.string(node.xpath_node("*[local-name()='networkInterfaceId']")),
        network_interface_description: Core::XMLValue.string(node.xpath_node("*[local-name()='networkInterfaceDescription']")),
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceId']")),
        tags: node.xpath_node("*[local-name()='tags']").try { |n| IpamPublicAddressTags.from_xml(n) },
        network_border_group: Core::XMLValue.string(node.xpath_node("*[local-name()='networkBorderGroup']")),
        security_groups: node.xpath_nodes("*[local-name()='securityGroupSet']/*[local-name()='item']").map { |n| IpamPublicAddressSecurityGroup.from_xml(n) },
        sample_time: Core::XMLValue.time(node.xpath_node("*[local-name()='sampleTime']")),
      )
    end

    def validate! : Nil
      if value = @tags
        value.validate!
      end

      if value = @security_groups
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@ipam_resource_discovery_id, @address_region, @address, @address_owner_id, @address_allocation_id, @association_status, @address_type, @service, @service_resource, @vpc_id, @subnet_id, @public_ipv_4_pool_id, @network_interface_id, @network_interface_description, @instance_id, @tags, @network_border_group, @security_groups, @sample_time)
  end
end
