private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # The `ChangeSetSummary` structure describes a change set, its status, and the stack with which
  # it's associated.
  class ChangeSetSummary
    # The ID of the stack with which the change set is associated.
    property stack_id : String | Nil

    # The name of the stack with which the change set is associated.
    property stack_name : String | Nil

    # The ID of the change set.
    property change_set_id : String | Nil

    # The name of the change set.
    property change_set_name : String | Nil

    # If the change set execution status is `AVAILABLE`, you can execute the change set. If you can't
    # execute the change set, the status indicates why. For example, a change set might be in an
    # `UNAVAILABLE` state because CloudFormation is still creating it or in an `OBSOLETE` state
    # because the stack was already updated.
    property execution_status : ExecutionStatus | Nil

    # The state of the change set, such as `CREATE_PENDING`, `CREATE_COMPLETE`, or `FAILED`.
    property status : ChangeSetStatus | Nil

    # A description of the change set's status. For example, if your change set is in the `FAILED`
    # state, CloudFormation shows the error message.
    property status_reason : String | Nil

    # The start time when the change set was created, in UTC.
    property creation_time : Time | Nil

    # Descriptive information about the change set.
    property description : String | Nil

    # Specifies the current setting of `IncludeNestedStacks` for the change set.
    property include_nested_stacks : Bool | Nil

    # The parent change set ID.
    property parent_change_set_id : String | Nil

    # The root change set ID.
    property root_change_set_id : String | Nil

    # Indicates if the change set imports resources that already exist.
    property import_existing_resources : Bool | Nil

    def initialize(
      @stack_id : String | Nil = nil,
      @stack_name : String | Nil = nil,
      @change_set_id : String | Nil = nil,
      @change_set_name : String | Nil = nil,
      @execution_status : ExecutionStatus | Nil = nil,
      @status : ChangeSetStatus | Nil = nil,
      @status_reason : String | Nil = nil,
      @creation_time : Time | Nil = nil,
      @description : String | Nil = nil,
      @include_nested_stacks : Bool | Nil = nil,
      @parent_change_set_id : String | Nil = nil,
      @root_change_set_id : String | Nil = nil,
      @import_existing_resources : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @stack_id
        params << {"#{prefix}StackId", value}
      end

      if value = @stack_name
        params << {"#{prefix}StackName", value}
      end

      if value = @change_set_id
        params << {"#{prefix}ChangeSetId", value}
      end

      if value = @change_set_name
        params << {"#{prefix}ChangeSetName", value}
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

      if value = @creation_time
        params << {"#{prefix}CreationTime", Core::QueryValue.time(value)}
      end

      if value = @description
        params << {"#{prefix}Description", value}
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

      if value = @import_existing_resources
        params << {"#{prefix}ImportExistingResources", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_id: Core::XMLValue.string(node.xpath_node("*[local-name()='StackId']")),
        stack_name: Core::XMLValue.string(node.xpath_node("*[local-name()='StackName']")),
        change_set_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ChangeSetId']")),
        change_set_name: Core::XMLValue.string(node.xpath_node("*[local-name()='ChangeSetName']")),
        execution_status: (n = node.xpath_node("*[local-name()='ExecutionStatus']")) ? ACF::ExecutionStatus.from_json_object_key?(n.content) : nil,
        status: (n = node.xpath_node("*[local-name()='Status']")) ? ACF::ChangeSetStatus.from_json_object_key?(n.content) : nil,
        status_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='StatusReason']")),
        creation_time: Core::XMLValue.time(node.xpath_node("*[local-name()='CreationTime']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        include_nested_stacks: Core::XMLValue.bool(node.xpath_node("*[local-name()='IncludeNestedStacks']")),
        parent_change_set_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ParentChangeSetId']")),
        root_change_set_id: Core::XMLValue.string(node.xpath_node("*[local-name()='RootChangeSetId']")),
        import_existing_resources: Core::XMLValue.bool(node.xpath_node("*[local-name()='ImportExistingResources']")),
      )
    end

    def validate! : Nil
      if value = @change_set_id
        raise Core::ValidationError.new("ChangeSetId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ChangeSetId does not match the required pattern") unless value.matches?(Regex.new("^arn:[-a-zA-Z0-9:/]*$"))
      end

      if value = @change_set_name
        raise Core::ValidationError.new("ChangeSetName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ChangeSetName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("ChangeSetName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z][-a-zA-Z0-9]*$"))
      end

      if value = @description
        raise Core::ValidationError.new("Description length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Description length must be <= 1024") if value.size > 1024
      end

      if value = @parent_change_set_id
        raise Core::ValidationError.new("ParentChangeSetId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ParentChangeSetId does not match the required pattern") unless value.matches?(Regex.new("^arn:[-a-zA-Z0-9:/]*$"))
      end

      if value = @root_change_set_id
        raise Core::ValidationError.new("RootChangeSetId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("RootChangeSetId does not match the required pattern") unless value.matches?(Regex.new("^arn:[-a-zA-Z0-9:/]*$"))
      end
    end

    def_equals_and_hash(@stack_id, @stack_name, @change_set_id, @change_set_name, @execution_status, @status, @status_reason, @creation_time, @description, @include_nested_stacks, @parent_change_set_id, @root_change_set_id, @import_existing_resources)
  end
end
