private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an instance's Capacity Reservation targeting option.
  #
  # Use the `CapacityReservationPreference` parameter to configure the instance to run as an
  # On-Demand Instance, to run in any `open` Capacity Reservation that has matching attributes, or
  # to run only in a Capacity Reservation or Capacity Reservation group. Use the
  # `CapacityReservationTarget` parameter to explicitly target a specific Capacity Reservation or a
  # Capacity Reservation group.
  #
  # You can only specify `CapacityReservationPreference` and `CapacityReservationTarget` if the
  # `CapacityReservationPreference` is `capacity-reservations-only`.
  class CapacityReservationSpecification
    # Indicates the instance's Capacity Reservation preferences. Possible preferences include:
    #
    # - `capacity-reservations-only` - The instance will only run in a Capacity Reservation or
    # Capacity Reservation group. If capacity isn't available, the instance will fail to launch.
    #
    # - `open` - The instance can run in any `open` Capacity Reservation that has matching attributes
    # (instance type, platform, Availability Zone, and tenancy). If capacity isn't available, the
    # instance runs as an On-Demand Instance.
    #
    # - `none` - The instance doesn't run in a Capacity Reservation even if one is available. The
    # instance runs as an On-Demand Instance.
    property capacity_reservation_preference : CapacityReservationPreference | Nil

    # Information about the target Capacity Reservation or Capacity Reservation group.
    property capacity_reservation_target : CapacityReservationTarget | Nil

    def initialize(
      @capacity_reservation_preference : CapacityReservationPreference | Nil = nil,
      @capacity_reservation_target : CapacityReservationTarget | Nil = nil,
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
        capacity_reservation_preference: (n = node.xpath_node("*[local-name()='CapacityReservationPreference']")) ? AEC::CapacityReservationPreference.from_json_object_key?(n.content) : nil,
        capacity_reservation_target: node.xpath_node("*[local-name()='CapacityReservationTarget']").try { |n| CapacityReservationTarget.from_xml(n) },
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
