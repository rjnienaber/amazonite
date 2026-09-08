private alias Core = Amazonite::Core

module Amazonite::EC2
  # The Transit Gateway configuration for a Client VPN endpoint.
  class TransitGatewayConfigurationInputStructure
    # The ID of the Transit Gateway to associate with the Client VPN endpoint.
    property transit_gateway_id : String | Nil

    # The Availability Zone names for the Transit Gateway association. You can specify up to the
    # maximum number of Availability Zones supported by the Transit Gateway. You cannot specify both
    # `AvailabilityZones` and `AvailabilityZoneIds`.
    property availability_zones : Array(String) | Nil

    # The Availability Zone IDs for the Transit Gateway association. You can specify up to the maximum
    # number of Availability Zones supported by the Transit Gateway. You cannot specify both
    # `AvailabilityZones` and `AvailabilityZoneIds`.
    property availability_zone_ids : Array(String) | Nil

    def initialize(
      @transit_gateway_id : String | Nil = nil,
      @availability_zones : Array(String) | Nil = nil,
      @availability_zone_ids : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @transit_gateway_id
        params << {"#{prefix}TransitGatewayId", value}
      end

      (@availability_zones || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}AvailabilityZone.#{i}", item}
      end

      (@availability_zone_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}AvailabilityZoneId.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TransitGatewayId']")),
        availability_zones: node.xpath_nodes("*[local-name()='AvailabilityZone']/*[local-name()='item']").map { |n| n.content },
        availability_zone_ids: node.xpath_nodes("*[local-name()='AvailabilityZoneId']/*[local-name()='item']").map { |n| n.content },
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@transit_gateway_id, @availability_zones, @availability_zone_ids)
  end
end
