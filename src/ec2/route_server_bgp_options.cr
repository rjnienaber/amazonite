private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # The BGP configuration options for a route server peer.
  class RouteServerBgpOptions
    # The Border Gateway Protocol (BGP) Autonomous System Number (ASN) for the appliance. Valid values
    # are from 1 to 4294967295. We recommend using a private ASN in the 64512–65534 (16-bit ASN) or
    # 4200000000–4294967294 (32-bit ASN) range.
    property peer_asn : Int64 | Nil

    # The liveness detection protocol used for the BGP peer.
    #
    # The requested liveness detection protocol for the BGP peer.
    #
    # - `bgp-keepalive`: The standard BGP keep alive mechanism
    # ([RFC4271](https://www.rfc-editor.org/rfc/rfc4271#page-21)) that is stable but may take longer
    # to fail-over in cases of network impact or router failure.
    #
    # - `bfd`: An additional Bidirectional Forwarding Detection (BFD) protocol
    # ([RFC5880](https://www.rfc-editor.org/rfc/rfc5880)) that enables fast failover by using more
    # sensitive liveness detection.
    #
    # Defaults to `bgp-keepalive`.
    property peer_liveness_detection : RouteServerPeerLivenessMode | Nil

    def initialize(
      @peer_asn : Int64 | Nil = nil,
      @peer_liveness_detection : RouteServerPeerLivenessMode | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @peer_asn
        params << {"#{prefix}PeerAsn", value.to_s}
      end

      if value = @peer_liveness_detection
        params << {"#{prefix}PeerLivenessDetection", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        peer_asn: Core::XMLValue.i64(node.xpath_node("*[local-name()='peerAsn']")),
        peer_liveness_detection: (n = node.xpath_node("*[local-name()='peerLivenessDetection']")) ? AEC::RouteServerPeerLivenessMode.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@peer_asn, @peer_liveness_detection)
  end
end
