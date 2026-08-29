private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class UpdateStackInput
    property stack_name : String

    property template_body : String | Nil

    property template_url : String | Nil

    property use_previous_template : Bool | Nil

    property stack_policy_during_update_body : String | Nil

    property stack_policy_during_update_url : String | Nil

    property parameters : Array(Parameter) | Nil

    property capabilities : Array(Capability) | Nil

    property resource_types : Array(String) | Nil

    property role_arn : String | Nil

    property rollback_configuration : RollbackConfiguration | Nil

    property stack_policy_body : String | Nil

    property stack_policy_url : String | Nil

    property notification_ar_ns : Array(String) | Nil

    property tags : Array(Tag) | Nil

    property disable_rollback : Bool | Nil

    property client_request_token : String | Nil

    property retain_except_on_create : Bool | Nil

    property deployment_config : DeploymentConfig | Nil

    property disable_validation : Bool | Nil

    def initialize(
      @stack_name : String,
      @template_body : String | Nil = nil,
      @template_url : String | Nil = nil,
      @use_previous_template : Bool | Nil = nil,
      @stack_policy_during_update_body : String | Nil = nil,
      @stack_policy_during_update_url : String | Nil = nil,
      @parameters : Array(Parameter) | Nil = nil,
      @capabilities : Array(Capability) | Nil = nil,
      @resource_types : Array(String) | Nil = nil,
      @role_arn : String | Nil = nil,
      @rollback_configuration : RollbackConfiguration | Nil = nil,
      @stack_policy_body : String | Nil = nil,
      @stack_policy_url : String | Nil = nil,
      @notification_ar_ns : Array(String) | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @disable_rollback : Bool | Nil = nil,
      @client_request_token : String | Nil = nil,
      @retain_except_on_create : Bool | Nil = nil,
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

      if value = @stack_policy_during_update_body
        params << {"#{prefix}StackPolicyDuringUpdateBody", value}
      end

      if value = @stack_policy_during_update_url
        params << {"#{prefix}StackPolicyDuringUpdateURL", value}
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

      if value = @stack_policy_body
        params << {"#{prefix}StackPolicyBody", value}
      end

      if value = @stack_policy_url
        params << {"#{prefix}StackPolicyURL", value}
      end

      (@notification_ar_ns || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}NotificationARNs.member.#{i}", item}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Tags.member.#{i}."))
      end

      if value = @disable_rollback
        params << {"#{prefix}DisableRollback", Core::QueryValue.bool(value)}
      end

      if value = @client_request_token
        params << {"#{prefix}ClientRequestToken", value}
      end

      if value = @retain_except_on_create
        params << {"#{prefix}RetainExceptOnCreate", Core::QueryValue.bool(value)}
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
        stack_policy_during_update_body: Core::XMLValue.string(node.xpath_node("*[local-name()='StackPolicyDuringUpdateBody']")),
        stack_policy_during_update_url: Core::XMLValue.string(node.xpath_node("*[local-name()='StackPolicyDuringUpdateURL']")),
        parameters: node.xpath_nodes("*[local-name()='Parameters']/*[local-name()='member']").map { |n| Parameter.from_xml(n) },
        capabilities: node.xpath_nodes("*[local-name()='Capabilities']/*[local-name()='member']").compact_map { |n| ACF::Capability.from_json_object_key?(n.content) },
        resource_types: node.xpath_nodes("*[local-name()='ResourceTypes']/*[local-name()='member']").map { |n| n.content },
        role_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='RoleARN']")),
        rollback_configuration: node.xpath_node("*[local-name()='RollbackConfiguration']").try { |n| RollbackConfiguration.from_xml(n) },
        stack_policy_body: Core::XMLValue.string(node.xpath_node("*[local-name()='StackPolicyBody']")),
        stack_policy_url: Core::XMLValue.string(node.xpath_node("*[local-name()='StackPolicyURL']")),
        notification_ar_ns: node.xpath_nodes("*[local-name()='NotificationARNs']/*[local-name()='member']").map { |n| n.content },
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
        disable_rollback: Core::XMLValue.bool(node.xpath_node("*[local-name()='DisableRollback']")),
        client_request_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientRequestToken']")),
        retain_except_on_create: Core::XMLValue.bool(node.xpath_node("*[local-name()='RetainExceptOnCreate']")),
        deployment_config: node.xpath_node("*[local-name()='DeploymentConfig']").try { |n| DeploymentConfig.from_xml(n) },
        disable_validation: Core::XMLValue.bool(node.xpath_node("*[local-name()='DisableValidation']")),
      )
    end
  end
end
