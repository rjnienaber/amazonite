private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Defines EC2 Fleet preferences for utilizing reserved capacity when `DefaultTargetCapacityType`
  # is set to `reserved-capacity`. EC2 Fleet can fulfill reserved capacity using On-Demand Capacity
  # Reservations, Capacity Blocks for ML, and interruptible Capacity Reservations.
  #
  # This configuration can only be used if the EC2 Fleet is of type `instant`.
  #
  # When you specify `ReservedCapacityOptions`, you must also set `DefaultTargetCapacityType` to
  # `reserved-capacity` in the `TargetCapacitySpecification`.
  #
  # For more information about interruptible Capacity Reservations, see [Launch instances into an
  # interruptible Capacity
  # Reservation](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-fleet-launch-instances-interruptible-cr-walkthrough.html)
  # in the *Amazon EC2 User Guide*.
  class ReservedCapacityOptionsRequest
    # The strategy that determines the order in which EC2 Fleet launches instances across the
    # reservation types that you specify. The only supported value is `prioritized`, which launches
    # instances in the priority order that you specify in your launch template overrides. If you don't
    # specify an allocation strategy, instances are launched in a random order.
    property allocation_strategy : ReservedCapacityAllocationStrategy | Nil

    # The types of Capacity Reservations to use for fulfilling the EC2 Fleet request. This is an
    # ordered list: EC2 Fleet attempts to launch instances into each Capacity Reservation type in the
    # order that you specify them before moving on to the next type.
    property reservation_types : Array(FleetReservationType) | Nil

    # The Capacity Reservations or Capacity Reservation Resource Groups to use for fulfilling the EC2
    # Fleet request. You can specify Capacity Reservation IDs or a Capacity Reservation Resource Group
    # ARN, but not both.
    property capacity_reservation_target : FleetCapacityReservationTargetRequest | Nil

    # The fallback behavior for the EC2 Fleet when there is not enough reserved capacity available to
    # meet the target capacity. This member takes a `ReservedCapacityFallbackOptionsRequest`
    # structure, in which you set `MarketTypes` to the instance purchasing options to fall back to.
    property reserved_capacity_fallback_options : ReservedCapacityFallbackOptionsRequest | Nil

    def initialize(
      @allocation_strategy : ReservedCapacityAllocationStrategy | Nil = nil,
      @reservation_types : Array(FleetReservationType) | Nil = nil,
      @capacity_reservation_target : FleetCapacityReservationTargetRequest | Nil = nil,
      @reserved_capacity_fallback_options : ReservedCapacityFallbackOptionsRequest | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @allocation_strategy
        params << {"#{prefix}AllocationStrategy", value.to_json_object_key}
      end

      (@reservation_types || [] of FleetReservationType).each_with_index(1) do |item, i|
        params << {"#{prefix}ReservationType.#{i}", item.to_json_object_key}
      end

      if value = @capacity_reservation_target
        params.concat(value.to_query_params("#{prefix}CapacityReservationTarget."))
      end

      if value = @reserved_capacity_fallback_options
        params.concat(value.to_query_params("#{prefix}ReservedCapacityFallbackOptions."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        allocation_strategy: (n = node.xpath_node("*[local-name()='AllocationStrategy']")) ? AEC::ReservedCapacityAllocationStrategy.from_json_object_key?(n.content) : nil,
        reservation_types: node.xpath_nodes("*[local-name()='ReservationType']/*[local-name()='ReservationType']").compact_map { |n| AEC::FleetReservationType.from_json_object_key?(n.content) },
        capacity_reservation_target: node.xpath_node("*[local-name()='CapacityReservationTarget']").try { |n| FleetCapacityReservationTargetRequest.from_xml(n) },
        reserved_capacity_fallback_options: node.xpath_node("*[local-name()='ReservedCapacityFallbackOptions']").try { |n| ReservedCapacityFallbackOptionsRequest.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @capacity_reservation_target
        value.validate!
      end

      if value = @reserved_capacity_fallback_options
        value.validate!
      end
    end

    def_equals_and_hash(@allocation_strategy, @reservation_types, @capacity_reservation_target, @reserved_capacity_fallback_options)
  end
end
