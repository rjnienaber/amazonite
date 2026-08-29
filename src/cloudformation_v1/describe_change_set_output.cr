private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class DescribeChangeSetOutput
    property change_set_name : String | Nil

    property change_set_id : String | Nil

    property stack_id : String | Nil

    property stack_name : String | Nil

    property description : String | Nil

    property parameters : Array(Parameter) | Nil

    property creation_time : Time | Nil

    property execution_status : ExecutionStatus | Nil

    property status : ChangeSetStatus | Nil

    property status_reason : String | Nil

    property stack_drift_status : StackDriftStatus | Nil

    property notification_ar_ns : Array(String) | Nil

    property rollback_configuration : RollbackConfiguration | Nil

    property capabilities : Array(Capability) | Nil

    property tags : Array(Tag) | Nil

    property changes : Array(Change) | Nil

    property next_token : String | Nil

    property include_nested_stacks : Bool | Nil

    property parent_change_set_id : String | Nil

    property root_change_set_id : String | Nil

    property on_stack_failure : OnStackFailure | Nil

    property import_existing_resources : Bool | Nil

    property deployment_mode : DeploymentMode | Nil

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
  end
end
