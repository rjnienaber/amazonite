private alias Core = Amazonite::Core

module Amazonite::EC2
  class EnableFastLaunchRequest
    # Specify the ID of the image for which to enable Windows fast launch.
    property image_id : String

    # The type of resource to use for pre-provisioning the AMI for Windows fast launch. Supported
    # values include: `snapshot`, which is the default value.
    property resource_type : String | Nil

    # Configuration settings for creating and managing the snapshots that are used for
    # pre-provisioning the AMI for Windows fast launch. The associated `ResourceType` must be
    # `snapshot`.
    property snapshot_configuration : FastLaunchSnapshotConfigurationRequest | Nil

    # The launch template to use when launching Windows instances from pre-provisioned snapshots.
    # Launch template parameters can include either the name or ID of the launch template, but not
    # both.
    property launch_template : FastLaunchLaunchTemplateSpecificationRequest | Nil

    # The maximum number of instances that Amazon EC2 can launch at the same time to create
    # pre-provisioned snapshots for Windows fast launch. Value must be `6` or greater.
    property max_parallel_launches : Int32 | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @image_id : String,
      @resource_type : String | Nil = nil,
      @snapshot_configuration : FastLaunchSnapshotConfigurationRequest | Nil = nil,
      @launch_template : FastLaunchLaunchTemplateSpecificationRequest | Nil = nil,
      @max_parallel_launches : Int32 | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ImageId", @image_id}

      if value = @resource_type
        params << {"#{prefix}ResourceType", value}
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

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        image_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ImageId']")).not_nil!,
        resource_type: Core::XMLValue.string(node.xpath_node("*[local-name()='ResourceType']")),
        snapshot_configuration: node.xpath_node("*[local-name()='SnapshotConfiguration']").try { |n| FastLaunchSnapshotConfigurationRequest.from_xml(n) },
        launch_template: node.xpath_node("*[local-name()='LaunchTemplate']").try { |n| FastLaunchLaunchTemplateSpecificationRequest.from_xml(n) },
        max_parallel_launches: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxParallelLaunches']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
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

    def_equals_and_hash(@image_id, @resource_type, @snapshot_configuration, @launch_template, @max_parallel_launches, @dry_run)
  end
end
