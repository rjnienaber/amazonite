private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class Stack
    property stack_id : String | Nil

    property stack_name : String

    property change_set_id : String | Nil

    property description : String | Nil

    property parameters : Array(Parameter) | Nil

    property creation_time : Time

    property deletion_time : Time | Nil

    property last_updated_time : Time | Nil

    property rollback_configuration : RollbackConfiguration | Nil

    property stack_status : StackStatus

    property stack_status_reason : String | Nil

    property disable_rollback : Bool | Nil

    property deployment_config : DeploymentConfig | Nil

    property notification_ar_ns : Array(String) | Nil

    property timeout_in_minutes : Int32 | Nil

    property capabilities : Array(Capability) | Nil

    property outputs : Array(Output) | Nil

    property role_arn : String | Nil

    property tags : Array(Tag) | Nil

    property enable_termination_protection : Bool | Nil

    property parent_id : String | Nil

    property root_id : String | Nil

    property drift_information : StackDriftInformation | Nil

    property retain_except_on_create : Bool | Nil

    property deletion_mode : DeletionMode | Nil

    property detailed_status : DetailedStatus | Nil

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
  end
end
