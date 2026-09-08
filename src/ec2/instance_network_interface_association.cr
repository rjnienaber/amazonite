private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes association information for an Elastic IP address (IPv4).
  class InstanceNetworkInterfaceAssociation
    # The carrier IP address associated with the network interface.
    property carrier_ip : String | Nil

    # The customer-owned IP address associated with the network interface.
    property customer_owned_ip : String | Nil

    # The ID of the owner of the Elastic IP address.
    property ip_owner_id : String | Nil

    # The public DNS name.
    property public_dns_name : String | Nil

    # The public IP address or Elastic IP address bound to the network interface.
    property public_ip : String | Nil

    def initialize(
      @carrier_ip : String | Nil = nil,
      @customer_owned_ip : String | Nil = nil,
      @ip_owner_id : String | Nil = nil,
      @public_dns_name : String | Nil = nil,
      @public_ip : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @carrier_ip
        params << {"#{prefix}CarrierIp", value}
      end

      if value = @customer_owned_ip
        params << {"#{prefix}CustomerOwnedIp", value}
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
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        carrier_ip: Core::XMLValue.string(node.xpath_node("*[local-name()='carrierIp']")),
        customer_owned_ip: Core::XMLValue.string(node.xpath_node("*[local-name()='customerOwnedIp']")),
        ip_owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ipOwnerId']")),
        public_dns_name: Core::XMLValue.string(node.xpath_node("*[local-name()='publicDnsName']")),
        public_ip: Core::XMLValue.string(node.xpath_node("*[local-name()='publicIp']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@carrier_ip, @customer_owned_ip, @ip_owner_id, @public_dns_name, @public_ip)
  end
end
