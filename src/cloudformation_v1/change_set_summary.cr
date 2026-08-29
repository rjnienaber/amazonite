private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ChangeSetSummary
    property stack_id : String | Nil

    property stack_name : String | Nil

    property change_set_id : String | Nil

    property change_set_name : String | Nil

    property execution_status : ExecutionStatus | Nil

    property status : ChangeSetStatus | Nil

    property status_reason : String | Nil

    property creation_time : Time | Nil

    property description : String | Nil

    property include_nested_stacks : Bool | Nil

    property parent_change_set_id : String | Nil

    property root_change_set_id : String | Nil

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
  end
end
