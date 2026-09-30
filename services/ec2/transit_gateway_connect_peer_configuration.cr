private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the Connect peer details.
  class TransitGatewayConnectPeerConfiguration
    # The Connect peer IP address on the transit gateway side of the tunnel.
    property transit_gateway_address : String | Nil

    # The Connect peer IP address on the appliance side of the tunnel.
    property peer_address : String | Nil

    # The range of interior BGP peer IP addresses.
    property inside_cidr_blocks : Array(String) | Nil

    # The tunnel protocol.
    property protocol : ProtocolValue | Nil

    # The BGP configuration details.
    property bgp_configurations : Array(TransitGatewayAttachmentBgpConfiguration) | Nil

    def initialize(
      @transit_gateway_address : String | Nil = nil,
      @peer_address : String | Nil = nil,
      @inside_cidr_blocks : Array(String) | Nil = nil,
      @protocol : ProtocolValue | Nil = nil,
      @bgp_configurations : Array(TransitGatewayAttachmentBgpConfiguration) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @transit_gateway_address
        params << {"#{prefix}TransitGatewayAddress", value}
      end

      if value = @peer_address
        params << {"#{prefix}PeerAddress", value}
      end

      (@inside_cidr_blocks || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}InsideCidrBlocks.#{i}", item}
      end

      if value = @protocol
        params << {"#{prefix}Protocol", value.to_json_object_key}
      end

      (@bgp_configurations || [] of TransitGatewayAttachmentBgpConfiguration).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}BgpConfigurations.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_address: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayAddress']")),
        peer_address: Core::XMLValue.string(node.xpath_node("*[local-name()='peerAddress']")),
        inside_cidr_blocks: node.xpath_nodes("*[local-name()='insideCidrBlocks']/*[local-name()='item']").map { |n| n.content },
        protocol: (n = node.xpath_node("*[local-name()='protocol']")) ? AEC::ProtocolValue.from_json_object_key?(n.content) : nil,
        bgp_configurations: node.xpath_nodes("*[local-name()='bgpConfigurations']/*[local-name()='item']").map { |n| TransitGatewayAttachmentBgpConfiguration.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @bgp_configurations
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@transit_gateway_address, @peer_address, @inside_cidr_blocks, @protocol, @bgp_configurations)
  end
end
