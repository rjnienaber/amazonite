private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes Spot Instance placement.
  class SpotPlacement
    # The Availability Zone. For example, `us-east-2a`.
    #
    # [Spot Fleet only] To specify multiple Availability Zones, separate them using commas; for
    # example, "`us-east-2a`, `us-east-2b`".
    #
    # Either `AvailabilityZone` or `AvailabilityZoneId` must be specified in the request, but not
    # both.
    property availability_zone : String | Nil

    # The name of the placement group.
    property group_name : String | Nil

    # The tenancy of the instance (if the instance is running in a VPC). An instance with a tenancy of
    # `dedicated` runs on single-tenant hardware. The `host` tenancy is not supported for Spot
    # Instances.
    property tenancy : Tenancy | Nil

    # The ID of the Availability Zone. For example, `use2-az1`.
    #
    # [Spot Fleet only] To specify multiple Availability Zones, separate them using commas; for
    # example, "`use2-az1`, `use2-bz1`".
    #
    # Either `AvailabilityZone` or `AvailabilityZoneId` must be specified in the request, but not
    # both.
    property availability_zone_id : String | Nil

    def initialize(
      @availability_zone : String | Nil = nil,
      @group_name : String | Nil = nil,
      @tenancy : Tenancy | Nil = nil,
      @availability_zone_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end

      if value = @group_name
        params << {"#{prefix}GroupName", value}
      end

      if value = @tenancy
        params << {"#{prefix}Tenancy", value.to_json_object_key}
      end

      if value = @availability_zone_id
        params << {"#{prefix}AvailabilityZoneId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZone']")),
        group_name: Core::XMLValue.string(node.xpath_node("*[local-name()='groupName']")),
        tenancy: (n = node.xpath_node("*[local-name()='tenancy']")) ? AEC::Tenancy.from_json_object_key?(n.content) : nil,
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZoneId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@availability_zone, @group_name, @tenancy, @availability_zone_id)
  end
end
