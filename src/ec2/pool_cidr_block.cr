private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a CIDR block for an address pool.
  class PoolCidrBlock
    # The CIDR block.
    property cidr : String | Nil

    def initialize(
      @cidr : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @cidr
        params << {"#{prefix}PoolCidrBlock", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='poolCidrBlock']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@cidr)
  end
end
