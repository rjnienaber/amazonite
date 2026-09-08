private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes association information for an Elastic IP address (IPv4 only), or a Carrier IP address
  # (for a network interface which resides in a subnet in a Wavelength Zone).
  class NetworkInterfaceAssociation
    # The allocation ID.
    property allocation_id : String | Nil

    # The association ID.
    property association_id : String | Nil

    # The ID of the Elastic IP address owner.
    property ip_owner_id : String | Nil

    # The public DNS name.
    property public_dns_name : String | Nil

    # The address of the Elastic IP address bound to the network interface.
    property public_ip : String | Nil

    # The customer-owned IP address associated with the network interface.
    property customer_owned_ip : String | Nil

    # The carrier IP address associated with the network interface.
    #
    # This option is only available when the network interface is in a subnet which is associated with
    # a Wavelength Zone.
    property carrier_ip : String | Nil

    def initialize(
      @allocation_id : String | Nil = nil,
      @association_id : String | Nil = nil,
      @ip_owner_id : String | Nil = nil,
      @public_dns_name : String | Nil = nil,
      @public_ip : String | Nil = nil,
      @customer_owned_ip : String | Nil = nil,
      @carrier_ip : String | Nil = nil,
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

      if value = @ip_owner_id
        params << {"#{prefix}IpOwnerId", value}
      end

      if value = @public_dns_name
        params << {"#{prefix}PublicDnsName", value}
      end

      if value = @public_ip
        params << {"#{prefix}PublicIp", value}
      end

      if value = @customer_owned_ip
        params << {"#{prefix}CustomerOwnedIp", value}
      end

      if value = @carrier_ip
        params << {"#{prefix}CarrierIp", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        allocation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='allocationId']")),
        association_id: Core::XMLValue.string(node.xpath_node("*[local-name()='associationId']")),
        ip_owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ipOwnerId']")),
        public_dns_name: Core::XMLValue.string(node.xpath_node("*[local-name()='publicDnsName']")),
        public_ip: Core::XMLValue.string(node.xpath_node("*[local-name()='publicIp']")),
        customer_owned_ip: Core::XMLValue.string(node.xpath_node("*[local-name()='customerOwnedIp']")),
        carrier_ip: Core::XMLValue.string(node.xpath_node("*[local-name()='carrierIp']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@allocation_id, @association_id, @ip_owner_id, @public_dns_name, @public_ip, @customer_owned_ip, @carrier_ip)
  end
end
