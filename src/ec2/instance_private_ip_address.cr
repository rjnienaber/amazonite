private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a private IPv4 address.
  class InstancePrivateIpAddress
    # The association information for an Elastic IP address for the network interface.
    property association : InstanceNetworkInterfaceAssociation | Nil

    # Indicates whether this IPv4 address is the primary private IP address of the network interface.
    property primary : Bool | Nil

    # The private IPv4 DNS name.
    property private_dns_name : String | Nil

    # The private IPv4 address of the network interface.
    property private_ip_address : String | Nil

    def initialize(
      @association : InstanceNetworkInterfaceAssociation | Nil = nil,
      @primary : Bool | Nil = nil,
      @private_dns_name : String | Nil = nil,
      @private_ip_address : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @association
        params.concat(value.to_query_params("#{prefix}Association."))
      end

      if value = @primary
        params << {"#{prefix}Primary", Core::QueryValue.bool(value)}
      end

      if value = @private_dns_name
        params << {"#{prefix}PrivateDnsName", value}
      end

      if value = @private_ip_address
        params << {"#{prefix}PrivateIpAddress", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        association: node.xpath_node("*[local-name()='association']").try { |n| InstanceNetworkInterfaceAssociation.from_xml(n) },
        primary: Core::XMLValue.bool(node.xpath_node("*[local-name()='primary']")),
        private_dns_name: Core::XMLValue.string(node.xpath_node("*[local-name()='privateDnsName']")),
        private_ip_address: Core::XMLValue.string(node.xpath_node("*[local-name()='privateIpAddress']")),
      )
    end

    def validate! : Nil
      if value = @association
        value.validate!
      end
    end

    def_equals_and_hash(@association, @primary, @private_dns_name, @private_ip_address)
  end
end
