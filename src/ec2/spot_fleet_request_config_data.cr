private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the configuration of a Spot Fleet request.
  class SpotFleetRequestConfigData
    # The strategy that determines how to allocate the target Spot Instance capacity across the Spot
    # Instance pools specified by the Spot Fleet launch configuration. For more information, see
    # [Allocation strategies for Spot
    # Instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-fleet-allocation-strategy.html)
    # in the *Amazon EC2 User Guide*.
    #
    # priceCapacityOptimized (recommended) Spot Fleet identifies the pools with the highest capacity
    # availability for the number of instances that are launching. This means that we will request
    # Spot Instances from the pools that we believe have the lowest chance of interruption in the near
    # term. Spot Fleet then requests Spot Instances from the lowest priced of these pools.
    #
    # capacityOptimized Spot Fleet identifies the pools with the highest capacity availability for the
    # number of instances that are launching. This means that we will request Spot Instances from the
    # pools that we believe have the lowest chance of interruption in the near term. To give certain
    # instance types a higher chance of launching first, use `capacityOptimizedPrioritized`. Set a
    # priority for each instance type by using the `Priority` parameter for `LaunchTemplateOverrides`.
    # You can assign the same priority to different `LaunchTemplateOverrides`. EC2 implements the
    # priorities on a best-effort basis, but optimizes for capacity first.
    # `capacityOptimizedPrioritized` is supported only if your Spot Fleet uses a launch template. Note
    # that if the `OnDemandAllocationStrategy` is set to `prioritized`, the same priority is applied
    # when fulfilling On-Demand capacity.
    #
    # diversified Spot Fleet requests instances from all of the Spot Instance pools that you specify.
    #
    # lowestPrice (not recommended) We don't recommend the `lowestPrice` allocation strategy because
    # it has the highest risk of interruption for your Spot Instances.
    #
    # Spot Fleet requests instances from the lowest priced Spot Instance pool that has available
    # capacity. If the lowest priced pool doesn't have available capacity, the Spot Instances come
    # from the next lowest priced pool that has available capacity. If a pool runs out of capacity
    # before fulfilling your desired capacity, Spot Fleet will continue to fulfill your request by
    # drawing from the next lowest priced pool. To ensure that your desired capacity is met, you might
    # receive Spot Instances from several pools. Because this strategy only considers instance price
    # and not capacity availability, it might lead to high interruption rates.
    #
    # Default: `lowestPrice`
    property allocation_strategy : AllocationStrategy | Nil

    # The order of the launch template overrides to use in fulfilling On-Demand capacity. If you
    # specify `lowestPrice`, Spot Fleet uses price to determine the order, launching the lowest price
    # first. If you specify `prioritized`, Spot Fleet uses the priority that you assign to each Spot
    # Fleet launch template override, launching the highest priority first. If you do not specify a
    # value, Spot Fleet defaults to `lowestPrice`.
    property on_demand_allocation_strategy : OnDemandAllocationStrategy | Nil

    # The strategies for managing your Spot Instances that are at an elevated risk of being
    # interrupted.
    property spot_maintenance_strategies : SpotMaintenanceStrategies | Nil

    # A unique, case-sensitive identifier that you provide to ensure the idempotency of your listings.
    # This helps to avoid duplicate listings. For more information, see [Ensuring
    # Idempotency](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html).
    property client_token : String | Nil

    # Indicates whether running instances should be terminated if you decrease the target capacity of
    # the Spot Fleet request below the current size of the Spot Fleet.
    #
    # Supported only for fleets of type `maintain`.
    property excess_capacity_termination_policy : ExcessCapacityTerminationPolicy | Nil

    # The number of units fulfilled by this request compared to the set target capacity. You cannot
    # set this value.
    property fulfilled_capacity : Float64 | Nil

    # The number of On-Demand units fulfilled by this request compared to the set target On-Demand
    # capacity.
    property on_demand_fulfilled_capacity : Float64 | Nil

    # The Amazon Resource Name (ARN) of an Identity and Access Management (IAM) role that grants the
    # Spot Fleet the permission to request, launch, terminate, and tag instances on your behalf. For
    # more information, see [Spot Fleet
    # prerequisites](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-fleet-requests.html#spot-fleet-prerequisites)
    # in the *Amazon EC2 User Guide*. Spot Fleet can terminate Spot Instances on your behalf when you
    # cancel its Spot Fleet request using
    # [CancelSpotFleetRequests](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CancelSpotFleetRequests)
    # or when the Spot Fleet request expires, if you set `TerminateInstancesWithExpiration`.
    property iam_fleet_role : String

    # The launch specifications for the Spot Fleet request. If you specify `LaunchSpecifications`, you
    # can't specify `LaunchTemplateConfigs`. If you include On-Demand capacity in your request, you
    # must use `LaunchTemplateConfigs`.
    #
    # If an AMI specified in a launch specification is deregistered or disabled, no new instances can
    # be launched from the AMI. For fleets of type `maintain`, the target capacity will not be
    # maintained.
    property launch_specifications : Array(SpotFleetLaunchSpecification) | Nil

    # The launch template and overrides. If you specify `LaunchTemplateConfigs`, you can't specify
    # `LaunchSpecifications`. If you include On-Demand capacity in your request, you must use
    # `LaunchTemplateConfigs`.
    property launch_template_configs : Array(LaunchTemplateConfig) | Nil

    # The maximum price per unit hour that you are willing to pay for a Spot Instance. We do not
    # recommend using this parameter because it can lead to increased interruptions. If you do not
    # specify this parameter, you will pay the current Spot price.
    #
    # If you specify a maximum price, your instances will be interrupted more frequently than if you
    # do not specify this parameter.
    property spot_price : String | Nil

    # The number of units to request for the Spot Fleet. You can choose to set the target capacity in
    # terms of instances or a performance characteristic that is important to your application
    # workload, such as vCPUs, memory, or I/O. If the request type is `maintain`, you can specify a
    # target capacity of 0 and add capacity later.
    property target_capacity : Int32

    # The number of On-Demand units to request. You can choose to set the target capacity in terms of
    # instances or a performance characteristic that is important to your application workload, such
    # as vCPUs, memory, or I/O. If the request type is `maintain`, you can specify a target capacity
    # of 0 and add capacity later.
    property on_demand_target_capacity : Int32 | Nil

    # The maximum amount per hour for On-Demand Instances that you're willing to pay. You can use the
    # `onDemandMaxTotalPrice` parameter, the `spotMaxTotalPrice` parameter, or both parameters to
    # ensure that your fleet cost does not exceed your budget. If you set a maximum price per hour for
    # the On-Demand Instances and Spot Instances in your request, Spot Fleet will launch instances
    # until it reaches the maximum amount you're willing to pay. When the maximum amount you're
    # willing to pay is reached, the fleet stops launching instances even if it hasn’t met the target
    # capacity.
    #
    # If your fleet includes T instances that are configured as `unlimited`, and if their average CPU
    # usage exceeds the baseline utilization, you will incur a charge for surplus credits. The
    # `onDemandMaxTotalPrice` does not account for surplus credits, and, if you use surplus credits,
    # your final cost might be higher than what you specified for `onDemandMaxTotalPrice`. For more
    # information, see [Surplus credits can incur
    # charges](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/burstable-performance-instances-unlimited-mode-concepts.html#unlimited-mode-surplus-credits)
    # in the *Amazon EC2 User Guide*.
    property on_demand_max_total_price : String | Nil

    # The maximum amount per hour for Spot Instances that you're willing to pay. You can use the
    # `spotMaxTotalPrice` parameter, the `onDemandMaxTotalPrice` parameter, or both parameters to
    # ensure that your fleet cost does not exceed your budget. If you set a maximum price per hour for
    # the On-Demand Instances and Spot Instances in your request, Spot Fleet will launch instances
    # until it reaches the maximum amount you're willing to pay. When the maximum amount you're
    # willing to pay is reached, the fleet stops launching instances even if it hasn’t met the target
    # capacity.
    #
    # If your fleet includes T instances that are configured as `unlimited`, and if their average CPU
    # usage exceeds the baseline utilization, you will incur a charge for surplus credits. The
    # `spotMaxTotalPrice` does not account for surplus credits, and, if you use surplus credits, your
    # final cost might be higher than what you specified for `spotMaxTotalPrice`. For more
    # information, see [Surplus credits can incur
    # charges](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/burstable-performance-instances-unlimited-mode-concepts.html#unlimited-mode-surplus-credits)
    # in the *Amazon EC2 User Guide*.
    property spot_max_total_price : String | Nil

    # Indicates whether running Spot Instances are terminated when the Spot Fleet request expires.
    property terminate_instances_with_expiration : Bool | Nil

    # The type of request. Indicates whether the Spot Fleet only requests the target capacity or also
    # attempts to maintain it. When this value is `request`, the Spot Fleet only places the required
    # requests. It does not attempt to replenish Spot Instances if capacity is diminished, nor does it
    # submit requests in alternative Spot pools if capacity is not available. When this value is
    # `maintain`, the Spot Fleet maintains the target capacity. The Spot Fleet places the required
    # requests to meet capacity and automatically replenishes any interrupted instances. Default:
    # `maintain`. `instant` is listed but is not used by Spot Fleet.
    property type : FleetType | Nil

    # The start date and time of the request, in UTC format (*YYYY*-*MM*-*DD*T*HH*:*MM*:*SS*Z). By
    # default, Amazon EC2 starts fulfilling the request immediately.
    property valid_from : Time | Nil

    # The end date and time of the request, in UTC format (*YYYY*-*MM*-*DD*T*HH*:*MM*:*SS*Z). After
    # the end date and time, no new Spot Instance requests are placed or able to fulfill the request.
    # If no value is specified, the Spot Fleet request remains until you cancel it.
    property valid_until : Time | Nil

    # Indicates whether Spot Fleet should replace unhealthy instances.
    property replace_unhealthy_instances : Bool | Nil

    # The behavior when a Spot Instance is interrupted. The default is `terminate`.
    property instance_interruption_behavior : InstanceInterruptionBehavior | Nil

    # One or more Classic Load Balancers and target groups to attach to the Spot Fleet request. Spot
    # Fleet registers the running Spot Instances with the specified Classic Load Balancers and target
    # groups.
    #
    # With Network Load Balancers, Spot Fleet cannot register instances that have the following
    # instance types: C1, CC1, CC2, CG1, CG2, CR1, CS1, G1, G2, HI1, HS1, M1, M2, M3, and T1.
    property load_balancers_config : LoadBalancersConfig | Nil

    # The number of Spot pools across which to allocate your target Spot capacity. Valid only when
    # Spot **AllocationStrategy** is set to `lowest-price`. Spot Fleet selects the cheapest Spot pools
    # and evenly allocates your target Spot capacity across the number of Spot pools that you specify.
    #
    # Note that Spot Fleet attempts to draw Spot Instances from the number of pools that you specify
    # on a best effort basis. If a pool runs out of Spot capacity before fulfilling your target
    # capacity, Spot Fleet will continue to fulfill your request by drawing from the next cheapest
    # pool. To ensure that your target capacity is met, you might receive Spot Instances from more
    # than the number of pools that you specified. Similarly, if most of the pools have no Spot
    # capacity, you might receive your full target capacity from fewer than the number of pools that
    # you specified.
    property instance_pools_to_use_count : Int32 | Nil

    # Reserved.
    property context : String | Nil

    # The unit for the target capacity. You can specify this parameter only when using attribute-based
    # instance type selection.
    #
    # Default: `units` (the number of instances)
    property target_capacity_unit_type : TargetCapacityUnitType | Nil

    # The key-value pair for tagging the Spot Fleet request on creation. The value for `ResourceType`
    # must be `spot-fleet-request`, otherwise the Spot Fleet request fails. To tag instances at
    # launch, specify the tags in the [launch
    # template](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-launch-templates.html#create-launch-template)
    # (valid only if you use `LaunchTemplateConfigs`) or in the `
    # [SpotFleetTagSpecification](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_SpotFleetTagSpecification.html)
    # ` (valid only if you use `LaunchSpecifications`). For information about tagging after launch,
    # see [Tag your
    # resources](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html#tag-resources).
    property tag_specifications : Array(TagSpecification) | Nil

    def initialize(
      @iam_fleet_role : String,
      @target_capacity : Int32,
      @allocation_strategy : AllocationStrategy | Nil = nil,
      @on_demand_allocation_strategy : OnDemandAllocationStrategy | Nil = nil,
      @spot_maintenance_strategies : SpotMaintenanceStrategies | Nil = nil,
      @client_token : String | Nil = nil,
      @excess_capacity_termination_policy : ExcessCapacityTerminationPolicy | Nil = nil,
      @fulfilled_capacity : Float64 | Nil = nil,
      @on_demand_fulfilled_capacity : Float64 | Nil = nil,
      @launch_specifications : Array(SpotFleetLaunchSpecification) | Nil = nil,
      @launch_template_configs : Array(LaunchTemplateConfig) | Nil = nil,
      @spot_price : String | Nil = nil,
      @on_demand_target_capacity : Int32 | Nil = nil,
      @on_demand_max_total_price : String | Nil = nil,
      @spot_max_total_price : String | Nil = nil,
      @terminate_instances_with_expiration : Bool | Nil = nil,
      @type : FleetType | Nil = nil,
      @valid_from : Time | Nil = nil,
      @valid_until : Time | Nil = nil,
      @replace_unhealthy_instances : Bool | Nil = nil,
      @instance_interruption_behavior : InstanceInterruptionBehavior | Nil = nil,
      @load_balancers_config : LoadBalancersConfig | Nil = nil,
      @instance_pools_to_use_count : Int32 | Nil = nil,
      @context : String | Nil = nil,
      @target_capacity_unit_type : TargetCapacityUnitType | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @allocation_strategy
        params << {"#{prefix}AllocationStrategy", value.to_json_object_key}
      end

      if value = @on_demand_allocation_strategy
        params << {"#{prefix}OnDemandAllocationStrategy", value.to_json_object_key}
      end

      if value = @spot_maintenance_strategies
        params.concat(value.to_query_params("#{prefix}SpotMaintenanceStrategies."))
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      if value = @excess_capacity_termination_policy
        params << {"#{prefix}ExcessCapacityTerminationPolicy", value.to_json_object_key}
      end

      if value = @fulfilled_capacity
        params << {"#{prefix}FulfilledCapacity", value.to_s}
      end

      if value = @on_demand_fulfilled_capacity
        params << {"#{prefix}OnDemandFulfilledCapacity", value.to_s}
      end

      params << {"#{prefix}IamFleetRole", @iam_fleet_role}

      (@launch_specifications || [] of SpotFleetLaunchSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}LaunchSpecifications.#{i}."))
      end

      (@launch_template_configs || [] of LaunchTemplateConfig).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}LaunchTemplateConfigs.#{i}."))
      end

      if value = @spot_price
        params << {"#{prefix}SpotPrice", value}
      end

      params << {"#{prefix}TargetCapacity", @target_capacity.to_s}

      if value = @on_demand_target_capacity
        params << {"#{prefix}OnDemandTargetCapacity", value.to_s}
      end

      if value = @on_demand_max_total_price
        params << {"#{prefix}OnDemandMaxTotalPrice", value}
      end

      if value = @spot_max_total_price
        params << {"#{prefix}SpotMaxTotalPrice", value}
      end

      if value = @terminate_instances_with_expiration
        params << {"#{prefix}TerminateInstancesWithExpiration", Core::QueryValue.bool(value)}
      end

      if value = @type
        params << {"#{prefix}Type", value.to_json_object_key}
      end

      if value = @valid_from
        params << {"#{prefix}ValidFrom", Core::QueryValue.time(value)}
      end

      if value = @valid_until
        params << {"#{prefix}ValidUntil", Core::QueryValue.time(value)}
      end

      if value = @replace_unhealthy_instances
        params << {"#{prefix}ReplaceUnhealthyInstances", Core::QueryValue.bool(value)}
      end

      if value = @instance_interruption_behavior
        params << {"#{prefix}InstanceInterruptionBehavior", value.to_json_object_key}
      end

      if value = @load_balancers_config
        params.concat(value.to_query_params("#{prefix}LoadBalancersConfig."))
      end

      if value = @instance_pools_to_use_count
        params << {"#{prefix}InstancePoolsToUseCount", value.to_s}
      end

      if value = @context
        params << {"#{prefix}Context", value}
      end

      if value = @target_capacity_unit_type
        params << {"#{prefix}TargetCapacityUnitType", value.to_json_object_key}
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        allocation_strategy: (n = node.xpath_node("*[local-name()='allocationStrategy']")) ? AEC::AllocationStrategy.from_json_object_key?(n.content) : nil,
        on_demand_allocation_strategy: (n = node.xpath_node("*[local-name()='onDemandAllocationStrategy']")) ? AEC::OnDemandAllocationStrategy.from_json_object_key?(n.content) : nil,
        spot_maintenance_strategies: node.xpath_node("*[local-name()='spotMaintenanceStrategies']").try { |n| SpotMaintenanceStrategies.from_xml(n) },
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='clientToken']")),
        excess_capacity_termination_policy: (n = node.xpath_node("*[local-name()='excessCapacityTerminationPolicy']")) ? AEC::ExcessCapacityTerminationPolicy.from_json_object_key?(n.content) : nil,
        fulfilled_capacity: Core::XMLValue.f64(node.xpath_node("*[local-name()='fulfilledCapacity']")),
        on_demand_fulfilled_capacity: Core::XMLValue.f64(node.xpath_node("*[local-name()='onDemandFulfilledCapacity']")),
        iam_fleet_role: Core::XMLValue.string(node.xpath_node("*[local-name()='iamFleetRole']")).not_nil!,
        launch_specifications: node.xpath_nodes("*[local-name()='launchSpecifications']/*[local-name()='item']").map { |n| SpotFleetLaunchSpecification.from_xml(n) },
        launch_template_configs: node.xpath_nodes("*[local-name()='launchTemplateConfigs']/*[local-name()='item']").map { |n| LaunchTemplateConfig.from_xml(n) },
        spot_price: Core::XMLValue.string(node.xpath_node("*[local-name()='spotPrice']")),
        target_capacity: Core::XMLValue.i32(node.xpath_node("*[local-name()='targetCapacity']")).not_nil!,
        on_demand_target_capacity: Core::XMLValue.i32(node.xpath_node("*[local-name()='onDemandTargetCapacity']")),
        on_demand_max_total_price: Core::XMLValue.string(node.xpath_node("*[local-name()='onDemandMaxTotalPrice']")),
        spot_max_total_price: Core::XMLValue.string(node.xpath_node("*[local-name()='spotMaxTotalPrice']")),
        terminate_instances_with_expiration: Core::XMLValue.bool(node.xpath_node("*[local-name()='terminateInstancesWithExpiration']")),
        type: (n = node.xpath_node("*[local-name()='type']")) ? AEC::FleetType.from_json_object_key?(n.content) : nil,
        valid_from: Core::XMLValue.time(node.xpath_node("*[local-name()='validFrom']")),
        valid_until: Core::XMLValue.time(node.xpath_node("*[local-name()='validUntil']")),
        replace_unhealthy_instances: Core::XMLValue.bool(node.xpath_node("*[local-name()='replaceUnhealthyInstances']")),
        instance_interruption_behavior: (n = node.xpath_node("*[local-name()='instanceInterruptionBehavior']")) ? AEC::InstanceInterruptionBehavior.from_json_object_key?(n.content) : nil,
        load_balancers_config: node.xpath_node("*[local-name()='loadBalancersConfig']").try { |n| LoadBalancersConfig.from_xml(n) },
        instance_pools_to_use_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='instancePoolsToUseCount']")),
        context: Core::XMLValue.string(node.xpath_node("*[local-name()='context']")),
        target_capacity_unit_type: (n = node.xpath_node("*[local-name()='targetCapacityUnitType']")) ? AEC::TargetCapacityUnitType.from_json_object_key?(n.content) : nil,
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @spot_maintenance_strategies
        value.validate!
      end

      if value = @launch_specifications
        value.each(&.validate!)
      end

      if value = @launch_template_configs
        value.each(&.validate!)
      end

      if value = @load_balancers_config
        value.validate!
      end

      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@allocation_strategy, @on_demand_allocation_strategy, @spot_maintenance_strategies, @client_token, @excess_capacity_termination_policy, @fulfilled_capacity, @on_demand_fulfilled_capacity, @iam_fleet_role, @launch_specifications, @launch_template_configs, @spot_price, @target_capacity, @on_demand_target_capacity, @on_demand_max_total_price, @spot_max_total_price, @terminate_instances_with_expiration, @type, @valid_from, @valid_until, @replace_unhealthy_instances, @instance_interruption_behavior, @load_balancers_config, @instance_pools_to_use_count, @context, @target_capacity_unit_type, @tag_specifications)
  end
end
