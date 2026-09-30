private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains information about an overlapping route detected for a BYOIP prefix.
  class IpamRouteOverlap
    # The overlapping IP address prefix in CIDR notation.
    property prefix : String | Nil

    # The ASN originating the overlapping route.
    property asn : String | Nil

    # The time when the overlap was detected.
    property detected_at : Time | Nil

    def initialize(
      @prefix : String | Nil = nil,
      @asn : String | Nil = nil,
      @detected_at : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @prefix
        params << {"#{prefix}Prefix", value}
      end

      if value = @asn
        params << {"#{prefix}Asn", value}
      end

      if value = @detected_at
        params << {"#{prefix}DetectedAt", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        prefix: Core::XMLValue.string(node.xpath_node("*[local-name()='prefix']")),
        asn: Core::XMLValue.string(node.xpath_node("*[local-name()='asn']")),
        detected_at: Core::XMLValue.time(node.xpath_node("*[local-name()='detectedAt']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@prefix, @asn, @detected_at)
  end
end
