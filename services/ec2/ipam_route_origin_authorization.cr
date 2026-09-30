private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains information about a Route Origin Authorization (ROA) published in the RPKI. A ROA
  # cryptographically attests that a specific ASN is authorized to originate a specific IP address
  # prefix.
  class IpamRouteOriginAuthorization
    # The Autonomous System Number (ASN) authorized by the ROA.
    property asn : String | Nil

    # The IP address prefix authorized by the ROA in CIDR notation.
    property prefix : String | Nil

    # The maximum prefix length that the ASN is authorized to announce.
    property max_length : Int32 | Nil

    # Specifies whether the ROA matches the route announcement.
    property match : Bool | Nil

    # The expiration date of the ROA.
    property expiration : Time | Nil

    def initialize(
      @asn : String | Nil = nil,
      @prefix : String | Nil = nil,
      @max_length : Int32 | Nil = nil,
      @match : Bool | Nil = nil,
      @expiration : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @asn
        params << {"#{prefix}Asn", value}
      end

      if value = @prefix
        params << {"#{prefix}Prefix", value}
      end

      if value = @max_length
        params << {"#{prefix}MaxLength", value.to_s}
      end

      if value = @match
        params << {"#{prefix}Match", Core::QueryValue.bool(value)}
      end

      if value = @expiration
        params << {"#{prefix}Expiration", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        asn: Core::XMLValue.string(node.xpath_node("*[local-name()='asn']")),
        prefix: Core::XMLValue.string(node.xpath_node("*[local-name()='prefix']")),
        max_length: Core::XMLValue.i32(node.xpath_node("*[local-name()='maxLength']")),
        match: Core::XMLValue.bool(node.xpath_node("*[local-name()='match']")),
        expiration: Core::XMLValue.time(node.xpath_node("*[local-name()='expiration']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@asn, @prefix, @max_length, @match, @expiration)
  end
end
