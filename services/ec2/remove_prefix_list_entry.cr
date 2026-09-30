private alias Core = Amazonite::Core

module Amazonite::EC2
  # An entry for a prefix list.
  class RemovePrefixListEntry
    # The CIDR block.
    property cidr : String

    def initialize(
      @cidr : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}Cidr", @cidr}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='Cidr']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@cidr)
  end
end
