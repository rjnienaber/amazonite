private alias Core = Amazonite::Core

module Amazonite::EC2
  # Information about the transit gateway in the peering attachment.
  class PeeringTgwInfo
    # The ID of the transit gateway.
    property transit_gateway_id : String | Nil

    # The ID of the core network where the transit gateway peer is located.
    property core_network_id : String | Nil

    # The ID of the Amazon Web Services account that owns the transit gateway.
    property owner_id : String | Nil

    # The Region of the transit gateway.
    property region : String | Nil

    def initialize(
      @transit_gateway_id : String | Nil = nil,
      @core_network_id : String | Nil = nil,
      @owner_id : String | Nil = nil,
      @region : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @transit_gateway_id
        params << {"#{prefix}TransitGatewayId", value}
      end

      if value = @core_network_id
        params << {"#{prefix}CoreNetworkId", value}
      end

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end

      if value = @region
        params << {"#{prefix}Region", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayId']")),
        core_network_id: Core::XMLValue.string(node.xpath_node("*[local-name()='coreNetworkId']")),
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        region: Core::XMLValue.string(node.xpath_node("*[local-name()='region']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@transit_gateway_id, @core_network_id, @owner_id, @region)
  end
end
