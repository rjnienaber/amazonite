private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyTransitGatewayNetworkFunctionAttachmentRequest
    # The ID of the network function attachment.
    property transit_gateway_attachment_id : String

    # The names of the Availability Zones to add to the attachment. You can't add and remove the same
    # Availability Zone in a single request.
    property add_availability_zones : Array(String) | Nil

    # The IDs of the Availability Zones to add to the attachment. You can't add and remove the same
    # Availability Zone in a single request.
    property add_availability_zone_ids : Array(String) | Nil

    # The names of the Availability Zones to remove from the attachment. Each Availability Zone must
    # be currently in the attachment.
    property remove_availability_zones : Array(String) | Nil

    # The IDs of the Availability Zones to remove from the attachment. Each Availability Zone must be
    # currently in the attachment.
    property remove_availability_zone_ids : Array(String) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @transit_gateway_attachment_id : String,
      @add_availability_zones : Array(String) | Nil = nil,
      @add_availability_zone_ids : Array(String) | Nil = nil,
      @remove_availability_zones : Array(String) | Nil = nil,
      @remove_availability_zone_ids : Array(String) | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}TransitGatewayAttachmentId", @transit_gateway_attachment_id}

      (@add_availability_zones || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}AddAvailabilityZone.#{i}", item}
      end

      (@add_availability_zone_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}AddAvailabilityZoneId.#{i}", item}
      end

      (@remove_availability_zones || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}RemoveAvailabilityZone.#{i}", item}
      end

      (@remove_availability_zone_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}RemoveAvailabilityZoneId.#{i}", item}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_attachment_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TransitGatewayAttachmentId']")).not_nil!,
        add_availability_zones: node.xpath_nodes("*[local-name()='AddAvailabilityZone']/*[local-name()='item']").map { |n| n.content },
        add_availability_zone_ids: node.xpath_nodes("*[local-name()='AddAvailabilityZoneId']/*[local-name()='item']").map { |n| n.content },
        remove_availability_zones: node.xpath_nodes("*[local-name()='RemoveAvailabilityZone']/*[local-name()='item']").map { |n| n.content },
        remove_availability_zone_ids: node.xpath_nodes("*[local-name()='RemoveAvailabilityZoneId']/*[local-name()='item']").map { |n| n.content },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@transit_gateway_attachment_id, @add_availability_zones, @add_availability_zone_ids, @remove_availability_zones, @remove_availability_zone_ids, @dry_run)
  end
end
