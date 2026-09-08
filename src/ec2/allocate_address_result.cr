private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class AllocateAddressResult
    # The ID that represents the allocation of the Elastic IP address.
    property allocation_id : String | Nil

    # The ID of an address pool that you own.
    property public_ipv_4_pool : String | Nil

    # The set of Availability Zones, Local Zones, or Wavelength Zones from which Amazon Web Services
    # advertises IP addresses.
    property network_border_group : String | Nil

    # The network (`vpc`).
    property domain : DomainType | Nil

    # The customer-owned IP address.
    property customer_owned_ip : String | Nil

    # The ID of the customer-owned address pool.
    property customer_owned_ipv_4_pool : String | Nil

    # The carrier IP address. Available only for network interfaces that reside in a subnet in a
    # Wavelength Zone.
    property carrier_ip : String | Nil

    # The Amazon-owned IP address. Not available when using an address pool that you own.
    property public_ip : String | Nil

    def initialize(
      @allocation_id : String | Nil = nil,
      @public_ipv_4_pool : String | Nil = nil,
      @network_border_group : String | Nil = nil,
      @domain : DomainType | Nil = nil,
      @customer_owned_ip : String | Nil = nil,
      @customer_owned_ipv_4_pool : String | Nil = nil,
      @carrier_ip : String | Nil = nil,
      @public_ip : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @allocation_id
        params << {"#{prefix}AllocationId", value}
      end

      if value = @public_ipv_4_pool
        params << {"#{prefix}PublicIpv4Pool", value}
      end

      if value = @network_border_group
        params << {"#{prefix}NetworkBorderGroup", value}
      end

      if value = @domain
        params << {"#{prefix}Domain", value.to_json_object_key}
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

      if value = @public_ip
        params << {"#{prefix}PublicIp", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        allocation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='allocationId']")),
        public_ipv_4_pool: Core::XMLValue.string(node.xpath_node("*[local-name()='publicIpv4Pool']")),
        network_border_group: Core::XMLValue.string(node.xpath_node("*[local-name()='networkBorderGroup']")),
        domain: (n = node.xpath_node("*[local-name()='domain']")) ? AEC::DomainType.from_json_object_key?(n.content) : nil,
        customer_owned_ip: Core::XMLValue.string(node.xpath_node("*[local-name()='customerOwnedIp']")),
        customer_owned_ipv_4_pool: Core::XMLValue.string(node.xpath_node("*[local-name()='customerOwnedIpv4Pool']")),
        carrier_ip: Core::XMLValue.string(node.xpath_node("*[local-name()='carrierIp']")),
        public_ip: Core::XMLValue.string(node.xpath_node("*[local-name()='publicIp']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@allocation_id, @public_ipv_4_pool, @network_border_group, @domain, @customer_owned_ip, @customer_owned_ipv_4_pool, @carrier_ip, @public_ip)
  end
end
