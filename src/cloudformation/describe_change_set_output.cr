private alias ACF = Amazonite::CloudFormation
private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  # The output for the DescribeChangeSet action.
  class DescribeChangeSetOutput
    # The name of the change set.
    property change_set_name : String | Nil

    # The Amazon Resource Name (ARN) of the change set.
    property change_set_id : String | Nil

    # The Amazon Resource Name (ARN) of the stack that's associated with the change set.
    property stack_id : String | Nil

    # The name of the stack that's associated with the change set.
    property stack_name : String | Nil

    # Information about the change set.
    property description : String | Nil

    # A list of `Parameter` structures that describes the input parameters and their values used to
    # create the change set. For more information, see the
    # [Parameter](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_Parameter.html)
    # data type.
    property parameters : Array(Parameter) | Nil

    # The start time when the change set was created, in UTC.
    property creation_time : Time | Nil

    # If the change set execution status is `AVAILABLE`, you can execute the change set. If you can't
    # execute the change set, the status indicates why. For example, a change set might be in an
    # `UNAVAILABLE` state because CloudFormation is still creating it or in an `OBSOLETE` state
    # because the stack was already updated.
    property execution_status : ExecutionStatus | Nil

    # The current status of the change set, such as `CREATE_PENDING`, `CREATE_COMPLETE`, or `FAILED`.
    property status : ChangeSetStatus | Nil

    # A description of the change set's status. For example, if your attempt to create a change set
    # failed, CloudFormation shows the error message.
    property status_reason : String | Nil

    # The drift status of the stack when the change set was created. Valid values:
    #
    # - `DRIFTED` – The stack has drifted from its last deployment.
    #
    # - `IN_SYNC` – The stack is in sync with its last deployment.
    #
    # - `NOT_CHECKED` – CloudFormation doesn’t currently return this value.
    #
    # - `UNKNOWN` – The drift status could not be determined.
    #
    # Only present for drift-aware change sets.
    property stack_drift_status : StackDriftStatus | Nil

    # The ARNs of the Amazon SNS topics that will be associated with the stack if you execute the
    # change set.
    property notification_ar_ns : Array(String) | Nil

    # The rollback triggers for CloudFormation to monitor during stack creation and updating
    # operations, and for the specified monitoring period afterwards.
    property rollback_configuration : RollbackConfiguration | Nil

    # If you execute the change set, the list of capabilities that were explicitly acknowledged when
    # the change set was created.
    property capabilities : Array(Capability) | Nil

    # If you execute the change set, the tags that will be associated with the stack.
    property tags : Array(Tag) | Nil

    # A list of `Change` structures that describes the resources CloudFormation changes if you execute
    # the change set.
    property changes : Array(Change) | Nil

    # If the output exceeds 1 MB, a string that identifies the next page of changes. If there is no
    # additional page, this value is null.
    property next_token : String | Nil

    # Verifies if `IncludeNestedStacks` is set to `True`.
    property include_nested_stacks : Bool | Nil

    # Specifies the change set ID of the parent change set in the current nested change set hierarchy.
    property parent_change_set_id : String | Nil

    # Specifies the change set ID of the root change set in the current nested change set hierarchy.
    property root_change_set_id : String | Nil

    # Determines what action will be taken if stack creation fails. When this parameter is specified,
    # the `DisableRollback` parameter to the
    # [ExecuteChangeSet](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ExecuteChangeSet.html)
    # API operation must not be specified. This must be one of these values:
    #
    # - `DELETE` - Deletes the change set if the stack creation fails. This is only valid when the
    # `ChangeSetType` parameter is set to `CREATE`. If the deletion of the stack fails, the status of
    # the stack is `DELETE_FAILED`.
    #
    # - `DO_NOTHING` - if the stack creation fails, do nothing. This is equivalent to specifying
    # `true` for the `DisableRollback` parameter to the
    # [ExecuteChangeSet](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ExecuteChangeSet.html)
    # API operation.
    #
    # - `ROLLBACK` - if the stack creation fails, roll back the stack. This is equivalent to
    # specifying `false` for the `DisableRollback` parameter to the
    # [ExecuteChangeSet](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ExecuteChangeSet.html)
    # API operation.
    property on_stack_failure : OnStackFailure | Nil

    # Indicates if the change set imports resources that already exist.
    #
    # This parameter can only import resources that have [custom
    # names](https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-properties-name.html)
    # in templates. To import resources that do not accept custom names, such as EC2 instances, use
    # the [resource
    # import](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/resource-import.html)
    # feature instead.
    property import_existing_resources : Bool | Nil

    # The deployment mode specified when the change set was created. Valid value is `REVERT_DRIFT`.
    # Only present for drift-aware change sets.
    property deployment_mode : DeploymentMode | Nil

    # The deployment configuration specified when the change set was created.
    property deployment_config : DeploymentConfig | Nil

    def initialize(
      @change_set_name : String | Nil = nil,
      @change_set_id : String | Nil = nil,
      @stack_id : String | Nil = nil,
      @stack_name : String | Nil = nil,
      @description : String | Nil = nil,
      @parameters : Array(Parameter) | Nil = nil,
      @creation_time : Time | Nil = nil,
      @execution_status : ExecutionStatus | Nil = nil,
      @status : ChangeSetStatus | Nil = nil,
      @status_reason : String | Nil = nil,
      @stack_drift_status : StackDriftStatus | Nil = nil,
      @notification_ar_ns : Array(String) | Nil = nil,
      @rollback_configuration : RollbackConfiguration | Nil = nil,
      @capabilities : Array(Capability) | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @changes : Array(Change) | Nil = nil,
      @next_token : String | Nil = nil,
      @include_nested_stacks : Bool | Nil = nil,
      @parent_change_set_id : String | Nil = nil,
      @root_change_set_id : String | Nil = nil,
      @on_stack_failure : OnStackFailure | Nil = nil,
      @import_existing_resources : Bool | Nil = nil,
      @deployment_mode : DeploymentMode | Nil = nil,
      @deployment_config : DeploymentConfig | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @change_set_name
        params << {"#{prefix}ChangeSetName", value}
      end

      if value = @change_set_id
        params << {"#{prefix}ChangeSetId", value}
      end

      if value = @stack_id
        params << {"#{prefix}StackId", value}
      end

      if value = @stack_name
        params << {"#{prefix}StackName", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      (@parameters || [] of Parameter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Parameters.member.#{i}."))
      end

      if value = @creation_time
        params << {"#{prefix}CreationTime", Core::QueryValue.time(value)}
      end

      if value = @execution_status
        params << {"#{prefix}ExecutionStatus", value.to_json_object_key}
      end

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end

      if value = @status_reason
        params << {"#{prefix}StatusReason", value}
      end

      if value = @stack_drift_status
        params << {"#{prefix}StackDriftStatus", value.to_json_object_key}
      end

      (@notification_ar_ns || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}NotificationARNs.member.#{i}", item}
      end

      if value = @rollback_configuration
        params.concat(value.to_query_params("#{prefix}RollbackConfiguration."))
      end

      (@capabilities || [] of Capability).each_with_index(1) do |item, i|
        params << {"#{prefix}Capabilities.member.#{i}", item.to_json_object_key}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Tags.member.#{i}."))
      end

      (@changes || [] of Change).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Changes.member.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      if value = @include_nested_stacks
        params << {"#{prefix}IncludeNestedStacks", Core::QueryValue.bool(value)}
      end

      if value = @parent_change_set_id
        params << {"#{prefix}ParentChangeSetId", value}
      end

      if value = @root_change_set_id
        params << {"#{prefix}RootChangeSetId", value}
      end

      if value = @on_stack_failure
        params << {"#{prefix}OnStackFailure", value.to_json_object_key}
      end

      if value = @import_existing_resources
        params << {"#{prefix}ImportExistingResources", Core::QueryValue.bool(value)}
      end

      if value = @deployment_mode
        params << {"#{prefix}DeploymentMode", value.to_json_object_key}
      end

      if value = @deployment_config
        params.concat(value.to_query_params("#{prefix}DeploymentConfig."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        change_set_name: Core::XMLValue.string(node.xpath_node("*[local-name()='ChangeSetName']")),
        change_set_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ChangeSetId']")),
        stack_id: Core::XMLValue.string(node.xpath_node("*[local-name()='StackId']")),
        stack_name: Core::XMLValue.string(node.xpath_node("*[local-name()='StackName']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        parameters: node.xpath_nodes("*[local-name()='Parameters']/*[local-name()='member']").map { |n| Parameter.from_xml(n) },
        creation_time: Core::XMLValue.time(node.xpath_node("*[local-name()='CreationTime']")),
        execution_status: (n = node.xpath_node("*[local-name()='ExecutionStatus']")) ? ACF::ExecutionStatus.from_json_object_key?(n.content) : nil,
        status: (n = node.xpath_node("*[local-name()='Status']")) ? ACF::ChangeSetStatus.from_json_object_key?(n.content) : nil,
        status_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='StatusReason']")),
        stack_drift_status: (n = node.xpath_node("*[local-name()='StackDriftStatus']")) ? ACF::StackDriftStatus.from_json_object_key?(n.content) : nil,
        notification_ar_ns: node.xpath_nodes("*[local-name()='NotificationARNs']/*[local-name()='member']").map { |n| n.content },
        rollback_configuration: node.xpath_node("*[local-name()='RollbackConfiguration']").try { |n| RollbackConfiguration.from_xml(n) },
        capabilities: node.xpath_nodes("*[local-name()='Capabilities']/*[local-name()='member']").compact_map { |n| ACF::Capability.from_json_object_key?(n.content) },
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
        changes: node.xpath_nodes("*[local-name()='Changes']/*[local-name()='member']").map { |n| Change.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        include_nested_stacks: Core::XMLValue.bool(node.xpath_node("*[local-name()='IncludeNestedStacks']")),
        parent_change_set_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ParentChangeSetId']")),
        root_change_set_id: Core::XMLValue.string(node.xpath_node("*[local-name()='RootChangeSetId']")),
        on_stack_failure: (n = node.xpath_node("*[local-name()='OnStackFailure']")) ? ACF::OnStackFailure.from_json_object_key?(n.content) : nil,
        import_existing_resources: Core::XMLValue.bool(node.xpath_node("*[local-name()='ImportExistingResources']")),
        deployment_mode: (n = node.xpath_node("*[local-name()='DeploymentMode']")) ? ACF::DeploymentMode.from_json_object_key?(n.content) : nil,
        deployment_config: node.xpath_node("*[local-name()='DeploymentConfig']").try { |n| DeploymentConfig.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @change_set_name
        raise Core::ValidationError.new("ChangeSetName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ChangeSetName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("ChangeSetName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z][-a-zA-Z0-9]*$"))
      end

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

      if value = @notification_ar_ns
        raise Core::ValidationError.new("NotificationARNs must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("NotificationARNs must have at most 5 item(s)") if value.size > 5
      end

      if value = @rollback_configuration
        value.validate!
      end

      if value = @tags
        raise Core::ValidationError.new("Tags must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Tags must have at most 50 item(s)") if value.size > 50
        value.each(&.validate!)
      end

      if value = @changes
        value.each(&.validate!)
      end

      if value = @next_token
        raise Core::ValidationError.new("NextToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NextToken length must be <= 1024") if value.size > 1024
      end

      if value = @parent_change_set_id
        raise Core::ValidationError.new("ParentChangeSetId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ParentChangeSetId does not match the required pattern") unless value.matches?(Regex.new("^arn:[-a-zA-Z0-9:/]*$"))
      end

      if value = @root_change_set_id
        raise Core::ValidationError.new("RootChangeSetId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("RootChangeSetId does not match the required pattern") unless value.matches?(Regex.new("^arn:[-a-zA-Z0-9:/]*$"))
      end

      if value = @deployment_config
        value.validate!
      end
    end

    def_equals_and_hash(@change_set_name, @change_set_id, @stack_id, @stack_name, @description, @parameters, @creation_time, @execution_status, @status, @status_reason, @stack_drift_status, @notification_ar_ns, @rollback_configuration, @capabilities, @tags, @changes, @next_token, @include_nested_stacks, @parent_change_set_id, @root_change_set_id, @on_stack_failure, @import_existing_resources, @deployment_mode, @deployment_config)
  end
end
