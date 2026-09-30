private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the transit gateway peering attachment.
  class TransitGatewayPeeringAttachment
    # The ID of the transit gateway peering attachment.
    property transit_gateway_attachment_id : String | Nil

    # The ID of the accepter transit gateway attachment.
    property accepter_transit_gateway_attachment_id : String | Nil

    # Information about the requester transit gateway.
    property requester_tgw_info : PeeringTgwInfo | Nil

    # Information about the accepter transit gateway.
    property accepter_tgw_info : PeeringTgwInfo | Nil

    # Details about the transit gateway peering attachment.
    property options : TransitGatewayPeeringAttachmentOptions | Nil

    # The status of the transit gateway peering attachment.
    property status : PeeringAttachmentStatus | Nil

    # The state of the transit gateway peering attachment. Note that the `initiating` state has been
    # deprecated.
    property state : TransitGatewayAttachmentState | Nil

    # The time the transit gateway peering attachment was created.
    property creation_time : Time | Nil

    # The tags for the transit gateway peering attachment.
    property tags : Array(Tag) | Nil

    def initialize(
      @transit_gateway_attachment_id : String | Nil = nil,
      @accepter_transit_gateway_attachment_id : String | Nil = nil,
      @requester_tgw_info : PeeringTgwInfo | Nil = nil,
      @accepter_tgw_info : PeeringTgwInfo | Nil = nil,
      @options : TransitGatewayPeeringAttachmentOptions | Nil = nil,
      @status : PeeringAttachmentStatus | Nil = nil,
      @state : TransitGatewayAttachmentState | Nil = nil,
      @creation_time : Time | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @transit_gateway_attachment_id
        params << {"#{prefix}TransitGatewayAttachmentId", value}
      end

      if value = @accepter_transit_gateway_attachment_id
        params << {"#{prefix}AccepterTransitGatewayAttachmentId", value}
      end

      if value = @requester_tgw_info
        params.concat(value.to_query_params("#{prefix}RequesterTgwInfo."))
      end

      if value = @accepter_tgw_info
        params.concat(value.to_query_params("#{prefix}AccepterTgwInfo."))
      end

      if value = @options
        params.concat(value.to_query_params("#{prefix}Options."))
      end

      if value = @status
        params.concat(value.to_query_params("#{prefix}Status."))
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @creation_time
        params << {"#{prefix}CreationTime", Core::QueryValue.time(value)}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_attachment_id: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayAttachmentId']")),
        accepter_transit_gateway_attachment_id: Core::XMLValue.string(node.xpath_node("*[local-name()='accepterTransitGatewayAttachmentId']")),
        requester_tgw_info: node.xpath_node("*[local-name()='requesterTgwInfo']").try { |n| PeeringTgwInfo.from_xml(n) },
        accepter_tgw_info: node.xpath_node("*[local-name()='accepterTgwInfo']").try { |n| PeeringTgwInfo.from_xml(n) },
        options: node.xpath_node("*[local-name()='options']").try { |n| TransitGatewayPeeringAttachmentOptions.from_xml(n) },
        status: node.xpath_node("*[local-name()='status']").try { |n| PeeringAttachmentStatus.from_xml(n) },
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::TransitGatewayAttachmentState.from_json_object_key?(n.content) : nil,
        creation_time: Core::XMLValue.time(node.xpath_node("*[local-name()='creationTime']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @requester_tgw_info
        value.validate!
      end

      if value = @accepter_tgw_info
        value.validate!
      end

      if value = @options
        value.validate!
      end

      if value = @status
        value.validate!
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@transit_gateway_attachment_id, @accepter_transit_gateway_attachment_id, @requester_tgw_info, @accepter_tgw_info, @options, @status, @state, @creation_time, @tags)
  end
end
