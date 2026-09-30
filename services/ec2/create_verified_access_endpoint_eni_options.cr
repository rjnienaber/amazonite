private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the network interface options when creating an Amazon Web Services Verified Access
  # endpoint using the `network-interface` type.
  class CreateVerifiedAccessEndpointEniOptions
    # The ID of the network interface.
    property network_interface_id : String | Nil

    # The IP protocol.
    property protocol : VerifiedAccessEndpointProtocol | Nil

    # The IP port number.
    property port : Int32 | Nil

    # The port ranges.
    property port_ranges : Array(CreateVerifiedAccessEndpointPortRange) | Nil

    def initialize(
      @network_interface_id : String | Nil = nil,
      @protocol : VerifiedAccessEndpointProtocol | Nil = nil,
      @port : Int32 | Nil = nil,
      @port_ranges : Array(CreateVerifiedAccessEndpointPortRange) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @network_interface_id
        params << {"#{prefix}NetworkInterfaceId", value}
      end

      if value = @protocol
        params << {"#{prefix}Protocol", value.to_json_object_key}
      end

      if value = @port
        params << {"#{prefix}Port", value.to_s}
      end

      (@port_ranges || [] of CreateVerifiedAccessEndpointPortRange).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PortRange.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        network_interface_id: Core::XMLValue.string(node.xpath_node("*[local-name()='NetworkInterfaceId']")),
        protocol: (n = node.xpath_node("*[local-name()='Protocol']")) ? AEC::VerifiedAccessEndpointProtocol.from_json_object_key?(n.content) : nil,
        port: Core::XMLValue.i32(node.xpath_node("*[local-name()='Port']")),
        port_ranges: node.xpath_nodes("*[local-name()='PortRange']/*[local-name()='item']").map { |n| CreateVerifiedAccessEndpointPortRange.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @port
        raise Core::ValidationError.new("Port value must be >= 1") if value < 1
        raise Core::ValidationError.new("Port value must be <= 65535") if value > 65535
      end

      if value = @port_ranges
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@network_interface_id, @protocol, @port, @port_ranges)
  end
end
