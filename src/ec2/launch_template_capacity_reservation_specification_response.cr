private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Information about the Capacity Reservation targeting option.
  class LaunchTemplateCapacityReservationSpecificationResponse
    # Indicates the instance's Capacity Reservation preferences. Possible preferences include:
    #
    # - `open` - The instance can run in any `open` Capacity Reservation that has matching attributes
    # (instance type, platform, Availability Zone).
    #
    # - `none` - The instance avoids running in a Capacity Reservation even if one is available. The
    # instance runs in On-Demand capacity.
    property capacity_reservation_preference : CapacityReservationPreference | Nil

    # Information about the target Capacity Reservation or Capacity Reservation group.
    property capacity_reservation_target : CapacityReservationTargetResponse | Nil

    def initialize(
      @capacity_reservation_preference : CapacityReservationPreference | Nil = nil,
      @capacity_reservation_target : CapacityReservationTargetResponse | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @capacity_reservation_preference
        params << {"#{prefix}CapacityReservationPreference", value.to_json_object_key}
      end

      if value = @capacity_reservation_target
        params.concat(value.to_query_params("#{prefix}CapacityReservationTarget."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        capacity_reservation_preference: (n = node.xpath_node("*[local-name()='capacityReservationPreference']")) ? AEC::CapacityReservationPreference.from_json_object_key?(n.content) : nil,
        capacity_reservation_target: node.xpath_node("*[local-name()='capacityReservationTarget']").try { |n| CapacityReservationTargetResponse.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @capacity_reservation_target
        value.validate!
      end
    end

    def_equals_and_hash(@capacity_reservation_preference, @capacity_reservation_target)
  end
end
