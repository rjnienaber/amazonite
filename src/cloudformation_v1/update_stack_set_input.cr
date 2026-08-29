private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class UpdateStackSetInput
    property stack_set_name : String

    property description : String | Nil

    property template_body : String | Nil

    property template_url : String | Nil

    property use_previous_template : Bool | Nil

    property parameters : Array(Parameter) | Nil

    property capabilities : Array(Capability) | Nil

    property tags : Array(Tag) | Nil

    property operation_preferences : StackSetOperationPreferences | Nil

    property administration_role_arn : String | Nil

    property execution_role_name : String | Nil

    property deployment_targets : DeploymentTargets | Nil

    property permission_model : PermissionModels | Nil

    property auto_deployment : AutoDeployment | Nil

    property operation_id : String | Nil

    property accounts : Array(String) | Nil

    property regions : Array(String) | Nil

    property call_as : CallAs | Nil

    property managed_execution : ManagedExecution | Nil

    def initialize(
      @stack_set_name : String,
      @description : String | Nil = nil,
      @template_body : String | Nil = nil,
      @template_url : String | Nil = nil,
      @use_previous_template : Bool | Nil = nil,
      @parameters : Array(Parameter) | Nil = nil,
      @capabilities : Array(Capability) | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @operation_preferences : StackSetOperationPreferences | Nil = nil,
      @administration_role_arn : String | Nil = nil,
      @execution_role_name : String | Nil = nil,
      @deployment_targets : DeploymentTargets | Nil = nil,
      @permission_model : PermissionModels | Nil = nil,
      @auto_deployment : AutoDeployment | Nil = nil,
      @operation_id : String | Nil = nil,
      @accounts : Array(String) | Nil = nil,
      @regions : Array(String) | Nil = nil,
      @call_as : CallAs | Nil = nil,
      @managed_execution : ManagedExecution | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}StackSetName", @stack_set_name}

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @template_body
        params << {"#{prefix}TemplateBody", value}
      end

      if value = @template_url
        params << {"#{prefix}TemplateURL", value}
      end

      if value = @use_previous_template
        params << {"#{prefix}UsePreviousTemplate", Core::QueryValue.bool(value)}
      end

      (@parameters || [] of Parameter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Parameters.member.#{i}."))
      end

      (@capabilities || [] of Capability).each_with_index(1) do |item, i|
        params << {"#{prefix}Capabilities.member.#{i}", item.to_json_object_key}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Tags.member.#{i}."))
      end

      if value = @operation_preferences
        params.concat(value.to_query_params("#{prefix}OperationPreferences."))
      end

      if value = @administration_role_arn
        params << {"#{prefix}AdministrationRoleARN", value}
      end

      if value = @execution_role_name
        params << {"#{prefix}ExecutionRoleName", value}
      end

      if value = @deployment_targets
        params.concat(value.to_query_params("#{prefix}DeploymentTargets."))
      end

      if value = @permission_model
        params << {"#{prefix}PermissionModel", value.to_json_object_key}
      end

      if value = @auto_deployment
        params.concat(value.to_query_params("#{prefix}AutoDeployment."))
      end

      if value = @operation_id
        params << {"#{prefix}OperationId", value}
      end

      (@accounts || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}Accounts.member.#{i}", item}
      end

      (@regions || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}Regions.member.#{i}", item}
      end

      if value = @call_as
        params << {"#{prefix}CallAs", value.to_json_object_key}
      end

      if value = @managed_execution
        params.concat(value.to_query_params("#{prefix}ManagedExecution."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_set_name: Core::XMLValue.string(node.xpath_node("*[local-name()='StackSetName']")).not_nil!,
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        template_body: Core::XMLValue.string(node.xpath_node("*[local-name()='TemplateBody']")),
        template_url: Core::XMLValue.string(node.xpath_node("*[local-name()='TemplateURL']")),
        use_previous_template: Core::XMLValue.bool(node.xpath_node("*[local-name()='UsePreviousTemplate']")),
        parameters: node.xpath_nodes("*[local-name()='Parameters']/*[local-name()='member']").map { |n| Parameter.from_xml(n) },
        capabilities: node.xpath_nodes("*[local-name()='Capabilities']/*[local-name()='member']").compact_map { |n| ACF::Capability.from_json_object_key?(n.content) },
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
        operation_preferences: node.xpath_node("*[local-name()='OperationPreferences']").try { |n| StackSetOperationPreferences.from_xml(n) },
        administration_role_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='AdministrationRoleARN']")),
        execution_role_name: Core::XMLValue.string(node.xpath_node("*[local-name()='ExecutionRoleName']")),
        deployment_targets: node.xpath_node("*[local-name()='DeploymentTargets']").try { |n| DeploymentTargets.from_xml(n) },
        permission_model: (n = node.xpath_node("*[local-name()='PermissionModel']")) ? ACF::PermissionModels.from_json_object_key?(n.content) : nil,
        auto_deployment: node.xpath_node("*[local-name()='AutoDeployment']").try { |n| AutoDeployment.from_xml(n) },
        operation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='OperationId']")),
        accounts: node.xpath_nodes("*[local-name()='Accounts']/*[local-name()='member']").map { |n| n.content },
        regions: node.xpath_nodes("*[local-name()='Regions']/*[local-name()='member']").map { |n| n.content },
        call_as: (n = node.xpath_node("*[local-name()='CallAs']")) ? ACF::CallAs.from_json_object_key?(n.content) : nil,
        managed_execution: node.xpath_node("*[local-name()='ManagedExecution']").try { |n| ManagedExecution.from_xml(n) },
      )
    end
  end
end
