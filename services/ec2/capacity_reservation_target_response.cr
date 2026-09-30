private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a target Capacity Reservation or Capacity Reservation group.
  class CapacityReservationTargetResponse
    # The ID of the targeted Capacity Reservation.
    property capacity_reservation_id : String | Nil

    # The ARN of the targeted Capacity Reservation group.
    property capacity_reservation_resource_group_arn : String | Nil

    def initialize(
      @capacity_reservation_id : String | Nil = nil,
      @capacity_reservation_resource_group_arn : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @capacity_reservation_id
        params << {"#{prefix}CapacityReservationId", value}
      end

      if value = @capacity_reservation_resource_group_arn
        params << {"#{prefix}CapacityReservationResourceGroupArn", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        capacity_reservation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='capacityReservationId']")),
        capacity_reservation_resource_group_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='capacityReservationResourceGroupArn']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@capacity_reservation_id, @capacity_reservation_resource_group_arn)
  end
end
