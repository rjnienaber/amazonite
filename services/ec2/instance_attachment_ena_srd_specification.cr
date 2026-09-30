private alias Core = Amazonite::Core

module Amazonite::EC2
  # ENA Express uses Amazon Web Services Scalable Reliable Datagram (SRD) technology to increase the
  # maximum bandwidth used per stream and minimize tail latency of network traffic between EC2
  # instances. With ENA Express, you can communicate between two EC2 instances in the same subnet
  # within the same account, or in different accounts. Both sending and receiving instances must
  # have ENA Express enabled.
  #
  # To improve the reliability of network packet delivery, ENA Express reorders network packets on
  # the receiving end by default. However, some UDP-based applications are designed to handle
  # network packets that are out of order to reduce the overhead for packet delivery at the network
  # layer. When ENA Express is enabled, you can specify whether UDP network traffic uses it.
  class InstanceAttachmentEnaSrdSpecification
    # Indicates whether ENA Express is enabled for the network interface.
    property ena_srd_enabled : Bool | Nil

    # Configures ENA Express for UDP network traffic.
    property ena_srd_udp_specification : InstanceAttachmentEnaSrdUdpSpecification | Nil

    def initialize(
      @ena_srd_enabled : Bool | Nil = nil,
      @ena_srd_udp_specification : InstanceAttachmentEnaSrdUdpSpecification | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @ena_srd_enabled
        params << {"#{prefix}EnaSrdEnabled", Core::QueryValue.bool(value)}
      end

      if value = @ena_srd_udp_specification
        params.concat(value.to_query_params("#{prefix}EnaSrdUdpSpecification."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ena_srd_enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='enaSrdEnabled']")),
        ena_srd_udp_specification: node.xpath_node("*[local-name()='enaSrdUdpSpecification']").try { |n| InstanceAttachmentEnaSrdUdpSpecification.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @ena_srd_udp_specification
        value.validate!
      end
    end

    def_equals_and_hash(@ena_srd_enabled, @ena_srd_udp_specification)
  end
end
