private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  class RoleTemplateVersion
    property template_arn : String | Nil

    property template_name : String | Nil

    property template_version_id : String | Nil

    property description : String | Nil

    property major_version : Int32 | Nil

    property default_minor_version : Int32 | Nil

    property managed_by_type : ManagedByTypeType | Nil

    property managed_by_value : String | Nil

    property enabled : Bool | Nil

    property minor_version : Int32 | Nil

    property role_name_pattern : String | Nil

    property role_path_pattern : String | Nil

    property role_description_pattern : String | Nil

    property assume_role_policy_document_template : String | Nil

    property inline_policy_templates : Array(InlinePolicy) | Nil

    property managed_policy_arns : Array(String) | Nil

    property permission_boundary_arn : String | Nil

    property parameters_definition : Array(ParameterDefinition) | Nil

    property role_tags_template : Array(TagTemplate) | Nil

    property max_session_duration : Int32 | Nil

    property version_enabled : Bool | Nil

    property create_timestamp : Time | Nil

    property update_timestamp : Time | Nil

    def initialize(
      @template_arn : String | Nil = nil,
      @template_name : String | Nil = nil,
      @template_version_id : String | Nil = nil,
      @description : String | Nil = nil,
      @major_version : Int32 | Nil = nil,
      @default_minor_version : Int32 | Nil = nil,
      @managed_by_type : ManagedByTypeType | Nil = nil,
      @managed_by_value : String | Nil = nil,
      @enabled : Bool | Nil = nil,
      @minor_version : Int32 | Nil = nil,
      @role_name_pattern : String | Nil = nil,
      @role_path_pattern : String | Nil = nil,
      @role_description_pattern : String | Nil = nil,
      @assume_role_policy_document_template : String | Nil = nil,
      @inline_policy_templates : Array(InlinePolicy) | Nil = nil,
      @managed_policy_arns : Array(String) | Nil = nil,
      @permission_boundary_arn : String | Nil = nil,
      @parameters_definition : Array(ParameterDefinition) | Nil = nil,
      @role_tags_template : Array(TagTemplate) | Nil = nil,
      @max_session_duration : Int32 | Nil = nil,
      @version_enabled : Bool | Nil = nil,
      @create_timestamp : Time | Nil = nil,
      @update_timestamp : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @template_arn
        params << {"#{prefix}TemplateArn", value}
      end

      if value = @template_name
        params << {"#{prefix}TemplateName", value}
      end

      if value = @template_version_id
        params << {"#{prefix}TemplateVersionId", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @major_version
        params << {"#{prefix}MajorVersion", value.to_s}
      end

      if value = @default_minor_version
        params << {"#{prefix}DefaultMinorVersion", value.to_s}
      end

      if value = @managed_by_type
        params << {"#{prefix}ManagedByType", value.to_json_object_key}
      end

      if value = @managed_by_value
        params << {"#{prefix}ManagedByValue", value}
      end

      if value = @enabled
        params << {"#{prefix}Enabled", Core::QueryValue.bool(value)}
      end

      if value = @minor_version
        params << {"#{prefix}MinorVersion", value.to_s}
      end

      if value = @role_name_pattern
        params << {"#{prefix}RoleNamePattern", value}
      end

      if value = @role_path_pattern
        params << {"#{prefix}RolePathPattern", value}
      end

      if value = @role_description_pattern
        params << {"#{prefix}RoleDescriptionPattern", value}
      end

      if value = @assume_role_policy_document_template
        params << {"#{prefix}AssumeRolePolicyDocumentTemplate", value}
      end

      (@inline_policy_templates || [] of InlinePolicy).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}InlinePolicyTemplates.member.#{i}."))
      end

      (@managed_policy_arns || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ManagedPolicyArns.member.#{i}", item}
      end

      if value = @permission_boundary_arn
        params << {"#{prefix}PermissionBoundaryArn", value}
      end

      (@parameters_definition || [] of ParameterDefinition).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ParametersDefinition.member.#{i}."))
      end

      (@role_tags_template || [] of TagTemplate).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}RoleTagsTemplate.member.#{i}."))
      end

      if value = @max_session_duration
        params << {"#{prefix}MaxSessionDuration", value.to_s}
      end

      if value = @version_enabled
        params << {"#{prefix}VersionEnabled", Core::QueryValue.bool(value)}
      end

      if value = @create_timestamp
        params << {"#{prefix}CreateTimestamp", Core::QueryValue.time(value)}
      end

      if value = @update_timestamp
        params << {"#{prefix}UpdateTimestamp", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        template_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='TemplateArn']")),
        template_name: Core::XMLValue.string(node.xpath_node("*[local-name()='TemplateName']")),
        template_version_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TemplateVersionId']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        major_version: Core::XMLValue.i32(node.xpath_node("*[local-name()='MajorVersion']")),
        default_minor_version: Core::XMLValue.i32(node.xpath_node("*[local-name()='DefaultMinorVersion']")),
        managed_by_type: (n = node.xpath_node("*[local-name()='ManagedByType']")) ? AI::ManagedByTypeType.from_json_object_key?(n.content) : nil,
        managed_by_value: Core::XMLValue.string(node.xpath_node("*[local-name()='ManagedByValue']")),
        enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='Enabled']")),
        minor_version: Core::XMLValue.i32(node.xpath_node("*[local-name()='MinorVersion']")),
        role_name_pattern: Core::XMLValue.string(node.xpath_node("*[local-name()='RoleNamePattern']")),
        role_path_pattern: Core::XMLValue.string(node.xpath_node("*[local-name()='RolePathPattern']")),
        role_description_pattern: Core::XMLValue.string(node.xpath_node("*[local-name()='RoleDescriptionPattern']")),
        assume_role_policy_document_template: Core::XMLValue.string(node.xpath_node("*[local-name()='AssumeRolePolicyDocumentTemplate']")),
        inline_policy_templates: node.xpath_nodes("*[local-name()='InlinePolicyTemplates']/*[local-name()='member']").map { |n| InlinePolicy.from_xml(n) },
        managed_policy_arns: node.xpath_nodes("*[local-name()='ManagedPolicyArns']/*[local-name()='member']").map { |n| n.content },
        permission_boundary_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='PermissionBoundaryArn']")),
        parameters_definition: node.xpath_nodes("*[local-name()='ParametersDefinition']/*[local-name()='member']").map { |n| ParameterDefinition.from_xml(n) },
        role_tags_template: node.xpath_nodes("*[local-name()='RoleTagsTemplate']/*[local-name()='member']").map { |n| TagTemplate.from_xml(n) },
        max_session_duration: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxSessionDuration']")),
        version_enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='VersionEnabled']")),
        create_timestamp: Core::XMLValue.time(node.xpath_node("*[local-name()='CreateTimestamp']")),
        update_timestamp: Core::XMLValue.time(node.xpath_node("*[local-name()='UpdateTimestamp']")),
      )
    end
  end
end
