private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the configuration of Spot Instances in an EC2 Fleet.
  class SpotOptions
    # The strategy that determines how to allocate the target Spot Instance capacity across the Spot
    # Instance pools specified by the EC2 Fleet launch configuration. For more information, see
    # [Allocation strategies for Spot
    # Instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-fleet-allocation-strategy.html)
    # in the *Amazon EC2 User Guide*.
    #
    # price-capacity-optimized (recommended) EC2 Fleet identifies the pools with the highest capacity
    # availability for the number of instances that are launching. This means that we will request
    # Spot Instances from the pools that we believe have the lowest chance of interruption in the near
    # term. EC2 Fleet then requests Spot Instances from the lowest priced of these pools.
    #
    # capacity-optimized EC2 Fleet identifies the pools with the highest capacity availability for the
    # number of instances that are launching. This means that we will request Spot Instances from the
    # pools that we believe have the lowest chance of interruption in the near term. To give certain
    # instance types a higher chance of launching first, use `capacity-optimized-prioritized`. Set a
    # priority for each instance type by using the `Priority` parameter for `LaunchTemplateOverrides`.
    # You can assign the same priority to different `LaunchTemplateOverrides`. EC2 implements the
    # priorities on a best-effort basis, but optimizes for capacity first.
    # `capacity-optimized-prioritized` is supported only if your EC2 Fleet uses a launch template.
    # Note that if the On-Demand `AllocationStrategy` is set to `prioritized`, the same priority is
    # applied when fulfilling On-Demand capacity.
    #
    # diversified EC2 Fleet requests instances from all of the Spot Instance pools that you specify.
    #
    # lowest-price (not recommended) We don't recommend the `lowest-price` allocation strategy because
    # it has the highest risk of interruption for your Spot Instances.
    #
    # EC2 Fleet requests instances from the lowest priced Spot Instance pool that has available
    # capacity. If the lowest priced pool doesn't have available capacity, the Spot Instances come
    # from the next lowest priced pool that has available capacity. If a pool runs out of capacity
    # before fulfilling your desired capacity, EC2 Fleet will continue to fulfill your request by
    # drawing from the next lowest priced pool. To ensure that your desired capacity is met, you might
    # receive Spot Instances from several pools. Because this strategy only considers instance price
    # and not capacity availability, it might lead to high interruption rates.
    #
    # Default: `lowest-price`
    property allocation_strategy : SpotAllocationStrategy | Nil

    # The strategies for managing your workloads on your Spot Instances that will be interrupted.
    # Currently only the capacity rebalance strategy is available.
    property maintenance_strategies : FleetSpotMaintenanceStrategies | Nil

    # The behavior when a Spot Instance is interrupted.
    #
    # Default: `terminate`
    property instance_interruption_behavior : SpotInstanceInterruptionBehavior | Nil

    # The number of Spot pools across which to allocate your target Spot capacity. Supported only when
    # `AllocationStrategy` is set to `lowest-price`. EC2 Fleet selects the cheapest Spot pools and
    # evenly allocates your target Spot capacity across the number of Spot pools that you specify.
    #
    # Note that EC2 Fleet attempts to draw Spot Instances from the number of pools that you specify on
    # a best effort basis. If a pool runs out of Spot capacity before fulfilling your target capacity,
    # EC2 Fleet will continue to fulfill your request by drawing from the next cheapest pool. To
    # ensure that your target capacity is met, you might receive Spot Instances from more than the
    # number of pools that you specified. Similarly, if most of the pools have no Spot capacity, you
    # might receive your full target capacity from fewer than the number of pools that you specified.
    property instance_pools_to_use_count : Int32 | Nil

    # Indicates that the fleet uses a single instance type to launch all Spot Instances in the fleet.
    #
    # Supported only for fleets of type `instant`.
    property single_instance_type : Bool | Nil

    # Indicates that the fleet launches all Spot Instances into a single Availability Zone.
    #
    # Supported only for fleets of type `instant`.
    property single_availability_zone : Bool | Nil

    # The minimum target capacity for Spot Instances in the fleet. If this minimum capacity isn't
    # reached, no instances are launched.
    #
    # Constraints: Maximum value of `1000`. Supported only for fleets of type `instant`.
    #
    # At least one of the following must be specified: `SingleAvailabilityZone` | `SingleInstanceType`
    property min_target_capacity : Int32 | Nil

    # The maximum amount per hour for Spot Instances that you're willing to pay. We do not recommend
    # using this parameter because it can lead to increased interruptions. If you do not specify this
    # parameter, you will pay the current Spot price.
    #
    # If you specify a maximum price, your Spot Instances will be interrupted more frequently than if
    # you do not specify this parameter.
    #
    # If your fleet includes T instances that are configured as `unlimited`, and if their average CPU
    # usage exceeds the baseline utilization, you will incur a charge for surplus credits. The
    # `maxTotalPrice` does not account for surplus credits, and, if you use surplus credits, your
    # final cost might be higher than what you specified for `maxTotalPrice`. For more information,
    # see [Surplus credits can incur
    # charges](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/burstable-performance-instances-unlimited-mode-concepts.html#unlimited-mode-surplus-credits)
    # in the *Amazon EC2 User Guide*.
    property max_total_price : String | Nil

    def initialize(
      @allocation_strategy : SpotAllocationStrategy | Nil = nil,
      @maintenance_strategies : FleetSpotMaintenanceStrategies | Nil = nil,
      @instance_interruption_behavior : SpotInstanceInterruptionBehavior | Nil = nil,
      @instance_pools_to_use_count : Int32 | Nil = nil,
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

      if value = @maintenance_strategies
        params.concat(value.to_query_params("#{prefix}MaintenanceStrategies."))
      end

      if value = @instance_interruption_behavior
        params << {"#{prefix}InstanceInterruptionBehavior", value.to_json_object_key}
      end

      if value = @instance_pools_to_use_count
        params << {"#{prefix}InstancePoolsToUseCount", value.to_s}
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
        allocation_strategy: (n = node.xpath_node("*[local-name()='allocationStrategy']")) ? AEC::SpotAllocationStrategy.from_json_object_key?(n.content) : nil,
        maintenance_strategies: node.xpath_node("*[local-name()='maintenanceStrategies']").try { |n| FleetSpotMaintenanceStrategies.from_xml(n) },
        instance_interruption_behavior: (n = node.xpath_node("*[local-name()='instanceInterruptionBehavior']")) ? AEC::SpotInstanceInterruptionBehavior.from_json_object_key?(n.content) : nil,
        instance_pools_to_use_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='instancePoolsToUseCount']")),
        single_instance_type: Core::XMLValue.bool(node.xpath_node("*[local-name()='singleInstanceType']")),
        single_availability_zone: Core::XMLValue.bool(node.xpath_node("*[local-name()='singleAvailabilityZone']")),
        min_target_capacity: Core::XMLValue.i32(node.xpath_node("*[local-name()='minTargetCapacity']")),
        max_total_price: Core::XMLValue.string(node.xpath_node("*[local-name()='maxTotalPrice']")),
      )
    end

    def validate! : Nil
      if value = @maintenance_strategies
        value.validate!
      end
    end

    def_equals_and_hash(@allocation_strategy, @maintenance_strategies, @instance_interruption_behavior, @instance_pools_to_use_count, @single_instance_type, @single_availability_zone, @min_target_capacity, @max_total_price)
  end
end
