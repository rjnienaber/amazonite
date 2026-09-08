private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an IPv6 CIDR block.
  class Ipv6CidrBlock
    # The IPv6 CIDR block.
    property ipv_6_cidr_block : String | Nil

    def initialize(
      @ipv_6_cidr_block : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @ipv_6_cidr_block
        params << {"#{prefix}Ipv6CidrBlock", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipv_6_cidr_block: Core::XMLValue.string(node.xpath_node("*[local-name()='ipv6CidrBlock']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@ipv_6_cidr_block)
  end
end
