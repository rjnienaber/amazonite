private alias Core = Amazonite::Core

module Amazonite::EC2
  # The BGP options for the Connect attachment.
  class TransitGatewayConnectRequestBgpOptions
    # The peer Autonomous System Number (ASN).
    property peer_asn : Int64 | Nil

    def initialize(
      @peer_asn : Int64 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @peer_asn
        params << {"#{prefix}PeerAsn", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        peer_asn: Core::XMLValue.i64(node.xpath_node("*[local-name()='PeerAsn']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@peer_asn)
  end
end
