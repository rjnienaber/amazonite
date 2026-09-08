private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateCapacityReservationFleetResult
    # The ID of the Capacity Reservation Fleet.
    property capacity_reservation_fleet_id : String | Nil

    # The status of the Capacity Reservation Fleet.
    property state : CapacityReservationFleetState | Nil

    # The total number of capacity units for which the Capacity Reservation Fleet reserves capacity.
    property total_target_capacity : Int32 | Nil

    # The requested capacity units that have been successfully reserved.
    property total_fulfilled_capacity : Float64 | Nil

    # The instance matching criteria for the Capacity Reservation Fleet.
    property instance_match_criteria : FleetInstanceMatchCriteria | Nil

    # The allocation strategy used by the Capacity Reservation Fleet.
    property allocation_strategy : String | Nil

    # The date and time at which the Capacity Reservation Fleet was created.
    property create_time : Time | Nil

    # The date and time at which the Capacity Reservation Fleet expires.
    property end_date : Time | Nil

    # Indicates the tenancy of Capacity Reservation Fleet.
    property tenancy : FleetCapacityReservationTenancy | Nil

    # Information about the individual Capacity Reservations in the Capacity Reservation Fleet.
    property fleet_capacity_reservations : Array(FleetCapacityReservation) | Nil

    # The tags assigned to the Capacity Reservation Fleet.
    property tags : Array(Tag) | Nil

    def initialize(
      @capacity_reservation_fleet_id : String | Nil = nil,
      @state : CapacityReservationFleetState | Nil = nil,
      @total_target_capacity : Int32 | Nil = nil,
      @total_fulfilled_capacity : Float64 | Nil = nil,
      @instance_match_criteria : FleetInstanceMatchCriteria | Nil = nil,
      @allocation_strategy : String | Nil = nil,
      @create_time : Time | Nil = nil,
      @end_date : Time | Nil = nil,
      @tenancy : FleetCapacityReservationTenancy | Nil = nil,
      @fleet_capacity_reservations : Array(FleetCapacityReservation) | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @capacity_reservation_fleet_id
        params << {"#{prefix}CapacityReservationFleetId", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @total_target_capacity
        params << {"#{prefix}TotalTargetCapacity", value.to_s}
      end

      if value = @total_fulfilled_capacity
        params << {"#{prefix}TotalFulfilledCapacity", value.to_s}
      end

      if value = @instance_match_criteria
        params << {"#{prefix}InstanceMatchCriteria", value.to_json_object_key}
      end

      if value = @allocation_strategy
        params << {"#{prefix}AllocationStrategy", value}
      end

      if value = @create_time
        params << {"#{prefix}CreateTime", Core::QueryValue.time(value)}
      end

      if value = @end_date
        params << {"#{prefix}EndDate", Core::QueryValue.time(value)}
      end

      if value = @tenancy
        params << {"#{prefix}Tenancy", value.to_json_object_key}
      end

      (@fleet_capacity_reservations || [] of FleetCapacityReservation).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}FleetCapacityReservationSet.#{i}."))
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        capacity_reservation_fleet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='capacityReservationFleetId']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::CapacityReservationFleetState.from_json_object_key?(n.content) : nil,
        total_target_capacity: Core::XMLValue.i32(node.xpath_node("*[local-name()='totalTargetCapacity']")),
        total_fulfilled_capacity: Core::XMLValue.f64(node.xpath_node("*[local-name()='totalFulfilledCapacity']")),
        instance_match_criteria: (n = node.xpath_node("*[local-name()='instanceMatchCriteria']")) ? AEC::FleetInstanceMatchCriteria.from_json_object_key?(n.content) : nil,
        allocation_strategy: Core::XMLValue.string(node.xpath_node("*[local-name()='allocationStrategy']")),
        create_time: Core::XMLValue.time(node.xpath_node("*[local-name()='createTime']")),
        end_date: Core::XMLValue.time(node.xpath_node("*[local-name()='endDate']")),
        tenancy: (n = node.xpath_node("*[local-name()='tenancy']")) ? AEC::FleetCapacityReservationTenancy.from_json_object_key?(n.content) : nil,
        fleet_capacity_reservations: node.xpath_nodes("*[local-name()='fleetCapacityReservationSet']/*[local-name()='item']").map { |n| FleetCapacityReservation.from_xml(n) },
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @fleet_capacity_reservations
        value.each(&.validate!)
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@capacity_reservation_fleet_id, @state, @total_target_capacity, @total_fulfilled_capacity, @instance_match_criteria, @allocation_strategy, @create_time, @end_date, @tenancy, @fleet_capacity_reservations, @tags)
  end
end
