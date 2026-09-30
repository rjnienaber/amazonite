private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyFleetRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # Indicates whether running instances should be terminated if the total target capacity of the EC2
    # Fleet is decreased below the current size of the EC2 Fleet.
    #
    # Supported only for fleets of type `maintain`.
    property excess_capacity_termination_policy : FleetExcessCapacityTerminationPolicy | Nil

    # The launch template and overrides.
    property launch_template_configs : Array(FleetLaunchTemplateConfigRequest) | Nil

    # The ID of the EC2 Fleet.
    property fleet_id : String

    # The size of the EC2 Fleet.
    property target_capacity_specification : TargetCapacitySpecificationRequest | Nil

    # Reserved.
    property context : String | Nil

    def initialize(
      @fleet_id : String,
      @dry_run : Bool | Nil = nil,
      @excess_capacity_termination_policy : FleetExcessCapacityTerminationPolicy | Nil = nil,
      @launch_template_configs : Array(FleetLaunchTemplateConfigRequest) | Nil = nil,
      @target_capacity_specification : TargetCapacitySpecificationRequest | Nil = nil,
      @context : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @excess_capacity_termination_policy
        params << {"#{prefix}ExcessCapacityTerminationPolicy", value.to_json_object_key}
      end

      (@launch_template_configs || [] of FleetLaunchTemplateConfigRequest).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}LaunchTemplateConfig.#{i}."))
      end

      params << {"#{prefix}FleetId", @fleet_id}

      if value = @target_capacity_specification
        params.concat(value.to_query_params("#{prefix}TargetCapacitySpecification."))
      end

      if value = @context
        params << {"#{prefix}Context", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        excess_capacity_termination_policy: (n = node.xpath_node("*[local-name()='ExcessCapacityTerminationPolicy']")) ? AEC::FleetExcessCapacityTerminationPolicy.from_json_object_key?(n.content) : nil,
        launch_template_configs: node.xpath_nodes("*[local-name()='LaunchTemplateConfig']/*[local-name()='item']").map { |n| FleetLaunchTemplateConfigRequest.from_xml(n) },
        fleet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='FleetId']")).not_nil!,
        target_capacity_specification: node.xpath_node("*[local-name()='TargetCapacitySpecification']").try { |n| TargetCapacitySpecificationRequest.from_xml(n) },
        context: Core::XMLValue.string(node.xpath_node("*[local-name()='Context']")),
      )
    end

    def validate! : Nil
      if value = @launch_template_configs
        raise Core::ValidationError.new("LaunchTemplateConfigs must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("LaunchTemplateConfigs must have at most 50 item(s)") if value.size > 50
        value.each(&.validate!)
      end

      if value = @target_capacity_specification
        value.validate!
      end
    end

    def_equals_and_hash(@dry_run, @excess_capacity_termination_policy, @launch_template_configs, @fleet_id, @target_capacity_specification, @context)
  end
end
