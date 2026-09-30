private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an IPv4 CIDR block.
  class CidrBlock
    # The IPv4 CIDR block.
    property cidr_block : String | Nil

    def initialize(
      @cidr_block : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @cidr_block
        params << {"#{prefix}CidrBlock", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        cidr_block: Core::XMLValue.string(node.xpath_node("*[local-name()='cidrBlock']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@cidr_block)
  end
end
