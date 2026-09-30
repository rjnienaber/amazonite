private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a transit gateway Connect attachment.
  class TransitGatewayConnect
    # The ID of the Connect attachment.
    property transit_gateway_attachment_id : String | Nil

    # The ID of the attachment from which the Connect attachment was created.
    property transport_transit_gateway_attachment_id : String | Nil

    # The ID of the transit gateway.
    property transit_gateway_id : String | Nil

    # The state of the attachment.
    property state : TransitGatewayAttachmentState | Nil

    # The creation time.
    property creation_time : Time | Nil

    # The Connect attachment options.
    property options : TransitGatewayConnectOptions | Nil

    # The tags for the attachment.
    property tags : Array(Tag) | Nil

    def initialize(
      @transit_gateway_attachment_id : String | Nil = nil,
      @transport_transit_gateway_attachment_id : String | Nil = nil,
      @transit_gateway_id : String | Nil = nil,
      @state : TransitGatewayAttachmentState | Nil = nil,
      @creation_time : Time | Nil = nil,
      @options : TransitGatewayConnectOptions | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @transit_gateway_attachment_id
        params << {"#{prefix}TransitGatewayAttachmentId", value}
      end

      if value = @transport_transit_gateway_attachment_id
        params << {"#{prefix}TransportTransitGatewayAttachmentId", value}
      end

      if value = @transit_gateway_id
        params << {"#{prefix}TransitGatewayId", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @creation_time
        params << {"#{prefix}CreationTime", Core::QueryValue.time(value)}
      end

      if value = @options
        params.concat(value.to_query_params("#{prefix}Options."))
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_attachment_id: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayAttachmentId']")),
        transport_transit_gateway_attachment_id: Core::XMLValue.string(node.xpath_node("*[local-name()='transportTransitGatewayAttachmentId']")),
        transit_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayId']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::TransitGatewayAttachmentState.from_json_object_key?(n.content) : nil,
        creation_time: Core::XMLValue.time(node.xpath_node("*[local-name()='creationTime']")),
        options: node.xpath_node("*[local-name()='options']").try { |n| TransitGatewayConnectOptions.from_xml(n) },
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @options
        value.validate!
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@transit_gateway_attachment_id, @transport_transit_gateway_attachment_id, @transit_gateway_id, @state, @creation_time, @options, @tags)
  end
end
