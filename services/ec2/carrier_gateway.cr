private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a carrier gateway.
  class CarrierGateway
    # The ID of the carrier gateway.
    property carrier_gateway_id : String | Nil

    # The ID of the VPC associated with the carrier gateway.
    property vpc_id : String | Nil

    # The state of the carrier gateway.
    property state : CarrierGatewayState | Nil

    # The Amazon Web Services account ID of the owner of the carrier gateway.
    property owner_id : String | Nil

    # The tags assigned to the carrier gateway.
    property tags : Array(Tag) | Nil

    def initialize(
      @carrier_gateway_id : String | Nil = nil,
      @vpc_id : String | Nil = nil,
      @state : CarrierGatewayState | Nil = nil,
      @owner_id : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @carrier_gateway_id
        params << {"#{prefix}CarrierGatewayId", value}
      end

      if value = @vpc_id
        params << {"#{prefix}VpcId", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        carrier_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='carrierGatewayId']")),
        vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcId']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::CarrierGatewayState.from_json_object_key?(n.content) : nil,
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@carrier_gateway_id, @vpc_id, @state, @owner_id, @tags)
  end
end
