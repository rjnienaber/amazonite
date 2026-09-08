private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Information about a Capacity Reservation.
  class CapacityReservationInfo
    # The instance type for the Capacity Reservation.
    property instance_type : String | Nil

    # The Availability Zone for the Capacity Reservation.
    property availability_zone : String | Nil

    # The tenancy of the Capacity Reservation.
    property tenancy : CapacityReservationTenancy | Nil

    # The ID of the Availability Zone.
    property availability_zone_id : String | Nil

    def initialize(
      @instance_type : String | Nil = nil,
      @availability_zone : String | Nil = nil,
      @tenancy : CapacityReservationTenancy | Nil = nil,
      @availability_zone_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @instance_type
        params << {"#{prefix}InstanceType", value}
      end

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
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
        instance_type: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceType']")),
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZone']")),
        tenancy: (n = node.xpath_node("*[local-name()='tenancy']")) ? AEC::CapacityReservationTenancy.from_json_object_key?(n.content) : nil,
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZoneId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@instance_type, @availability_zone, @tenancy, @availability_zone_id)
  end
end
