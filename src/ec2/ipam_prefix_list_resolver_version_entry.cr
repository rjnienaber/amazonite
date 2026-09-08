private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a CIDR entry in a specific version of an IPAM prefix list resolver. This represents a
  # CIDR that was selected and synchronized at a particular point in time.
  class IpamPrefixListResolverVersionEntry
    # The CIDR block that was selected and synchronized in this resolver version.
    property cidr : String | Nil

    def initialize(
      @cidr : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @cidr
        params << {"#{prefix}Cidr", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='cidr']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@cidr)
  end
end
