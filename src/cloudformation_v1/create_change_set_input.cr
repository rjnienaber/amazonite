private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class CreateChangeSetInput
    property stack_name : String

    property template_body : String | Nil

    property template_url : String | Nil

    property use_previous_template : Bool | Nil

    property parameters : Array(Parameter) | Nil

    property capabilities : Array(Capability) | Nil

    property resource_types : Array(String) | Nil

    property role_arn : String | Nil

    property rollback_configuration : RollbackConfiguration | Nil

    property notification_ar_ns : Array(String) | Nil

    property tags : Array(Tag) | Nil

    property change_set_name : String

    property client_token : String | Nil

    property description : String | Nil

    property change_set_type : ChangeSetType | Nil

    property resources_to_import : Array(ResourceToImport) | Nil

    property include_nested_stacks : Bool | Nil

    property on_stack_failure : OnStackFailure | Nil

    property import_existing_resources : Bool | Nil

    property deployment_mode : DeploymentMode | Nil

    property deployment_config : DeploymentConfig | Nil

    property disable_validation : Bool | Nil

    def initialize(
      @stack_name : String,
      @change_set_name : String,
      @template_body : String | Nil = nil,
      @template_url : String | Nil = nil,
      @use_previous_template : Bool | Nil = nil,
      @parameters : Array(Parameter) | Nil = nil,
      @capabilities : Array(Capability) | Nil = nil,
      @resource_types : Array(String) | Nil = nil,
      @role_arn : String | Nil = nil,
      @rollback_configuration : RollbackConfiguration | Nil = nil,
      @notification_ar_ns : Array(String) | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @client_token : String | Nil = nil,
      @description : String | Nil = nil,
      @change_set_type : ChangeSetType | Nil = nil,
      @resources_to_import : Array(ResourceToImport) | Nil = nil,
      @include_nested_stacks : Bool | Nil = nil,
      @on_stack_failure : OnStackFailure | Nil = nil,
      @import_existing_resources : Bool | Nil = nil,
      @deployment_mode : DeploymentMode | Nil = nil,
      @deployment_config : DeploymentConfig | Nil = nil,
      @disable_validation : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}StackName", @stack_name}

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

      (@resource_types || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ResourceTypes.member.#{i}", item}
      end

      if value = @role_arn
        params << {"#{prefix}RoleARN", value}
      end

      if value = @rollback_configuration
        params.concat(value.to_query_params("#{prefix}RollbackConfiguration."))
      end

      (@notification_ar_ns || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}NotificationARNs.member.#{i}", item}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Tags.member.#{i}."))
      end

      params << {"#{prefix}ChangeSetName", @change_set_name}

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @change_set_type
        params << {"#{prefix}ChangeSetType", value.to_json_object_key}
      end

      (@resources_to_import || [] of ResourceToImport).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ResourcesToImport.member.#{i}."))
      end

      if value = @include_nested_stacks
        params << {"#{prefix}IncludeNestedStacks", Core::QueryValue.bool(value)}
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

      if value = @disable_validation
        params << {"#{prefix}DisableValidation", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_name: Core::XMLValue.string(node.xpath_node("*[local-name()='StackName']")).not_nil!,
        template_body: Core::XMLValue.string(node.xpath_node("*[local-name()='TemplateBody']")),
        template_url: Core::XMLValue.string(node.xpath_node("*[local-name()='TemplateURL']")),
        use_previous_template: Core::XMLValue.bool(node.xpath_node("*[local-name()='UsePreviousTemplate']")),
        parameters: node.xpath_nodes("*[local-name()='Parameters']/*[local-name()='member']").map { |n| Parameter.from_xml(n) },
        capabilities: node.xpath_nodes("*[local-name()='Capabilities']/*[local-name()='member']").compact_map { |n| ACF::Capability.from_json_object_key?(n.content) },
        resource_types: node.xpath_nodes("*[local-name()='ResourceTypes']/*[local-name()='member']").map { |n| n.content },
        role_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='RoleARN']")),
        rollback_configuration: node.xpath_node("*[local-name()='RollbackConfiguration']").try { |n| RollbackConfiguration.from_xml(n) },
        notification_ar_ns: node.xpath_nodes("*[local-name()='NotificationARNs']/*[local-name()='member']").map { |n| n.content },
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
        change_set_name: Core::XMLValue.string(node.xpath_node("*[local-name()='ChangeSetName']")).not_nil!,
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        change_set_type: (n = node.xpath_node("*[local-name()='ChangeSetType']")) ? ACF::ChangeSetType.from_json_object_key?(n.content) : nil,
        resources_to_import: node.xpath_nodes("*[local-name()='ResourcesToImport']/*[local-name()='member']").map { |n| ResourceToImport.from_xml(n) },
        include_nested_stacks: Core::XMLValue.bool(node.xpath_node("*[local-name()='IncludeNestedStacks']")),
        on_stack_failure: (n = node.xpath_node("*[local-name()='OnStackFailure']")) ? ACF::OnStackFailure.from_json_object_key?(n.content) : nil,
        import_existing_resources: Core::XMLValue.bool(node.xpath_node("*[local-name()='ImportExistingResources']")),
        deployment_mode: (n = node.xpath_node("*[local-name()='DeploymentMode']")) ? ACF::DeploymentMode.from_json_object_key?(n.content) : nil,
        deployment_config: node.xpath_node("*[local-name()='DeploymentConfig']").try { |n| DeploymentConfig.from_xml(n) },
        disable_validation: Core::XMLValue.bool(node.xpath_node("*[local-name()='DisableValidation']")),
      )
    end
  end
end
