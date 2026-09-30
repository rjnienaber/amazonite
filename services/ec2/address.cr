private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an Elastic IP address, or a carrier IP address.
  class Address
    # The ID representing the allocation of the address.
    property allocation_id : String | Nil

    # The ID representing the association of the address with an instance.
    property association_id : String | Nil

    # The network (`vpc`).
    property domain : DomainType | Nil

    # The ID of the network interface.
    property network_interface_id : String | Nil

    # The ID of the Amazon Web Services account that owns the network interface.
    property network_interface_owner_id : String | Nil

    # The private IP address associated with the Elastic IP address.
    property private_ip_address : String | Nil

    # Any tags assigned to the Elastic IP address.
    property tags : Array(Tag) | Nil

    # The ID of an address pool.
    property public_ipv_4_pool : String | Nil

    # The name of the unique set of Availability Zones, Local Zones, or Wavelength Zones from which
    # Amazon Web Services advertises IP addresses.
    property network_border_group : String | Nil

    # The customer-owned IP address.
    property customer_owned_ip : String | Nil

    # The ID of the customer-owned address pool.
    property customer_owned_ipv_4_pool : String | Nil

    # The carrier IP address associated. This option is only available for network interfaces which
    # reside in a subnet in a Wavelength Zone (for example an EC2 instance).
    property carrier_ip : String | Nil

    # The ID of the subnet where the IP address is allocated.
    property subnet_id : String | Nil

    # The service that manages the elastic IP address.
    #
    # The only option supported today is `alb`.
    property service_managed : ServiceManaged | Nil

    # The ID of the instance that the address is associated with (if any).
    property instance_id : String | Nil

    # The Elastic IP address.
    property public_ip : String | Nil

    def initialize(
      @allocation_id : String | Nil = nil,
      @association_id : String | Nil = nil,
      @domain : DomainType | Nil = nil,
      @network_interface_id : String | Nil = nil,
      @network_interface_owner_id : String | Nil = nil,
      @private_ip_address : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @public_ipv_4_pool : String | Nil = nil,
      @network_border_group : String | Nil = nil,
      @customer_owned_ip : String | Nil = nil,
      @customer_owned_ipv_4_pool : String | Nil = nil,
      @carrier_ip : String | Nil = nil,
      @subnet_id : String | Nil = nil,
      @service_managed : ServiceManaged | Nil = nil,
      @instance_id : String | Nil = nil,
      @public_ip : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @allocation_id
        params << {"#{prefix}AllocationId", value}
      end

      if value = @association_id
        params << {"#{prefix}AssociationId", value}
      end

      if value = @domain
        params << {"#{prefix}Domain", value.to_json_object_key}
      end

      if value = @network_interface_id
        params << {"#{prefix}NetworkInterfaceId", value}
      end

      if value = @network_interface_owner_id
        params << {"#{prefix}NetworkInterfaceOwnerId", value}
      end

      if value = @private_ip_address
        params << {"#{prefix}PrivateIpAddress", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @public_ipv_4_pool
        params << {"#{prefix}PublicIpv4Pool", value}
      end

      if value = @network_border_group
        params << {"#{prefix}NetworkBorderGroup", value}
      end

      if value = @customer_owned_ip
        params << {"#{prefix}CustomerOwnedIp", value}
      end

      if value = @customer_owned_ipv_4_pool
        params << {"#{prefix}CustomerOwnedIpv4Pool", value}
      end

      if value = @carrier_ip
        params << {"#{prefix}CarrierIp", value}
      end

      if value = @subnet_id
        params << {"#{prefix}SubnetId", value}
      end

      if value = @service_managed
        params << {"#{prefix}ServiceManaged", value.to_json_object_key}
      end

      if value = @instance_id
        params << {"#{prefix}InstanceId", value}
      end

      if value = @public_ip
        params << {"#{prefix}PublicIp", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        allocation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='allocationId']")),
        association_id: Core::XMLValue.string(node.xpath_node("*[local-name()='associationId']")),
        domain: (n = node.xpath_node("*[local-name()='domain']")) ? AEC::DomainType.from_json_object_key?(n.content) : nil,
        network_interface_id: Core::XMLValue.string(node.xpath_node("*[local-name()='networkInterfaceId']")),
        network_interface_owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='networkInterfaceOwnerId']")),
        private_ip_address: Core::XMLValue.string(node.xpath_node("*[local-name()='privateIpAddress']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        public_ipv_4_pool: Core::XMLValue.string(node.xpath_node("*[local-name()='publicIpv4Pool']")),
        network_border_group: Core::XMLValue.string(node.xpath_node("*[local-name()='networkBorderGroup']")),
        customer_owned_ip: Core::XMLValue.string(node.xpath_node("*[local-name()='customerOwnedIp']")),
        customer_owned_ipv_4_pool: Core::XMLValue.string(node.xpath_node("*[local-name()='customerOwnedIpv4Pool']")),
        carrier_ip: Core::XMLValue.string(node.xpath_node("*[local-name()='carrierIp']")),
        subnet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='subnetId']")),
        service_managed: (n = node.xpath_node("*[local-name()='serviceManaged']")) ? AEC::ServiceManaged.from_json_object_key?(n.content) : nil,
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceId']")),
        public_ip: Core::XMLValue.string(node.xpath_node("*[local-name()='publicIp']")),
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@allocation_id, @association_id, @domain, @network_interface_id, @network_interface_owner_id, @private_ip_address, @tags, @public_ipv_4_pool, @network_border_group, @customer_owned_ip, @customer_owned_ipv_4_pool, @carrier_ip, @subnet_id, @service_managed, @instance_id, @public_ip)
  end
end
