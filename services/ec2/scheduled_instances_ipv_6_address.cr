private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an IPv6 address.
  class ScheduledInstancesIpv6Address
    # The IPv6 address.
    property ipv_6_address : String | Nil

    def initialize(
      @ipv_6_address : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @ipv_6_address
        params << {"#{prefix}Ipv6Address", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipv_6_address: Core::XMLValue.string(node.xpath_node("*[local-name()='Ipv6Address']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@ipv_6_address)
  end
end
