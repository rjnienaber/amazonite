private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the instances that were launched by the fleet.
  class CreateFleetInstance
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

    # The ID of the Availability Zone in which the instance was launched. For example, `use2-az1`.
    #
    # Supported only for fleets of type `instant`.
    property availability_zone_id : String | Nil

    # The name of the Availability Zone in which the instance was launched. For example, `us-east-2a`.
    #
    # Supported only for fleets of type `instant`.
    property availability_zone : String | Nil

    # The ID of the subnet in which the instance was launched.
    #
    # Supported only for fleets of type `instant`.
    property subnet_id : String | Nil

    def initialize(
      @launch_template_and_overrides : LaunchTemplateAndOverridesResponse | Nil = nil,
      @lifecycle : InstanceLifecycle | Nil = nil,
      @instance_ids : Array(String) | Nil = nil,
      @instance_type : InstanceType | Nil = nil,
      @platform : PlatformValues | Nil = nil,
      @availability_zone_id : String | Nil = nil,
      @availability_zone : String | Nil = nil,
      @subnet_id : String | Nil = nil,
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

      if value = @availability_zone_id
        params << {"#{prefix}AvailabilityZoneId", value}
      end

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end

      if value = @subnet_id
        params << {"#{prefix}SubnetId", value}
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
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZoneId']")),
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZone']")),
        subnet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='subnetId']")),
      )
    end

    def validate! : Nil
      if value = @launch_template_and_overrides
        value.validate!
      end
    end

    def_equals_and_hash(@launch_template_and_overrides, @lifecycle, @instance_ids, @instance_type, @platform, @availability_zone_id, @availability_zone, @subnet_id)
  end
end
