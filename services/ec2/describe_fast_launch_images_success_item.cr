private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describe details about a Windows image with Windows fast launch enabled that meets the requested
  # criteria. Criteria are defined by the `DescribeFastLaunchImages` action filters.
  class DescribeFastLaunchImagesSuccessItem
    # The image ID that identifies the Windows fast launch enabled image.
    property image_id : String | Nil

    # The resource type that Amazon EC2 uses for pre-provisioning the Windows AMI. Supported values
    # include: `snapshot`.
    property resource_type : FastLaunchResourceType | Nil

    # A group of parameters that are used for pre-provisioning the associated Windows AMI using
    # snapshots.
    property snapshot_configuration : FastLaunchSnapshotConfigurationResponse | Nil

    # The launch template that the Windows fast launch enabled AMI uses when it launches Windows
    # instances from pre-provisioned snapshots.
    property launch_template : FastLaunchLaunchTemplateSpecificationResponse | Nil

    # The maximum number of instances that Amazon EC2 can launch at the same time to create
    # pre-provisioned snapshots for Windows fast launch.
    property max_parallel_launches : Int32 | Nil

    # The owner ID for the Windows fast launch enabled AMI.
    property owner_id : String | Nil

    # The current state of Windows fast launch for the specified Windows AMI.
    property state : FastLaunchStateCode | Nil

    # The reason that Windows fast launch for the AMI changed to the current state.
    property state_transition_reason : String | Nil

    # The time that Windows fast launch for the AMI changed to the current state.
    property state_transition_time : Time | Nil

    def initialize(
      @image_id : String | Nil = nil,
      @resource_type : FastLaunchResourceType | Nil = nil,
      @snapshot_configuration : FastLaunchSnapshotConfigurationResponse | Nil = nil,
      @launch_template : FastLaunchLaunchTemplateSpecificationResponse | Nil = nil,
      @max_parallel_launches : Int32 | Nil = nil,
      @owner_id : String | Nil = nil,
      @state : FastLaunchStateCode | Nil = nil,
      @state_transition_reason : String | Nil = nil,
      @state_transition_time : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @image_id
        params << {"#{prefix}ImageId", value}
      end

      if value = @resource_type
        params << {"#{prefix}ResourceType", value.to_json_object_key}
      end

      if value = @snapshot_configuration
        params.concat(value.to_query_params("#{prefix}SnapshotConfiguration."))
      end

      if value = @launch_template
        params.concat(value.to_query_params("#{prefix}LaunchTemplate."))
      end

      if value = @max_parallel_launches
        params << {"#{prefix}MaxParallelLaunches", value.to_s}
      end

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @state_transition_reason
        params << {"#{prefix}StateTransitionReason", value}
      end

      if value = @state_transition_time
        params << {"#{prefix}StateTransitionTime", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        image_id: Core::XMLValue.string(node.xpath_node("*[local-name()='imageId']")),
        resource_type: (n = node.xpath_node("*[local-name()='resourceType']")) ? AEC::FastLaunchResourceType.from_json_object_key?(n.content) : nil,
        snapshot_configuration: node.xpath_node("*[local-name()='snapshotConfiguration']").try { |n| FastLaunchSnapshotConfigurationResponse.from_xml(n) },
        launch_template: node.xpath_node("*[local-name()='launchTemplate']").try { |n| FastLaunchLaunchTemplateSpecificationResponse.from_xml(n) },
        max_parallel_launches: Core::XMLValue.i32(node.xpath_node("*[local-name()='maxParallelLaunches']")),
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::FastLaunchStateCode.from_json_object_key?(n.content) : nil,
        state_transition_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='stateTransitionReason']")),
        state_transition_time: Core::XMLValue.time(node.xpath_node("*[local-name()='stateTransitionTime']")),
      )
    end

    def validate! : Nil
      if value = @snapshot_configuration
        value.validate!
      end

      if value = @launch_template
        value.validate!
      end
    end

    def_equals_and_hash(@image_id, @resource_type, @snapshot_configuration, @launch_template, @max_parallel_launches, @owner_id, @state, @state_transition_reason, @state_transition_time)
  end
end
