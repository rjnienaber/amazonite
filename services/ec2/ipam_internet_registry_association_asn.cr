private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains information about an Autonomous System Number (ASN) registered at an internet registry
  # and associated with an IPAM.
  class IpamInternetRegistryAssociationAsn
    # The Autonomous System Number.
    property asn : String | Nil

    # The time when the ASN was last observed at the internet registry.
    property last_observed_at : Time | Nil

    def initialize(
      @asn : String | Nil = nil,
      @last_observed_at : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @asn
        params << {"#{prefix}Asn", value}
      end

      if value = @last_observed_at
        params << {"#{prefix}LastObservedAt", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        asn: Core::XMLValue.string(node.xpath_node("*[local-name()='asn']")),
        last_observed_at: Core::XMLValue.time(node.xpath_node("*[local-name()='lastObservedAt']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@asn, @last_observed_at)
  end
end
