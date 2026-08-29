private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class CreateStackSetInput
    property stack_set_name : String

    property description : String | Nil

    property template_body : String | Nil

    property template_url : String | Nil

    property stack_id : String | Nil

    property parameters : Array(Parameter) | Nil

    property capabilities : Array(Capability) | Nil

    property tags : Array(Tag) | Nil

    property administration_role_arn : String | Nil

    property execution_role_name : String | Nil

    property permission_model : PermissionModels | Nil

    property auto_deployment : AutoDeployment | Nil

    property call_as : CallAs | Nil

    property client_request_token : String | Nil

    property managed_execution : ManagedExecution | Nil

    def initialize(
      @stack_set_name : String,
      @description : String | Nil = nil,
      @template_body : String | Nil = nil,
      @template_url : String | Nil = nil,
      @stack_id : String | Nil = nil,
      @parameters : Array(Parameter) | Nil = nil,
      @capabilities : Array(Capability) | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @administration_role_arn : String | Nil = nil,
      @execution_role_name : String | Nil = nil,
      @permission_model : PermissionModels | Nil = nil,
      @auto_deployment : AutoDeployment | Nil = nil,
      @call_as : CallAs | Nil = nil,
      @client_request_token : String | Nil = nil,
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

      if value = @stack_id
        params << {"#{prefix}StackId", value}
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

      if value = @administration_role_arn
        params << {"#{prefix}AdministrationRoleARN", value}
      end

      if value = @execution_role_name
        params << {"#{prefix}ExecutionRoleName", value}
      end

      if value = @permission_model
        params << {"#{prefix}PermissionModel", value.to_json_object_key}
      end

      if value = @auto_deployment
        params.concat(value.to_query_params("#{prefix}AutoDeployment."))
      end

      if value = @call_as
        params << {"#{prefix}CallAs", value.to_json_object_key}
      end

      if value = @client_request_token
        params << {"#{prefix}ClientRequestToken", value}
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
        stack_id: Core::XMLValue.string(node.xpath_node("*[local-name()='StackId']")),
        parameters: node.xpath_nodes("*[local-name()='Parameters']/*[local-name()='member']").map { |n| Parameter.from_xml(n) },
        capabilities: node.xpath_nodes("*[local-name()='Capabilities']/*[local-name()='member']").compact_map { |n| ACF::Capability.from_json_object_key?(n.content) },
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
        administration_role_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='AdministrationRoleARN']")),
        execution_role_name: Core::XMLValue.string(node.xpath_node("*[local-name()='ExecutionRoleName']")),
        permission_model: (n = node.xpath_node("*[local-name()='PermissionModel']")) ? ACF::PermissionModels.from_json_object_key?(n.content) : nil,
        auto_deployment: node.xpath_node("*[local-name()='AutoDeployment']").try { |n| AutoDeployment.from_xml(n) },
        call_as: (n = node.xpath_node("*[local-name()='CallAs']")) ? ACF::CallAs.from_json_object_key?(n.content) : nil,
        client_request_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientRequestToken']")),
        managed_execution: node.xpath_node("*[local-name()='ManagedExecution']").try { |n| ManagedExecution.from_xml(n) },
      )
    end
  end
end
