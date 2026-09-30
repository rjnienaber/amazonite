private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # The BGP configuration information.
  class TransitGatewayAttachmentBgpConfiguration
    # The transit gateway Autonomous System Number (ASN).
    property transit_gateway_asn : Int64 | Nil

    # The peer Autonomous System Number (ASN).
    property peer_asn : Int64 | Nil

    # The interior BGP peer IP address for the transit gateway.
    property transit_gateway_address : String | Nil

    # The interior BGP peer IP address for the appliance.
    property peer_address : String | Nil

    # The BGP status.
    property bgp_status : BgpStatus | Nil

    def initialize(
      @transit_gateway_asn : Int64 | Nil = nil,
      @peer_asn : Int64 | Nil = nil,
      @transit_gateway_address : String | Nil = nil,
      @peer_address : String | Nil = nil,
      @bgp_status : BgpStatus | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @transit_gateway_asn
        params << {"#{prefix}TransitGatewayAsn", value.to_s}
      end

      if value = @peer_asn
        params << {"#{prefix}PeerAsn", value.to_s}
      end

      if value = @transit_gateway_address
        params << {"#{prefix}TransitGatewayAddress", value}
      end

      if value = @peer_address
        params << {"#{prefix}PeerAddress", value}
      end

      if value = @bgp_status
        params << {"#{prefix}BgpStatus", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_asn: Core::XMLValue.i64(node.xpath_node("*[local-name()='transitGatewayAsn']")),
        peer_asn: Core::XMLValue.i64(node.xpath_node("*[local-name()='peerAsn']")),
        transit_gateway_address: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayAddress']")),
        peer_address: Core::XMLValue.string(node.xpath_node("*[local-name()='peerAddress']")),
        bgp_status: (n = node.xpath_node("*[local-name()='bgpStatus']")) ? AEC::BgpStatus.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@transit_gateway_asn, @peer_asn, @transit_gateway_address, @peer_address, @bgp_status)
  end
end
