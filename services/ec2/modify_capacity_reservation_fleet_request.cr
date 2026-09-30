private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyCapacityReservationFleetRequest
    # The ID of the Capacity Reservation Fleet to modify.
    property capacity_reservation_fleet_id : String

    # The total number of capacity units to be reserved by the Capacity Reservation Fleet. This value,
    # together with the instance type weights that you assign to each instance type used by the Fleet
    # determine the number of instances for which the Fleet reserves capacity. Both values are based
    # on units that make sense for your workload. For more information, see [Total target
    # capacity](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/crfleet-concepts.html#target-capacity)
    # in the *Amazon EC2 User Guide*.
    property total_target_capacity : Int32 | Nil

    # The date and time at which the Capacity Reservation Fleet expires. When the Capacity Reservation
    # Fleet expires, its state changes to `expired` and all of the Capacity Reservations in the Fleet
    # expire.
    #
    # The Capacity Reservation Fleet expires within an hour after the specified time. For example, if
    # you specify `5/31/2019`, `13:30:55`, the Capacity Reservation Fleet is guaranteed to expire
    # between `13:30:55` and `14:30:55` on `5/31/2019`.
    #
    # You can't specify **EndDate** and ** RemoveEndDate** in the same request.
    property end_date : Time | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # Indicates whether to remove the end date from the Capacity Reservation Fleet. If you remove the
    # end date, the Capacity Reservation Fleet does not expire and it remains active until you
    # explicitly cancel it using the **CancelCapacityReservationFleet** action.
    #
    # You can't specify **RemoveEndDate** and ** EndDate** in the same request.
    property remove_end_date : Bool | Nil

    def initialize(
      @capacity_reservation_fleet_id : String,
      @total_target_capacity : Int32 | Nil = nil,
      @end_date : Time | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @remove_end_date : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}CapacityReservationFleetId", @capacity_reservation_fleet_id}

      if value = @total_target_capacity
        params << {"#{prefix}TotalTargetCapacity", value.to_s}
      end

      if value = @end_date
        params << {"#{prefix}EndDate", Core::QueryValue.time(value)}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @remove_end_date
        params << {"#{prefix}RemoveEndDate", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        capacity_reservation_fleet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='CapacityReservationFleetId']")).not_nil!,
        total_target_capacity: Core::XMLValue.i32(node.xpath_node("*[local-name()='TotalTargetCapacity']")),
        end_date: Core::XMLValue.time(node.xpath_node("*[local-name()='EndDate']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        remove_end_date: Core::XMLValue.bool(node.xpath_node("*[local-name()='RemoveEndDate']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@capacity_reservation_fleet_id, @total_target_capacity, @end_date, @dry_run, @remove_end_date)
  end
end
