private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Defines EC2 Fleet preferences for utilizing reserved capacity when `DefaultTargetCapacityType`
  # is set to `reserved-capacity`. EC2 Fleet can fulfill reserved capacity using On-Demand Capacity
  # Reservations, Capacity Blocks for ML, and interruptible Capacity Reservations.
  class ReservedCapacityOptions
    # The strategy that determines the order in which EC2 Fleet launches instances across the
    # reservation types that you specify. The only supported value is `prioritized`, which launches
    # instances in the priority order that you specify in your launch template overrides. If you don't
    # specify an allocation strategy, instances are launched in a random order.
    property allocation_strategy : ReservedCapacityAllocationStrategy | Nil

    # The types of Capacity Reservations used for fulfilling the EC2 Fleet request.
    property reservation_types : Array(FleetReservationType) | Nil

    # The fallback behavior for the EC2 Fleet when there is not enough reserved capacity available to
    # meet the target capacity.
    property reserved_capacity_fallback_options : ReservedCapacityFallbackOptions | Nil

    def initialize(
      @allocation_strategy : ReservedCapacityAllocationStrategy | Nil = nil,
      @reservation_types : Array(FleetReservationType) | Nil = nil,
      @reserved_capacity_fallback_options : ReservedCapacityFallbackOptions | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @allocation_strategy
        params << {"#{prefix}AllocationStrategy", value.to_json_object_key}
      end

      (@reservation_types || [] of FleetReservationType).each_with_index(1) do |item, i|
        params << {"#{prefix}ReservationTypeSet.#{i}", item.to_json_object_key}
      end

      if value = @reserved_capacity_fallback_options
        params.concat(value.to_query_params("#{prefix}ReservedCapacityFallbackOptions."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        allocation_strategy: (n = node.xpath_node("*[local-name()='allocationStrategy']")) ? AEC::ReservedCapacityAllocationStrategy.from_json_object_key?(n.content) : nil,
        reservation_types: node.xpath_nodes("*[local-name()='reservationTypeSet']/*[local-name()='item']").compact_map { |n| AEC::FleetReservationType.from_json_object_key?(n.content) },
        reserved_capacity_fallback_options: node.xpath_node("*[local-name()='reservedCapacityFallbackOptions']").try { |n| ReservedCapacityFallbackOptions.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @reserved_capacity_fallback_options
        value.validate!
      end
    end

    def_equals_and_hash(@allocation_strategy, @reservation_types, @reserved_capacity_fallback_options)
  end
end
