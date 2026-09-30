private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains information about an IP address CIDR registered at an internet registry and associated
  # with an IPAM.
  class IpamInternetRegistryAssociationCidr
    # The IP address prefix in CIDR notation.
    property cidr : String | Nil

    # The time when the CIDR was last observed at the internet registry.
    property last_observed_at : Time | Nil

    def initialize(
      @cidr : String | Nil = nil,
      @last_observed_at : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @cidr
        params << {"#{prefix}Cidr", value}
      end

      if value = @last_observed_at
        params << {"#{prefix}LastObservedAt", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='cidr']")),
        last_observed_at: Core::XMLValue.time(node.xpath_node("*[local-name()='lastObservedAt']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@cidr, @last_observed_at)
  end
end
