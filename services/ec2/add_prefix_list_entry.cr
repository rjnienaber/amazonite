private alias Core = Amazonite::Core

module Amazonite::EC2
  # An entry for a prefix list.
  class AddPrefixListEntry
    # The CIDR block.
    property cidr : String

    # A description for the entry.
    #
    # Constraints: Up to 255 characters in length.
    property description : String | Nil

    def initialize(
      @cidr : String,
      @description : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}Cidr", @cidr}

      if value = @description
        params << {"#{prefix}Description", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='Cidr']")).not_nil!,
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@cidr, @description)
  end
end
