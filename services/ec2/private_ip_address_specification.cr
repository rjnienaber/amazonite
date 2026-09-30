private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a secondary private IPv4 address for a network interface.
  class PrivateIpAddressSpecification
    # Indicates whether the private IPv4 address is the primary private IPv4 address. Only one IPv4
    # address can be designated as primary.
    property primary : Bool | Nil

    # The private IPv4 address.
    property private_ip_address : String | Nil

    def initialize(
      @primary : Bool | Nil = nil,
      @private_ip_address : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @primary
        params << {"#{prefix}Primary", Core::QueryValue.bool(value)}
      end

      if value = @private_ip_address
        params << {"#{prefix}PrivateIpAddress", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        primary: Core::XMLValue.bool(node.xpath_node("*[local-name()='primary']")),
        private_ip_address: Core::XMLValue.string(node.xpath_node("*[local-name()='privateIpAddress']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@primary, @private_ip_address)
  end
end
