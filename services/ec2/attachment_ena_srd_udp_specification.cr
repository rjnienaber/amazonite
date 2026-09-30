private alias Core = Amazonite::Core

module Amazonite::EC2
  # ENA Express is compatible with both TCP and UDP transport protocols. When it's enabled, TCP
  # traffic automatically uses it. However, some UDP-based applications are designed to handle
  # network packets that are out of order, without a need for retransmission, such as live video
  # broadcasting or other near-real-time applications. For UDP traffic, you can specify whether to
  # use ENA Express, based on your application environment needs.
  class AttachmentEnaSrdUdpSpecification
    # Indicates whether UDP traffic to and from the instance uses ENA Express. To specify this
    # setting, you must first enable ENA Express.
    property ena_srd_udp_enabled : Bool | Nil

    def initialize(
      @ena_srd_udp_enabled : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @ena_srd_udp_enabled
        params << {"#{prefix}EnaSrdUdpEnabled", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ena_srd_udp_enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='enaSrdUdpEnabled']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@ena_srd_udp_enabled)
  end
end
