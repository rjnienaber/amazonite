private alias AS = Amazonite::Ssm
private alias Core = Amazonite::Core

module Amazonite::Ssm
  class RegisterTargetWithMaintenanceWindowRequest
    include JSON::Serializable

    # The ID of the maintenance window the target should be registered with.
    @[JSON::Field(key: "WindowId")]
    property window_id : String

    # The type of target being registered with the maintenance window.
    @[JSON::Field(key: "ResourceType", converter: AS::MaintenanceWindowResourceType)]
    property resource_type : MaintenanceWindowResourceType

    # The targets to register with the maintenance window. In other words, the managed nodes to run
    # commands on when the maintenance window runs.
    #
    # If a single maintenance window task is registered with multiple targets, its task invocations
    # occur sequentially and not in parallel. If your task must run on multiple targets at the same
    # time, register a task for each target individually and assign each task the same priority level.
    #
    # You can specify targets using managed node IDs, resource group names, or tags that have been
    # applied to managed nodes.
    #
    # **Example 1**: Specify managed node IDs
    #
    # `Key=InstanceIds,Values=,,`
    #
    # **Example 2**: Use tag key-pairs applied to managed nodes
    #
    # `Key=tag:,Values=,`
    #
    # **Example 3**: Use tag-keys applied to managed nodes
    #
    # `Key=tag-key,Values=,`
    #
    # **Example 4**: Use resource group names
    #
    # `Key=resource-groups:Name,Values=`
    #
    # **Example 5**: Use filters for resource group types
    #
    # `Key=resource-groups:ResourceTypeFilters,Values=,`
    #
    # For `Key=resource-groups:ResourceTypeFilters`, specify resource types in the following format
    #
    # `Key=resource-groups:ResourceTypeFilters,Values=AWS::EC2::INSTANCE,AWS::EC2::VPC`
    #
    # For more information about these examples formats, including the best use case for each one, see
    # [Examples: Register targets with a maintenance
    # window](https://docs.aws.amazon.com/systems-manager/latest/userguide/mw-cli-tutorial-targets-examples.html)
    # in the *Amazon Web Services Systems Manager User Guide*.
    @[JSON::Field(key: "Targets")]
    property targets : Array(Target) = [] of Target

    # User-provided value that will be included in any Amazon CloudWatch Events events raised while
    # running tasks for these targets in this maintenance window.
    @[JSON::Field(key: "OwnerInformation")]
    property owner_information : String | Nil

    # An optional name for the target.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # An optional description for the target.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # User-provided idempotency token.
    @[JSON::Field(key: "ClientToken")]
    property client_token : String | Nil

    def initialize(
      @window_id : String,
      @resource_type : MaintenanceWindowResourceType,
      @targets : Array(Target),
      @owner_information : String | Nil = nil,
      @name : String | Nil = nil,
      @description : String | Nil = nil,
      @client_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @window_id
        raise Core::ValidationError.new("WindowId length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("WindowId length must be <= 20") if value.size > 20
        raise Core::ValidationError.new("WindowId does not match the required pattern") unless value.matches?(Regex.new("^mw-[0-9a-f]{17}$"))
      end

      if value = @targets
        raise Core::ValidationError.new("Targets must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Targets must have at most 5 item(s)") if value.size > 5
        value.each(&.validate!)
      end

      if value = @owner_information
        raise Core::ValidationError.new("OwnerInformation length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("OwnerInformation length must be <= 128") if value.size > 128
      end

      if value = @name
        raise Core::ValidationError.new("Name length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("Name length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("Name does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-.]{3,128}$"))
      end

      if value = @description
        raise Core::ValidationError.new("Description length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Description length must be <= 128") if value.size > 128
      end

      if value = @client_token
        raise Core::ValidationError.new("ClientToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ClientToken length must be <= 64") if value.size > 64
      end
    end

    def_equals_and_hash(@window_id, @resource_type, @targets, @owner_information, @name, @description, @client_token)
  end
end
