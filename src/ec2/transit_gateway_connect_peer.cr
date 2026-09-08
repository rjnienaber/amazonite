private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a transit gateway Connect peer.
  class TransitGatewayConnectPeer
    # The ID of the Connect attachment.
    property transit_gateway_attachment_id : String | Nil

    # The ID of the Connect peer.
    property transit_gateway_connect_peer_id : String | Nil

    # The state of the Connect peer.
    property state : TransitGatewayConnectPeerState | Nil

    # The creation time.
    property creation_time : Time | Nil

    # The Connect peer details.
    property connect_peer_configuration : TransitGatewayConnectPeerConfiguration | Nil

    # The tags for the Connect peer.
    property tags : Array(Tag) | Nil

    def initialize(
      @transit_gateway_attachment_id : String | Nil = nil,
      @transit_gateway_connect_peer_id : String | Nil = nil,
      @state : TransitGatewayConnectPeerState | Nil = nil,
      @creation_time : Time | Nil = nil,
      @connect_peer_configuration : TransitGatewayConnectPeerConfiguration | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @transit_gateway_attachment_id
        params << {"#{prefix}TransitGatewayAttachmentId", value}
      end

      if value = @transit_gateway_connect_peer_id
        params << {"#{prefix}TransitGatewayConnectPeerId", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @creation_time
        params << {"#{prefix}CreationTime", Core::QueryValue.time(value)}
      end

      if value = @connect_peer_configuration
        params.concat(value.to_query_params("#{prefix}ConnectPeerConfiguration."))
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_attachment_id: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayAttachmentId']")),
        transit_gateway_connect_peer_id: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayConnectPeerId']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::TransitGatewayConnectPeerState.from_json_object_key?(n.content) : nil,
        creation_time: Core::XMLValue.time(node.xpath_node("*[local-name()='creationTime']")),
        connect_peer_configuration: node.xpath_node("*[local-name()='connectPeerConfiguration']").try { |n| TransitGatewayConnectPeerConfiguration.from_xml(n) },
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @connect_peer_configuration
        value.validate!
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@transit_gateway_attachment_id, @transit_gateway_connect_peer_id, @state, @creation_time, @connect_peer_configuration, @tags)
  end
end
