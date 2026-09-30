private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains information about a Route Origin Authorization (ROA) currently published in the RPKI.
  class IpamRouteOriginAuthorizationInfo
    # The IP address prefix in CIDR notation authorized by the ROA.
    property cidr : String | Nil

    # The Autonomous System Number (ASN) authorized to originate the prefix.
    property asn : String | Nil

    # The maximum prefix length that the ASN is authorized to announce.
    property max_length : Int32 | Nil

    def initialize(
      @cidr : String | Nil = nil,
      @asn : String | Nil = nil,
      @max_length : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @cidr
        params << {"#{prefix}Cidr", value}
      end

      if value = @asn
        params << {"#{prefix}Asn", value}
      end

      if value = @max_length
        params << {"#{prefix}MaxLength", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='cidr']")),
        asn: Core::XMLValue.string(node.xpath_node("*[local-name()='asn']")),
        max_length: Core::XMLValue.i32(node.xpath_node("*[local-name()='maxLength']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@cidr, @asn, @max_length)
  end
end
