private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an IPv6 address.
  class InstanceIpv6Address
    # The IPv6 address.
    property ipv_6_address : String | Nil

    # Determines if an IPv6 address associated with a network interface is the primary IPv6 address.
    # When you enable an IPv6 GUA address to be a primary IPv6, the first IPv6 GUA will be made the
    # primary IPv6 address until the instance is terminated or the network interface is detached. For
    # more information, see
    # [RunInstances](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_RunInstances.html).
    property is_primary_ipv_6 : Bool | Nil

    def initialize(
      @ipv_6_address : String | Nil = nil,
      @is_primary_ipv_6 : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @ipv_6_address
        params << {"#{prefix}Ipv6Address", value}
      end

      if value = @is_primary_ipv_6
        params << {"#{prefix}IsPrimaryIpv6", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipv_6_address: Core::XMLValue.string(node.xpath_node("*[local-name()='ipv6Address']")),
        is_primary_ipv_6: Core::XMLValue.bool(node.xpath_node("*[local-name()='isPrimaryIpv6']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@ipv_6_address, @is_primary_ipv_6)
  end
end
