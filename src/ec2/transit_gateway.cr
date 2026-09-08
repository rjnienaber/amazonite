private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a transit gateway.
  class TransitGateway
    # The ID of the transit gateway.
    property transit_gateway_id : String | Nil

    # The Amazon Resource Name (ARN) of the transit gateway.
    property transit_gateway_arn : String | Nil

    # The state of the transit gateway.
    property state : TransitGatewayState | Nil

    # The ID of the Amazon Web Services account that owns the transit gateway.
    property owner_id : String | Nil

    # The description of the transit gateway.
    property description : String | Nil

    # The creation time.
    property creation_time : Time | Nil

    # The transit gateway options.
    property options : TransitGatewayOptions | Nil

    # The tags for the transit gateway.
    property tags : Array(Tag) | Nil

    def initialize(
      @transit_gateway_id : String | Nil = nil,
      @transit_gateway_arn : String | Nil = nil,
      @state : TransitGatewayState | Nil = nil,
      @owner_id : String | Nil = nil,
      @description : String | Nil = nil,
      @creation_time : Time | Nil = nil,
      @options : TransitGatewayOptions | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @transit_gateway_id
        params << {"#{prefix}TransitGatewayId", value}
      end

      if value = @transit_gateway_arn
        params << {"#{prefix}TransitGatewayArn", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
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
        transit_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayId']")),
        transit_gateway_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayArn']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::TransitGatewayState.from_json_object_key?(n.content) : nil,
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        creation_time: Core::XMLValue.time(node.xpath_node("*[local-name()='creationTime']")),
        options: node.xpath_node("*[local-name()='options']").try { |n| TransitGatewayOptions.from_xml(n) },
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

    def_equals_and_hash(@transit_gateway_id, @transit_gateway_arn, @state, @owner_id, @description, @creation_time, @options, @tags)
  end
end
