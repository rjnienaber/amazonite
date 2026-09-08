private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the configuration of On-Demand Instances in an EC2 Fleet.
  class OnDemandOptionsRequest
    # The strategy that determines the order of the launch template overrides to use in fulfilling
    # On-Demand capacity.
    #
    # `lowest-price` - EC2 Fleet uses price to determine the order, launching the lowest price first.
    #
    # `prioritized` - EC2 Fleet uses the priority that you assigned to each launch template override,
    # launching the highest priority first.
    #
    # Default: `lowest-price`
    property allocation_strategy : FleetOnDemandAllocationStrategy | Nil

    # The strategy for using unused Capacity Reservations for fulfilling On-Demand capacity.
    #
    # Supported only for fleets of type `instant`.
    property capacity_reservation_options : CapacityReservationOptionsRequest | Nil

    # Indicates that the fleet uses a single instance type to launch all On-Demand Instances in the
    # fleet.
    #
    # Supported only for fleets of type `instant`.
    property single_instance_type : Bool | Nil

    # Indicates that the fleet launches all On-Demand Instances into a single Availability Zone.
    #
    # Supported only for fleets of type `instant`.
    property single_availability_zone : Bool | Nil

    # The minimum target capacity for On-Demand Instances in the fleet. If this minimum capacity isn't
    # reached, no instances are launched.
    #
    # Constraints: Maximum value of `1000`. Supported only for fleets of type `instant`.
    #
    # At least one of the following must be specified: `SingleAvailabilityZone` | `SingleInstanceType`
    property min_target_capacity : Int32 | Nil

    # The maximum amount per hour for On-Demand Instances that you're willing to pay.
    #
    # If your fleet includes T instances that are configured as `unlimited`, and if their average CPU
    # usage exceeds the baseline utilization, you will incur a charge for surplus credits. The
    # `MaxTotalPrice` does not account for surplus credits, and, if you use surplus credits, your
    # final cost might be higher than what you specified for `MaxTotalPrice`. For more information,
    # see [Surplus credits can incur
    # charges](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/burstable-performance-instances-unlimited-mode-concepts.html#unlimited-mode-surplus-credits)
    # in the *Amazon EC2 User Guide*.
    property max_total_price : String | Nil

    def initialize(
      @allocation_strategy : FleetOnDemandAllocationStrategy | Nil = nil,
      @capacity_reservation_options : CapacityReservationOptionsRequest | Nil = nil,
      @single_instance_type : Bool | Nil = nil,
      @single_availability_zone : Bool | Nil = nil,
      @min_target_capacity : Int32 | Nil = nil,
      @max_total_price : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @allocation_strategy
        params << {"#{prefix}AllocationStrategy", value.to_json_object_key}
      end

      if value = @capacity_reservation_options
        params.concat(value.to_query_params("#{prefix}CapacityReservationOptions."))
      end

      if value = @single_instance_type
        params << {"#{prefix}SingleInstanceType", Core::QueryValue.bool(value)}
      end

      if value = @single_availability_zone
        params << {"#{prefix}SingleAvailabilityZone", Core::QueryValue.bool(value)}
      end

      if value = @min_target_capacity
        params << {"#{prefix}MinTargetCapacity", value.to_s}
      end

      if value = @max_total_price
        params << {"#{prefix}MaxTotalPrice", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        allocation_strategy: (n = node.xpath_node("*[local-name()='AllocationStrategy']")) ? AEC::FleetOnDemandAllocationStrategy.from_json_object_key?(n.content) : nil,
        capacity_reservation_options: node.xpath_node("*[local-name()='CapacityReservationOptions']").try { |n| CapacityReservationOptionsRequest.from_xml(n) },
        single_instance_type: Core::XMLValue.bool(node.xpath_node("*[local-name()='SingleInstanceType']")),
        single_availability_zone: Core::XMLValue.bool(node.xpath_node("*[local-name()='SingleAvailabilityZone']")),
        min_target_capacity: Core::XMLValue.i32(node.xpath_node("*[local-name()='MinTargetCapacity']")),
        max_total_price: Core::XMLValue.string(node.xpath_node("*[local-name()='MaxTotalPrice']")),
      )
    end

    def validate! : Nil
      if value = @capacity_reservation_options
        value.validate!
      end
    end

    def_equals_and_hash(@allocation_strategy, @capacity_reservation_options, @single_instance_type, @single_availability_zone, @min_target_capacity, @max_total_price)
  end
end
