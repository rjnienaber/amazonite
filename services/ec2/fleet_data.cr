private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an EC2 Fleet.
  class FleetData
    # The progress of the EC2 Fleet.
    #
    # For fleets of type `instant`, the status is `fulfilled` after all requests are placed,
    # regardless of whether target capacity is met (this is the only possible status for `instant`
    # fleets).
    #
    # For fleets of type `request` or `maintain`, the status is `pending_fulfillment` after all
    # requests are placed, `fulfilled` when the fleet size meets or exceeds target capacity,
    # `pending_termination` while instances are terminating when fleet size is decreased, and `error`
    # if there's an error.
    property activity_status : FleetActivityStatus | Nil

    # The creation date and time of the EC2 Fleet.
    property create_time : Time | Nil

    # The ID of the EC2 Fleet.
    property fleet_id : String | Nil

    # The state of the EC2 Fleet.
    property fleet_state : FleetStateCode | Nil

    # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. For
    # more information, see [Ensuring
    # idempotency](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html).
    #
    # Constraints: Maximum 64 ASCII characters
    property client_token : String | Nil

    # Indicates whether running instances should be terminated if the target capacity of the EC2 Fleet
    # is decreased below the current size of the EC2 Fleet.
    #
    # Supported only for fleets of type `maintain`.
    property excess_capacity_termination_policy : FleetExcessCapacityTerminationPolicy | Nil

    # The number of units fulfilled by this request compared to the set target capacity.
    property fulfilled_capacity : Float64 | Nil

    # The number of units fulfilled by this request compared to the set target On-Demand capacity.
    property fulfilled_on_demand_capacity : Float64 | Nil

    # The launch template and overrides.
    property launch_template_configs : Array(FleetLaunchTemplateConfig) | Nil

    # The number of units to request. You can choose to set the target capacity in terms of instances
    # or a performance characteristic that is important to your application workload, such as vCPUs,
    # memory, or I/O. If the request type is `maintain`, you can specify a target capacity of 0 and
    # add capacity later.
    property target_capacity_specification : TargetCapacitySpecification | Nil

    # Indicates whether running instances should be terminated when the EC2 Fleet expires.
    property terminate_instances_with_expiration : Bool | Nil

    # The type of request. Indicates whether the EC2 Fleet only `requests` the target capacity, or
    # also attempts to `maintain` it. If you request a certain target capacity, EC2 Fleet only places
    # the required requests; it does not attempt to replenish instances if capacity is diminished, and
    # it does not submit requests in alternative capacity pools if capacity is unavailable. To
    # maintain a certain target capacity, EC2 Fleet places the required requests to meet this target
    # capacity. It also automatically replenishes any interrupted Spot Instances. Default: `maintain`.
    property type : FleetType | Nil

    # The start date and time of the request, in UTC format (for example,
    # *YYYY*-*MM*-*DD*T*HH*:*MM*:*SS*Z). The default is to start fulfilling the request immediately.
    property valid_from : Time | Nil

    # The end date and time of the request, in UTC format (for example,
    # *YYYY*-*MM*-*DD*T*HH*:*MM*:*SS*Z). At this point, no new instance requests are placed or able to
    # fulfill the request. The default end date is 7 days from the current date.
    property valid_until : Time | Nil

    # Indicates whether EC2 Fleet should replace unhealthy Spot Instances. Supported only for fleets
    # of type `maintain`. For more information, see [EC2 Fleet health
    # checks](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/manage-ec2-fleet.html#ec2-fleet-health-checks)
    # in the *Amazon EC2 User Guide*.
    property replace_unhealthy_instances : Bool | Nil

    # The configuration of Spot Instances in an EC2 Fleet.
    property spot_options : SpotOptions | Nil

    # The allocation strategy of On-Demand Instances in an EC2 Fleet.
    property on_demand_options : OnDemandOptions | Nil

    # Defines EC2 Fleet preferences for utilizing reserved capacity when DefaultTargetCapacityType is
    # set to `reserved-capacity`.
    property reserved_capacity_options : ReservedCapacityOptions | Nil

    # The tags for an EC2 Fleet resource.
    property tags : Array(Tag) | Nil

    # Information about the instances that could not be launched by the fleet. Valid only when
    # **Type** is set to `instant`.
    property errors : Array(DescribeFleetError) | Nil

    # Information about the instances that were launched by the fleet. Valid only when **Type** is set
    # to `instant`.
    property instances : Array(DescribeFleetsInstances) | Nil

    # Reserved.
    property context : String | Nil

    def initialize(
      @activity_status : FleetActivityStatus | Nil = nil,
      @create_time : Time | Nil = nil,
      @fleet_id : String | Nil = nil,
      @fleet_state : FleetStateCode | Nil = nil,
      @client_token : String | Nil = nil,
      @excess_capacity_termination_policy : FleetExcessCapacityTerminationPolicy | Nil = nil,
      @fulfilled_capacity : Float64 | Nil = nil,
      @fulfilled_on_demand_capacity : Float64 | Nil = nil,
      @launch_template_configs : Array(FleetLaunchTemplateConfig) | Nil = nil,
      @target_capacity_specification : TargetCapacitySpecification | Nil = nil,
      @terminate_instances_with_expiration : Bool | Nil = nil,
      @type : FleetType | Nil = nil,
      @valid_from : Time | Nil = nil,
      @valid_until : Time | Nil = nil,
      @replace_unhealthy_instances : Bool | Nil = nil,
      @spot_options : SpotOptions | Nil = nil,
      @on_demand_options : OnDemandOptions | Nil = nil,
      @reserved_capacity_options : ReservedCapacityOptions | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @errors : Array(DescribeFleetError) | Nil = nil,
      @instances : Array(DescribeFleetsInstances) | Nil = nil,
      @context : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @activity_status
        params << {"#{prefix}ActivityStatus", value.to_json_object_key}
      end

      if value = @create_time
        params << {"#{prefix}CreateTime", Core::QueryValue.time(value)}
      end

      if value = @fleet_id
        params << {"#{prefix}FleetId", value}
      end

      if value = @fleet_state
        params << {"#{prefix}FleetState", value.to_json_object_key}
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

      if value = @fulfilled_on_demand_capacity
        params << {"#{prefix}FulfilledOnDemandCapacity", value.to_s}
      end

      (@launch_template_configs || [] of FleetLaunchTemplateConfig).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}LaunchTemplateConfigs.#{i}."))
      end

      if value = @target_capacity_specification
        params.concat(value.to_query_params("#{prefix}TargetCapacitySpecification."))
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

      if value = @spot_options
        params.concat(value.to_query_params("#{prefix}SpotOptions."))
      end

      if value = @on_demand_options
        params.concat(value.to_query_params("#{prefix}OnDemandOptions."))
      end

      if value = @reserved_capacity_options
        params.concat(value.to_query_params("#{prefix}ReservedCapacityOptions."))
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      (@errors || [] of DescribeFleetError).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ErrorSet.#{i}."))
      end

      (@instances || [] of DescribeFleetsInstances).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}FleetInstanceSet.#{i}."))
      end

      if value = @context
        params << {"#{prefix}Context", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        activity_status: (n = node.xpath_node("*[local-name()='activityStatus']")) ? AEC::FleetActivityStatus.from_json_object_key?(n.content) : nil,
        create_time: Core::XMLValue.time(node.xpath_node("*[local-name()='createTime']")),
        fleet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='fleetId']")),
        fleet_state: (n = node.xpath_node("*[local-name()='fleetState']")) ? AEC::FleetStateCode.from_json_object_key?(n.content) : nil,
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='clientToken']")),
        excess_capacity_termination_policy: (n = node.xpath_node("*[local-name()='excessCapacityTerminationPolicy']")) ? AEC::FleetExcessCapacityTerminationPolicy.from_json_object_key?(n.content) : nil,
        fulfilled_capacity: Core::XMLValue.f64(node.xpath_node("*[local-name()='fulfilledCapacity']")),
        fulfilled_on_demand_capacity: Core::XMLValue.f64(node.xpath_node("*[local-name()='fulfilledOnDemandCapacity']")),
        launch_template_configs: node.xpath_nodes("*[local-name()='launchTemplateConfigs']/*[local-name()='item']").map { |n| FleetLaunchTemplateConfig.from_xml(n) },
        target_capacity_specification: node.xpath_node("*[local-name()='targetCapacitySpecification']").try { |n| TargetCapacitySpecification.from_xml(n) },
        terminate_instances_with_expiration: Core::XMLValue.bool(node.xpath_node("*[local-name()='terminateInstancesWithExpiration']")),
        type: (n = node.xpath_node("*[local-name()='type']")) ? AEC::FleetType.from_json_object_key?(n.content) : nil,
        valid_from: Core::XMLValue.time(node.xpath_node("*[local-name()='validFrom']")),
        valid_until: Core::XMLValue.time(node.xpath_node("*[local-name()='validUntil']")),
        replace_unhealthy_instances: Core::XMLValue.bool(node.xpath_node("*[local-name()='replaceUnhealthyInstances']")),
        spot_options: node.xpath_node("*[local-name()='spotOptions']").try { |n| SpotOptions.from_xml(n) },
        on_demand_options: node.xpath_node("*[local-name()='onDemandOptions']").try { |n| OnDemandOptions.from_xml(n) },
        reserved_capacity_options: node.xpath_node("*[local-name()='reservedCapacityOptions']").try { |n| ReservedCapacityOptions.from_xml(n) },
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        errors: node.xpath_nodes("*[local-name()='errorSet']/*[local-name()='item']").map { |n| DescribeFleetError.from_xml(n) },
        instances: node.xpath_nodes("*[local-name()='fleetInstanceSet']/*[local-name()='item']").map { |n| DescribeFleetsInstances.from_xml(n) },
        context: Core::XMLValue.string(node.xpath_node("*[local-name()='context']")),
      )
    end

    def validate! : Nil
      if value = @launch_template_configs
        value.each(&.validate!)
      end

      if value = @target_capacity_specification
        value.validate!
      end

      if value = @spot_options
        value.validate!
      end

      if value = @on_demand_options
        value.validate!
      end

      if value = @reserved_capacity_options
        value.validate!
      end

      if value = @tags
        value.each(&.validate!)
      end

      if value = @errors
        value.each(&.validate!)
      end

      if value = @instances
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@activity_status, @create_time, @fleet_id, @fleet_state, @client_token, @excess_capacity_termination_policy, @fulfilled_capacity, @fulfilled_on_demand_capacity, @launch_template_configs, @target_capacity_specification, @terminate_instances_with_expiration, @type, @valid_from, @valid_until, @replace_unhealthy_instances, @spot_options, @on_demand_options, @reserved_capacity_options, @tags, @errors, @instances, @context)
  end
end
