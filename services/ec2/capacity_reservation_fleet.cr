private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Information about a Capacity Reservation Fleet.
  class CapacityReservationFleet
    # The ID of the Capacity Reservation Fleet.
    property capacity_reservation_fleet_id : String | Nil

    # The ARN of the Capacity Reservation Fleet.
    property capacity_reservation_fleet_arn : String | Nil

    # The state of the Capacity Reservation Fleet. Possible states include:
    #
    # - `submitted` - The Capacity Reservation Fleet request has been submitted and Amazon Elastic
    # Compute Cloud is preparing to create the Capacity Reservations.
    #
    # - `modifying` - The Capacity Reservation Fleet is being modified. The Fleet remains in this
    # state until the modification is complete.
    #
    # - `active` - The Capacity Reservation Fleet has fulfilled its total target capacity and it is
    # attempting to maintain this capacity. The Fleet remains in this state until it is modified or
    # deleted.
    #
    # - `partially_fulfilled` - The Capacity Reservation Fleet has partially fulfilled its total
    # target capacity. There is insufficient Amazon EC2 to fulfill the total target capacity. The
    # Fleet is attempting to asynchronously fulfill its total target capacity.
    #
    # - `expiring` - The Capacity Reservation Fleet has reach its end date and it is in the process of
    # expiring. One or more of its Capacity reservations might still be active.
    #
    # - `expired` - The Capacity Reservation Fleet has reach its end date. The Fleet and its Capacity
    # Reservations are expired. The Fleet can't create new Capacity Reservations.
    #
    # - `cancelling` - The Capacity Reservation Fleet is in the process of being cancelled. One or
    # more of its Capacity reservations might still be active.
    #
    # - `cancelled` - The Capacity Reservation Fleet has been manually cancelled. The Fleet and its
    # Capacity Reservations are cancelled and the Fleet can't create new Capacity Reservations.
    #
    # - `failed` - The Capacity Reservation Fleet failed to reserve capacity for the specified
    # instance types.
    property state : CapacityReservationFleetState | Nil

    # The total number of capacity units for which the Capacity Reservation Fleet reserves capacity.
    # For more information, see [Total target
    # capacity](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/crfleet-concepts.html#target-capacity)
    # in the *Amazon EC2 User Guide*.
    property total_target_capacity : Int32 | Nil

    # The capacity units that have been fulfilled.
    property total_fulfilled_capacity : Float64 | Nil

    # The tenancy of the Capacity Reservation Fleet. Tenancies include:
    #
    # - `default` - The Capacity Reservation Fleet is created on hardware that is shared with other
    # Amazon Web Services accounts.
    #
    # - `dedicated` - The Capacity Reservation Fleet is created on single-tenant hardware that is
    # dedicated to a single Amazon Web Services account.
    property tenancy : FleetCapacityReservationTenancy | Nil

    # The date and time at which the Capacity Reservation Fleet expires.
    property end_date : Time | Nil

    # The date and time at which the Capacity Reservation Fleet was created.
    property create_time : Time | Nil

    # Indicates the type of instance launches that the Capacity Reservation Fleet accepts. All
    # Capacity Reservations in the Fleet inherit this instance matching criteria.
    #
    # Currently, Capacity Reservation Fleets support `open` instance matching criteria only. This
    # means that instances that have matching attributes (instance type, platform, and Availability
    # Zone) run in the Capacity Reservations automatically. Instances do not need to explicitly target
    # a Capacity Reservation Fleet to use its reserved capacity.
    property instance_match_criteria : FleetInstanceMatchCriteria | Nil

    # The strategy used by the Capacity Reservation Fleet to determine which of the specified instance
    # types to use. For more information, see For more information, see [Allocation
    # strategy](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/crfleet-concepts.html#allocation-strategy)
    # in the *Amazon EC2 User Guide*.
    property allocation_strategy : String | Nil

    # Information about the instance types for which to reserve the capacity.
    property instance_type_specifications : Array(FleetCapacityReservation) | Nil

    # The tags assigned to the Capacity Reservation Fleet.
    property tags : Array(Tag) | Nil

    def initialize(
      @capacity_reservation_fleet_id : String | Nil = nil,
      @capacity_reservation_fleet_arn : String | Nil = nil,
      @state : CapacityReservationFleetState | Nil = nil,
      @total_target_capacity : Int32 | Nil = nil,
      @total_fulfilled_capacity : Float64 | Nil = nil,
      @tenancy : FleetCapacityReservationTenancy | Nil = nil,
      @end_date : Time | Nil = nil,
      @create_time : Time | Nil = nil,
      @instance_match_criteria : FleetInstanceMatchCriteria | Nil = nil,
      @allocation_strategy : String | Nil = nil,
      @instance_type_specifications : Array(FleetCapacityReservation) | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @capacity_reservation_fleet_id
        params << {"#{prefix}CapacityReservationFleetId", value}
      end

      if value = @capacity_reservation_fleet_arn
        params << {"#{prefix}CapacityReservationFleetArn", value}
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

      if value = @tenancy
        params << {"#{prefix}Tenancy", value.to_json_object_key}
      end

      if value = @end_date
        params << {"#{prefix}EndDate", Core::QueryValue.time(value)}
      end

      if value = @create_time
        params << {"#{prefix}CreateTime", Core::QueryValue.time(value)}
      end

      if value = @instance_match_criteria
        params << {"#{prefix}InstanceMatchCriteria", value.to_json_object_key}
      end

      if value = @allocation_strategy
        params << {"#{prefix}AllocationStrategy", value}
      end

      (@instance_type_specifications || [] of FleetCapacityReservation).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}InstanceTypeSpecificationSet.#{i}."))
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        capacity_reservation_fleet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='capacityReservationFleetId']")),
        capacity_reservation_fleet_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='capacityReservationFleetArn']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::CapacityReservationFleetState.from_json_object_key?(n.content) : nil,
        total_target_capacity: Core::XMLValue.i32(node.xpath_node("*[local-name()='totalTargetCapacity']")),
        total_fulfilled_capacity: Core::XMLValue.f64(node.xpath_node("*[local-name()='totalFulfilledCapacity']")),
        tenancy: (n = node.xpath_node("*[local-name()='tenancy']")) ? AEC::FleetCapacityReservationTenancy.from_json_object_key?(n.content) : nil,
        end_date: Core::XMLValue.time(node.xpath_node("*[local-name()='endDate']")),
        create_time: Core::XMLValue.time(node.xpath_node("*[local-name()='createTime']")),
        instance_match_criteria: (n = node.xpath_node("*[local-name()='instanceMatchCriteria']")) ? AEC::FleetInstanceMatchCriteria.from_json_object_key?(n.content) : nil,
        allocation_strategy: Core::XMLValue.string(node.xpath_node("*[local-name()='allocationStrategy']")),
        instance_type_specifications: node.xpath_nodes("*[local-name()='instanceTypeSpecificationSet']/*[local-name()='item']").map { |n| FleetCapacityReservation.from_xml(n) },
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @instance_type_specifications
        value.each(&.validate!)
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@capacity_reservation_fleet_id, @capacity_reservation_fleet_arn, @state, @total_target_capacity, @total_fulfilled_capacity, @tenancy, @end_date, @create_time, @instance_match_criteria, @allocation_strategy, @instance_type_specifications, @tags)
  end
end
