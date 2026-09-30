private alias Core = Amazonite::Core

module Amazonite::EC2
  # Configures ENA Express for UDP network traffic from your launch template.
  class EnaSrdUdpSpecificationRequest
    # Indicates whether UDP traffic uses ENA Express for your instance. To ensure that UDP traffic can
    # use ENA Express when you launch an instance, you must also set **EnaSrdEnabled** in the
    # **EnaSrdSpecificationRequest** to `true`.
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
        ena_srd_udp_enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='EnaSrdUdpEnabled']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@ena_srd_udp_enabled)
  end
end
