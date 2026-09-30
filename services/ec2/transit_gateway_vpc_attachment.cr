private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a VPC attachment.
  class TransitGatewayVpcAttachment
    # The ID of the attachment.
    property transit_gateway_attachment_id : String | Nil

    # The ID of the transit gateway.
    property transit_gateway_id : String | Nil

    # The ID of the VPC.
    property vpc_id : String | Nil

    # The ID of the Amazon Web Services account that owns the VPC.
    property vpc_owner_id : String | Nil

    # The state of the VPC attachment. Note that the `initiating` state has been deprecated.
    property state : TransitGatewayAttachmentState | Nil

    # The IDs of the subnets.
    property subnet_ids : Array(String) | Nil

    # The creation time.
    property creation_time : Time | Nil

    # The VPC attachment options.
    property options : TransitGatewayVpcAttachmentOptions | Nil

    # The tags for the VPC attachment.
    property tags : Array(Tag) | Nil

    def initialize(
      @transit_gateway_attachment_id : String | Nil = nil,
      @transit_gateway_id : String | Nil = nil,
      @vpc_id : String | Nil = nil,
      @vpc_owner_id : String | Nil = nil,
      @state : TransitGatewayAttachmentState | Nil = nil,
      @subnet_ids : Array(String) | Nil = nil,
      @creation_time : Time | Nil = nil,
      @options : TransitGatewayVpcAttachmentOptions | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @transit_gateway_attachment_id
        params << {"#{prefix}TransitGatewayAttachmentId", value}
      end

      if value = @transit_gateway_id
        params << {"#{prefix}TransitGatewayId", value}
      end

      if value = @vpc_id
        params << {"#{prefix}VpcId", value}
      end

      if value = @vpc_owner_id
        params << {"#{prefix}VpcOwnerId", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      (@subnet_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}SubnetIds.#{i}", item}
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
        transit_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayId']")),
        vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcId']")),
        vpc_owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcOwnerId']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::TransitGatewayAttachmentState.from_json_object_key?(n.content) : nil,
        subnet_ids: node.xpath_nodes("*[local-name()='subnetIds']/*[local-name()='item']").map { |n| n.content },
        creation_time: Core::XMLValue.time(node.xpath_node("*[local-name()='creationTime']")),
        options: node.xpath_node("*[local-name()='options']").try { |n| TransitGatewayVpcAttachmentOptions.from_xml(n) },
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

    def_equals_and_hash(@transit_gateway_attachment_id, @transit_gateway_id, @vpc_id, @vpc_owner_id, @state, @subnet_ids, @creation_time, @options, @tags)
  end
end
