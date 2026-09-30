private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the parameters for ModifySpotFleetRequest.
  class ModifySpotFleetRequestRequest
    # The launch template and overrides. You can only use this parameter if you specified a launch
    # template (`LaunchTemplateConfigs`) in your Spot Fleet request. If you specified
    # `LaunchSpecifications` in your Spot Fleet request, then omit this parameter.
    property launch_template_configs : Array(LaunchTemplateConfig) | Nil

    # The number of On-Demand Instances in the fleet.
    property on_demand_target_capacity : Int32 | Nil

    # Reserved.
    property context : String | Nil

    # The ID of the Spot Fleet request.
    property spot_fleet_request_id : String

    # The size of the fleet.
    property target_capacity : Int32 | Nil

    # Indicates whether running instances should be terminated if the target capacity of the Spot
    # Fleet request is decreased below the current size of the Spot Fleet.
    #
    # Supported only for fleets of type `maintain`.
    property excess_capacity_termination_policy : ExcessCapacityTerminationPolicy | Nil

    def initialize(
      @spot_fleet_request_id : String,
      @launch_template_configs : Array(LaunchTemplateConfig) | Nil = nil,
      @on_demand_target_capacity : Int32 | Nil = nil,
      @context : String | Nil = nil,
      @target_capacity : Int32 | Nil = nil,
      @excess_capacity_termination_policy : ExcessCapacityTerminationPolicy | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@launch_template_configs || [] of LaunchTemplateConfig).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}LaunchTemplateConfig.#{i}."))
      end

      if value = @on_demand_target_capacity
        params << {"#{prefix}OnDemandTargetCapacity", value.to_s}
      end

      if value = @context
        params << {"#{prefix}Context", value}
      end

      params << {"#{prefix}SpotFleetRequestId", @spot_fleet_request_id}

      if value = @target_capacity
        params << {"#{prefix}TargetCapacity", value.to_s}
      end

      if value = @excess_capacity_termination_policy
        params << {"#{prefix}ExcessCapacityTerminationPolicy", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        launch_template_configs: node.xpath_nodes("*[local-name()='LaunchTemplateConfig']/*[local-name()='item']").map { |n| LaunchTemplateConfig.from_xml(n) },
        on_demand_target_capacity: Core::XMLValue.i32(node.xpath_node("*[local-name()='OnDemandTargetCapacity']")),
        context: Core::XMLValue.string(node.xpath_node("*[local-name()='Context']")),
        spot_fleet_request_id: Core::XMLValue.string(node.xpath_node("*[local-name()='spotFleetRequestId']")).not_nil!,
        target_capacity: Core::XMLValue.i32(node.xpath_node("*[local-name()='targetCapacity']")),
        excess_capacity_termination_policy: (n = node.xpath_node("*[local-name()='excessCapacityTerminationPolicy']")) ? AEC::ExcessCapacityTerminationPolicy.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
      if value = @launch_template_configs
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@launch_template_configs, @on_demand_target_capacity, @context, @spot_fleet_request_id, @target_capacity, @excess_capacity_termination_policy)
  end
end
