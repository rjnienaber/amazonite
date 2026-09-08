private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a local gateway.
  class LocalGateway
    # The ID of the local gateway.
    property local_gateway_id : String | Nil

    # The Amazon Resource Name (ARN) of the Outpost.
    property outpost_arn : String | Nil

    # The ID of the Amazon Web Services account that owns the local gateway.
    property owner_id : String | Nil

    # The state of the local gateway.
    property state : String | Nil

    # The tags assigned to the local gateway.
    property tags : Array(Tag) | Nil

    def initialize(
      @local_gateway_id : String | Nil = nil,
      @outpost_arn : String | Nil = nil,
      @owner_id : String | Nil = nil,
      @state : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @local_gateway_id
        params << {"#{prefix}LocalGatewayId", value}
      end

      if value = @outpost_arn
        params << {"#{prefix}OutpostArn", value}
      end

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end

      if value = @state
        params << {"#{prefix}State", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        local_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='localGatewayId']")),
        outpost_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='outpostArn']")),
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        state: Core::XMLValue.string(node.xpath_node("*[local-name()='state']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@local_gateway_id, @outpost_arn, @owner_id, @state, @tags)
  end
end
