private alias Core = Amazonite::Core

module Amazonite::EC2
  # Launch instances with ENA Express settings configured from your launch template.
  class EnaSrdSpecificationRequest
    # Specifies whether ENA Express is enabled for the network interface when you launch an instance.
    property ena_srd_enabled : Bool | Nil

    # Contains ENA Express settings for UDP network traffic for the network interface attached to the
    # instance.
    property ena_srd_udp_specification : EnaSrdUdpSpecificationRequest | Nil

    def initialize(
      @ena_srd_enabled : Bool | Nil = nil,
      @ena_srd_udp_specification : EnaSrdUdpSpecificationRequest | Nil = nil,
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
        ena_srd_enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='EnaSrdEnabled']")),
        ena_srd_udp_specification: node.xpath_node("*[local-name()='EnaSrdUdpSpecification']").try { |n| EnaSrdUdpSpecificationRequest.from_xml(n) },
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
