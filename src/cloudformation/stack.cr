private alias ACF = Amazonite::CloudFormation
private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  # The `Stack` data type.
  class Stack
    # Unique identifier of the stack.
    property stack_id : String | Nil

    # The name associated with the stack.
    property stack_name : String

    # The unique ID of the change set.
    property change_set_id : String | Nil

    # A user-defined description associated with the stack.
    property description : String | Nil

    # A list of `Parameter` structures.
    property parameters : Array(Parameter) | Nil

    # The time at which the stack was created.
    property creation_time : Time

    # The time the stack was deleted.
    property deletion_time : Time | Nil

    # The time the stack was last updated. This field will only be returned if the stack has been
    # updated at least once.
    property last_updated_time : Time | Nil

    # The rollback triggers for CloudFormation to monitor during stack creation and updating
    # operations, and for the specified monitoring period afterwards.
    property rollback_configuration : RollbackConfiguration | Nil

    # Current status of the stack.
    property stack_status : StackStatus

    # Success/failure message associated with the stack status.
    property stack_status_reason : String | Nil

    # Boolean to enable or disable rollback on stack creation failures:
    #
    # - `true`: disable rollback.
    #
    # - `false`: enable rollback.
    property disable_rollback : Bool | Nil

    # The deployment configuration for the stack, including the deployment mode used for stack
    # operations.
    property deployment_config : DeploymentConfig | Nil

    # Amazon SNS topic Amazon Resource Names (ARNs) to which stack related events are published.
    property notification_ar_ns : Array(String) | Nil

    # The amount of time within which stack creation should complete.
    property timeout_in_minutes : Int32 | Nil

    # The capabilities allowed in the stack.
    property capabilities : Array(Capability) | Nil

    # A list of output structures.
    property outputs : Array(Output) | Nil

    # The Amazon Resource Name (ARN) of an IAM role that's associated with the stack. During a stack
    # operation, CloudFormation uses this role's credentials to make calls on your behalf.
    property role_arn : String | Nil

    # A list of `Tag`s that specify information about the stack.
    property tags : Array(Tag) | Nil

    # Whether termination protection is enabled for the stack.
    #
    # For [nested
    # stacks](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-nested-stacks.html),
    # termination protection is set on the root stack and can't be changed directly on the nested
    # stack. For more information, see [Protect a CloudFormation stack from being
    # deleted](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-protect-stacks.html)
    # in the *CloudFormation User Guide*.
    property enable_termination_protection : Bool | Nil

    # For nested stacks, the stack ID of the direct parent of this stack. For the first level of
    # nested stacks, the root stack is also the parent stack.
    #
    # For more information, see [Nested
    # stacks](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-nested-stacks.html)
    # in the *CloudFormation User Guide*.
    property parent_id : String | Nil

    # For nested stacks, the stack ID of the top-level stack to which the nested stack ultimately
    # belongs.
    #
    # For more information, see [Nested
    # stacks](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-nested-stacks.html)
    # in the *CloudFormation User Guide*.
    property root_id : String | Nil

    # Information about whether a stack's actual configuration differs, or has *drifted*, from its
    # expected configuration, as defined in the stack template and any values specified as template
    # parameters. For more information, see [Detect unmanaged configuration changes to stacks and
    # resources with drift
    # detection](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html).
    property drift_information : StackDriftInformation | Nil

    # When set to `true`, newly created resources are deleted when the operation rolls back. This
    # includes newly created resources marked with a deletion policy of `Retain`.
    #
    # Default: `false`
    property retain_except_on_create : Bool | Nil

    # Specifies the deletion mode for the stack. Possible values are:
    #
    # - `STANDARD` - Use the standard behavior. Specifying this value is the same as not specifying
    # this parameter.
    #
    # - `FORCE_DELETE_STACK` - Delete the stack if it's stuck in a `DELETE_FAILED` state due to
    # resource deletion failure.
    property deletion_mode : DeletionMode | Nil

    # The detailed status of the resource or stack. If `CONFIGURATION_COMPLETE` is present, the
    # resource or resource configuration phase has completed and the stabilization of the resources is
    # in progress. The StackSets `CONFIGURATION_COMPLETE` when all of the resources in the stack have
    # reached that event. For more information, see [Understand CloudFormation stack creation
    # events](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stack-resource-configuration-complete.html)
    # in the *CloudFormation User Guide*.
    property detailed_status : DetailedStatus | Nil

    # Information about the most recent operations performed on this stack.
    property last_operations : Array(OperationEntry) | Nil

    def initialize(
      @stack_name : String,
      @creation_time : Time,
      @stack_status : StackStatus,
      @stack_id : String | Nil = nil,
      @change_set_id : String | Nil = nil,
      @description : String | Nil = nil,
      @parameters : Array(Parameter) | Nil = nil,
      @deletion_time : Time | Nil = nil,
      @last_updated_time : Time | Nil = nil,
      @rollback_configuration : RollbackConfiguration | Nil = nil,
      @stack_status_reason : String | Nil = nil,
      @disable_rollback : Bool | Nil = nil,
      @deployment_config : DeploymentConfig | Nil = nil,
      @notification_ar_ns : Array(String) | Nil = nil,
      @timeout_in_minutes : Int32 | Nil = nil,
      @capabilities : Array(Capability) | Nil = nil,
      @outputs : Array(Output) | Nil = nil,
      @role_arn : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @enable_termination_protection : Bool | Nil = nil,
      @parent_id : String | Nil = nil,
      @root_id : String | Nil = nil,
      @drift_information : StackDriftInformation | Nil = nil,
      @retain_except_on_create : Bool | Nil = nil,
      @deletion_mode : DeletionMode | Nil = nil,
      @detailed_status : DetailedStatus | Nil = nil,
      @last_operations : Array(OperationEntry) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @stack_id
        params << {"#{prefix}StackId", value}
      end

      params << {"#{prefix}StackName", @stack_name}

      if value = @change_set_id
        params << {"#{prefix}ChangeSetId", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      (@parameters || [] of Parameter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Parameters.member.#{i}."))
      end

      params << {"#{prefix}CreationTime", Core::QueryValue.time(@creation_time)}

      if value = @deletion_time
        params << {"#{prefix}DeletionTime", Core::QueryValue.time(value)}
      end

      if value = @last_updated_time
        params << {"#{prefix}LastUpdatedTime", Core::QueryValue.time(value)}
      end

      if value = @rollback_configuration
        params.concat(value.to_query_params("#{prefix}RollbackConfiguration."))
      end

      params << {"#{prefix}StackStatus", @stack_status.to_json_object_key}

      if value = @stack_status_reason
        params << {"#{prefix}StackStatusReason", value}
      end

      if value = @disable_rollback
        params << {"#{prefix}DisableRollback", Core::QueryValue.bool(value)}
      end

      if value = @deployment_config
        params.concat(value.to_query_params("#{prefix}DeploymentConfig."))
      end

      (@notification_ar_ns || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}NotificationARNs.member.#{i}", item}
      end

      if value = @timeout_in_minutes
        params << {"#{prefix}TimeoutInMinutes", value.to_s}
      end

      (@capabilities || [] of Capability).each_with_index(1) do |item, i|
        params << {"#{prefix}Capabilities.member.#{i}", item.to_json_object_key}
      end

      (@outputs || [] of Output).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Outputs.member.#{i}."))
      end

      if value = @role_arn
        params << {"#{prefix}RoleARN", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Tags.member.#{i}."))
      end

      if value = @enable_termination_protection
        params << {"#{prefix}EnableTerminationProtection", Core::QueryValue.bool(value)}
      end

      if value = @parent_id
        params << {"#{prefix}ParentId", value}
      end

      if value = @root_id
        params << {"#{prefix}RootId", value}
      end

      if value = @drift_information
        params.concat(value.to_query_params("#{prefix}DriftInformation."))
      end

      if value = @retain_except_on_create
        params << {"#{prefix}RetainExceptOnCreate", Core::QueryValue.bool(value)}
      end

      if value = @deletion_mode
        params << {"#{prefix}DeletionMode", value.to_json_object_key}
      end

      if value = @detailed_status
        params << {"#{prefix}DetailedStatus", value.to_json_object_key}
      end

      (@last_operations || [] of OperationEntry).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}LastOperations.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_id: Core::XMLValue.string(node.xpath_node("*[local-name()='StackId']")),
        stack_name: Core::XMLValue.string(node.xpath_node("*[local-name()='StackName']")).not_nil!,
        change_set_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ChangeSetId']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        parameters: node.xpath_nodes("*[local-name()='Parameters']/*[local-name()='member']").map { |n| Parameter.from_xml(n) },
        creation_time: Core::XMLValue.time(node.xpath_node("*[local-name()='CreationTime']")).not_nil!,
        deletion_time: Core::XMLValue.time(node.xpath_node("*[local-name()='DeletionTime']")),
        last_updated_time: Core::XMLValue.time(node.xpath_node("*[local-name()='LastUpdatedTime']")),
        rollback_configuration: node.xpath_node("*[local-name()='RollbackConfiguration']").try { |n| RollbackConfiguration.from_xml(n) },
        stack_status: ((n = node.xpath_node("*[local-name()='StackStatus']")) ? ACF::StackStatus.from_json_object_key?(n.content) : nil).not_nil!,
        stack_status_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='StackStatusReason']")),
        disable_rollback: Core::XMLValue.bool(node.xpath_node("*[local-name()='DisableRollback']")),
        deployment_config: node.xpath_node("*[local-name()='DeploymentConfig']").try { |n| DeploymentConfig.from_xml(n) },
        notification_ar_ns: node.xpath_nodes("*[local-name()='NotificationARNs']/*[local-name()='member']").map { |n| n.content },
        timeout_in_minutes: Core::XMLValue.i32(node.xpath_node("*[local-name()='TimeoutInMinutes']")),
        capabilities: node.xpath_nodes("*[local-name()='Capabilities']/*[local-name()='member']").compact_map { |n| ACF::Capability.from_json_object_key?(n.content) },
        outputs: node.xpath_nodes("*[local-name()='Outputs']/*[local-name()='member']").map { |n| Output.from_xml(n) },
        role_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='RoleARN']")),
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
        enable_termination_protection: Core::XMLValue.bool(node.xpath_node("*[local-name()='EnableTerminationProtection']")),
        parent_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ParentId']")),
        root_id: Core::XMLValue.string(node.xpath_node("*[local-name()='RootId']")),
        drift_information: node.xpath_node("*[local-name()='DriftInformation']").try { |n| StackDriftInformation.from_xml(n) },
        retain_except_on_create: Core::XMLValue.bool(node.xpath_node("*[local-name()='RetainExceptOnCreate']")),
        deletion_mode: (n = node.xpath_node("*[local-name()='DeletionMode']")) ? ACF::DeletionMode.from_json_object_key?(n.content) : nil,
        detailed_status: (n = node.xpath_node("*[local-name()='DetailedStatus']")) ? ACF::DetailedStatus.from_json_object_key?(n.content) : nil,
        last_operations: node.xpath_nodes("*[local-name()='LastOperations']/*[local-name()='member']").map { |n| OperationEntry.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @change_set_id
        raise Core::ValidationError.new("ChangeSetId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ChangeSetId does not match the required pattern") unless value.matches?(Regex.new("^arn:[-a-zA-Z0-9:/]*$"))
      end

      if value = @description
        raise Core::ValidationError.new("Description length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Description length must be <= 1024") if value.size > 1024
      end

      if value = @parameters
        value.each(&.validate!)
      end

      if value = @rollback_configuration
        value.validate!
      end

      if value = @deployment_config
        value.validate!
      end

      if value = @notification_ar_ns
        raise Core::ValidationError.new("NotificationARNs must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("NotificationARNs must have at most 5 item(s)") if value.size > 5
      end

      if value = @timeout_in_minutes
        raise Core::ValidationError.new("TimeoutInMinutes value must be >= 1") if value < 1
      end

      if value = @outputs
        value.each(&.validate!)
      end

      if value = @role_arn
        raise Core::ValidationError.new("RoleARN length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("RoleARN length must be <= 2048") if value.size > 2048
      end

      if value = @tags
        raise Core::ValidationError.new("Tags must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Tags must have at most 50 item(s)") if value.size > 50
        value.each(&.validate!)
      end

      if value = @drift_information
        value.validate!
      end

      if value = @last_operations
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@stack_id, @stack_name, @change_set_id, @description, @parameters, @creation_time, @deletion_time, @last_updated_time, @rollback_configuration, @stack_status, @stack_status_reason, @disable_rollback, @deployment_config, @notification_ar_ns, @timeout_in_minutes, @capabilities, @outputs, @role_arn, @tags, @enable_termination_protection, @parent_id, @root_id, @drift_information, @retain_except_on_create, @deletion_mode, @detailed_status, @last_operations)
  end
end
