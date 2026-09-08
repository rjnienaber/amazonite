private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the Transit Gateway configuration for a Client VPN endpoint.
  class TransitGatewayConfigurationDescribeEndpointStructure
    # The ID of the Transit Gateway.
    property transit_gateway_id : String | Nil

    # The ID of the Transit Gateway attachment.
    property transit_gateway_attachment_id : String | Nil

    # The Availability Zone names for the Transit Gateway association.
    property availability_zones : Array(String) | Nil

    # The Availability Zone IDs for the Transit Gateway association.
    property availability_zone_ids : Array(String) | Nil

    def initialize(
      @transit_gateway_id : String | Nil = nil,
      @transit_gateway_attachment_id : String | Nil = nil,
      @availability_zones : Array(String) | Nil = nil,
      @availability_zone_ids : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @transit_gateway_id
        params << {"#{prefix}TransitGatewayId", value}
      end

      if value = @transit_gateway_attachment_id
        params << {"#{prefix}TransitGatewayAttachmentId", value}
      end

      (@availability_zones || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}AvailabilityZoneSet.#{i}", item}
      end

      (@availability_zone_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}AvailabilityZoneIdSet.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayId']")),
        transit_gateway_attachment_id: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayAttachmentId']")),
        availability_zones: node.xpath_nodes("*[local-name()='availabilityZoneSet']/*[local-name()='item']").map { |n| n.content },
        availability_zone_ids: node.xpath_nodes("*[local-name()='availabilityZoneIdSet']/*[local-name()='item']").map { |n| n.content },
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@transit_gateway_id, @transit_gateway_attachment_id, @availability_zones, @availability_zone_ids)
  end
end
