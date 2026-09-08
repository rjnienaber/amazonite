private alias Core = Amazonite::Core

module Amazonite::EC2
  # Information about the IPv4 delegated prefixes assigned to a network interface.
  class Ipv4PrefixSpecificationResponse
    # The IPv4 delegated prefixes assigned to the network interface.
    property ipv_4_prefix : String | Nil

    def initialize(
      @ipv_4_prefix : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @ipv_4_prefix
        params << {"#{prefix}Ipv4Prefix", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipv_4_prefix: Core::XMLValue.string(node.xpath_node("*[local-name()='ipv4Prefix']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@ipv_4_prefix)
  end
end
