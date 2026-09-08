private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the IPv6 prefix.
  class Ipv6PrefixSpecification
    # The IPv6 prefix.
    property ipv_6_prefix : String | Nil

    def initialize(
      @ipv_6_prefix : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @ipv_6_prefix
        params << {"#{prefix}Ipv6Prefix", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipv_6_prefix: Core::XMLValue.string(node.xpath_node("*[local-name()='ipv6Prefix']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@ipv_6_prefix)
  end
end
