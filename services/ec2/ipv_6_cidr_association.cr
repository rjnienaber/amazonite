private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an IPv6 CIDR block association.
  class Ipv6CidrAssociation
    # The IPv6 CIDR block.
    property ipv_6_cidr : String | Nil

    # The resource that's associated with the IPv6 CIDR block.
    property associated_resource : String | Nil

    def initialize(
      @ipv_6_cidr : String | Nil = nil,
      @associated_resource : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @ipv_6_cidr
        params << {"#{prefix}Ipv6Cidr", value}
      end

      if value = @associated_resource
        params << {"#{prefix}AssociatedResource", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipv_6_cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='ipv6Cidr']")),
        associated_resource: Core::XMLValue.string(node.xpath_node("*[local-name()='associatedResource']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@ipv_6_cidr, @associated_resource)
  end
end
