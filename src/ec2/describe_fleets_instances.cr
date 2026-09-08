private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the instances that were launched by the fleet.
  class DescribeFleetsInstances
    # The launch templates and overrides that were used for launching the instances. The values that
    # you specify in the Overrides replace the values in the launch template.
    property launch_template_and_overrides : LaunchTemplateAndOverridesResponse | Nil

    # Indicates if the instance that was launched is a Spot, On-Demand, Capacity Block for ML, or
    # interruptible Capacity Reservation instance.
    property lifecycle : InstanceLifecycle | Nil

    # The IDs of the instances.
    property instance_ids : Array(String) | Nil

    # The instance type.
    property instance_type : InstanceType | Nil

    # The value is `windows` for Windows instances in an EC2 Fleet. Otherwise, the value is blank.
    property platform : PlatformValues | Nil

    def initialize(
      @launch_template_and_overrides : LaunchTemplateAndOverridesResponse | Nil = nil,
      @lifecycle : InstanceLifecycle | Nil = nil,
      @instance_ids : Array(String) | Nil = nil,
      @instance_type : InstanceType | Nil = nil,
      @platform : PlatformValues | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @launch_template_and_overrides
        params.concat(value.to_query_params("#{prefix}LaunchTemplateAndOverrides."))
      end

      if value = @lifecycle
        params << {"#{prefix}Lifecycle", value.to_json_object_key}
      end

      (@instance_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}InstanceIds.#{i}", item}
      end

      if value = @instance_type
        params << {"#{prefix}InstanceType", value.to_json_object_key}
      end

      if value = @platform
        params << {"#{prefix}Platform", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        launch_template_and_overrides: node.xpath_node("*[local-name()='launchTemplateAndOverrides']").try { |n| LaunchTemplateAndOverridesResponse.from_xml(n) },
        lifecycle: (n = node.xpath_node("*[local-name()='lifecycle']")) ? AEC::InstanceLifecycle.from_json_object_key?(n.content) : nil,
        instance_ids: node.xpath_nodes("*[local-name()='instanceIds']/*[local-name()='item']").map { |n| n.content },
        instance_type: (n = node.xpath_node("*[local-name()='instanceType']")) ? AEC::InstanceType.from_json_object_key?(n.content) : nil,
        platform: (n = node.xpath_node("*[local-name()='platform']")) ? AEC::PlatformValues.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
      if value = @launch_template_and_overrides
        value.validate!
      end
    end

    def_equals_and_hash(@launch_template_and_overrides, @lifecycle, @instance_ids, @instance_type, @platform)
  end
end
