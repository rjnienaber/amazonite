private alias AEB = Amazonite::EventBridgeV1

module Amazonite::EventBridgeV1
  # The custom parameters to be used when the target is an Amazon ECS task.
  class EcsParameters
    include JSON::Serializable

    # The ARN of the task definition to use if the event target is an Amazon ECS task.
    @[JSON::Field(key: "TaskDefinitionArn")]
    property task_definition_arn : String

    # The number of tasks to create based on `TaskDefinition`. The default is 1.
    @[JSON::Field(key: "TaskCount")]
    property task_count : Int32 | Nil

    # Specifies the launch type on which your task is running. The launch type that you specify here
    # must match one of the launch type (compatibilities) of the target task. The `FARGATE` value is
    # supported only in the Regions where Fargate with Amazon ECS is supported. For more information,
    # see [Fargate on Amazon
    # ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/AWS-Fargate.html) in the
    # *Amazon Elastic Container Service Developer Guide*.
    @[JSON::Field(key: "LaunchType", converter: AEB::LaunchType)]
    property launch_type : LaunchType | Nil

    # Use this structure if the Amazon ECS task uses the `awsvpc` network mode. This structure
    # specifies the VPC subnets and security groups associated with the task, and whether a public IP
    # address is to be used. This structure is required if `LaunchType` is `FARGATE` because the
    # `awsvpc` mode is required for Fargate tasks.
    #
    # If you specify `NetworkConfiguration` when the target ECS task does not use the `awsvpc` network
    # mode, the task fails.
    @[JSON::Field(key: "NetworkConfiguration")]
    property network_configuration : NetworkConfiguration | Nil

    # Specifies the platform version for the task. Specify only the numeric portion of the platform
    # version, such as `1.1.0`.
    #
    # This structure is used only if `LaunchType` is `FARGATE`. For more information about valid
    # platform versions, see [Fargate Platform
    # Versions](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/platform_versions.html) in
    # the *Amazon Elastic Container Service Developer Guide*.
    @[JSON::Field(key: "PlatformVersion")]
    property platform_version : String | Nil

    # Specifies an ECS task group for the task. The maximum length is 255 characters.
    @[JSON::Field(key: "Group")]
    property group : String | Nil

    # The capacity provider strategy to use for the task.
    #
    # If a `capacityProviderStrategy` is specified, the `launchType` parameter must be omitted. If no
    # `capacityProviderStrategy` or launchType is specified, the `defaultCapacityProviderStrategy` for
    # the cluster is used.
    @[JSON::Field(key: "CapacityProviderStrategy")]
    property capacity_provider_strategy : Array(CapacityProviderStrategyItem) | Nil

    # Specifies whether to enable Amazon ECS managed tags for the task. For more information, see
    # [Tagging Your Amazon ECS
    # Resources](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-using-tags.html) in
    # the Amazon Elastic Container Service Developer Guide.
    @[JSON::Field(key: "EnableECSManagedTags")]
    property enable_ecs_managed_tags : Bool | Nil

    # Whether or not to enable the execute command functionality for the containers in this task. If
    # true, this enables execute command functionality on all containers in the task.
    @[JSON::Field(key: "EnableExecuteCommand")]
    property enable_execute_command : Bool | Nil

    # An array of placement constraint objects to use for the task. You can specify up to 10
    # constraints per task (including constraints in the task definition and those specified at
    # runtime).
    @[JSON::Field(key: "PlacementConstraints")]
    property placement_constraints : Array(PlacementConstraint) | Nil

    # The placement strategy objects to use for the task. You can specify a maximum of five strategy
    # rules per task.
    @[JSON::Field(key: "PlacementStrategy")]
    property placement_strategy : Array(PlacementStrategy) | Nil

    # Specifies whether to propagate the tags from the task definition to the task. If no value is
    # specified, the tags are not propagated. Tags can only be propagated to the task during task
    # creation. To add tags to a task after task creation, use the TagResource API action.
    @[JSON::Field(key: "PropagateTags", converter: AEB::PropagateTags)]
    property propagate_tags : PropagateTags | Nil

    # The reference ID to use for the task.
    @[JSON::Field(key: "ReferenceId")]
    property reference_id : String | Nil

    # The metadata that you apply to the task to help you categorize and organize them. Each tag
    # consists of a key and an optional value, both of which you define. To learn more, see
    # [RunTask](https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_RunTask.html#ECS-RunTask-request-tags)
    # in the Amazon ECS API Reference.
    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    def initialize(
      @task_definition_arn : String,
      @task_count : Int32 | Nil = nil,
      @launch_type : LaunchType | Nil = nil,
      @network_configuration : NetworkConfiguration | Nil = nil,
      @platform_version : String | Nil = nil,
      @group : String | Nil = nil,
      @capacity_provider_strategy : Array(CapacityProviderStrategyItem) | Nil = nil,
      @enable_ecs_managed_tags : Bool | Nil = nil,
      @enable_execute_command : Bool | Nil = nil,
      @placement_constraints : Array(PlacementConstraint) | Nil = nil,
      @placement_strategy : Array(PlacementStrategy) | Nil = nil,
      @propagate_tags : PropagateTags | Nil = nil,
      @reference_id : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def_equals_and_hash(@task_definition_arn, @task_count, @launch_type, @network_configuration, @platform_version, @group, @capacity_provider_strategy, @enable_ecs_managed_tags, @enable_execute_command, @placement_constraints, @placement_strategy, @propagate_tags, @reference_id, @tags)
  end
end
