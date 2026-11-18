private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateTransitGatewayNetworkFunctionAttachmentRequest
    # The ID of the transit gateway. The transit gateway must be in the `available` state.
    property transit_gateway_id : String

    # The name of the Gateway Load Balancer endpoint service.
    property service_name : String

    # The names of the Availability Zones for the attachment. You must specify at least one
    # Availability Zone, using this parameter, `AvailabilityZoneIds`, or both. Each Availability Zone
    # must be supported by both the transit gateway and the endpoint service.
    property availability_zones : Array(String) | Nil

    # The IDs of the Availability Zones for the attachment. You must specify at least one Availability
    # Zone, using this parameter, `AvailabilityZones`, or both. Each Availability Zone must be
    # supported by both the transit gateway and the endpoint service.
    property availability_zone_ids : Array(String) | Nil

    # The tags to apply to the network function attachment.
    property tag_specifications : Array(TagSpecification) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @transit_gateway_id : String,
      @service_name : String,
      @availability_zones : Array(String) | Nil = nil,
      @availability_zone_ids : Array(String) | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}TransitGatewayId", @transit_gateway_id}

      params << {"#{prefix}ServiceName", @service_name}

      (@availability_zones || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}AvailabilityZone.#{i}", item}
      end

      (@availability_zone_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}AvailabilityZoneId.#{i}", item}
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TransitGatewayId']")).not_nil!,
        service_name: Core::XMLValue.string(node.xpath_node("*[local-name()='ServiceName']")).not_nil!,
        availability_zones: node.xpath_nodes("*[local-name()='AvailabilityZone']/*[local-name()='item']").map { |n| n.content },
        availability_zone_ids: node.xpath_nodes("*[local-name()='AvailabilityZoneId']/*[local-name()='item']").map { |n| n.content },
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@transit_gateway_id, @service_name, @availability_zones, @availability_zone_ids, @tag_specifications, @dry_run)
  end
end
