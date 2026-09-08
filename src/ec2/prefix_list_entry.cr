private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a prefix list entry.
  class PrefixListEntry
    # The CIDR block.
    property cidr : String | Nil

    # The description.
    property description : String | Nil

    def initialize(
      @cidr : String | Nil = nil,
      @description : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @cidr
        params << {"#{prefix}Cidr", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='cidr']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@cidr, @description)
  end
end
