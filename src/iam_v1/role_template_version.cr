private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  # Contains information about a version of an IAM role template, including the configuration that
  # is used to create roles with
  # [AcquireRole](https://docs.aws.amazon.com/IAM/latest/APIReference/API_AcquireRole.html). This
  # structure is returned as a response element by the
  # [GetRoleTemplateVersion](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetRoleTemplateVersion.html)
  # operation.
  class RoleTemplateVersion
    # The Amazon Resource Name (ARN) that identifies the role template.
    #
    # For more information about ARNs, see [Amazon Resource Names
    # (ARNs)](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html) in the
    # *Amazon Web Services General Reference*.
    property template_arn : String | Nil

    # The friendly name that identifies the role template.
    property template_name : String | Nil

    # The identifier of the role template version.
    property template_version_id : String | Nil

    # The description of the role template.
    property description : String | Nil

    # The major version number of the role template.
    property major_version : Int32 | Nil

    # The minor version that the service uses by default when you create a role from this template
    # without specifying a minor version.
    property default_minor_version : Int32 | Nil

    # Indicates that the role template is managed by an Amazon Web Services service.
    property managed_by_type : ManagedByTypeType | Nil

    # The identifier of the Amazon Web Services service that manages the role template.
    property managed_by_value : String | Nil

    # Specifies whether the role template is enabled. When a template is disabled, you cannot create
    # roles from it.
    property enabled : Bool | Nil

    # The minor version number of this role template version.
    property minor_version : Int32 | Nil

    # The pattern that is used to generate the name of a role that is created from this template. The
    # pattern can include `@{parameter}` placeholders that are replaced with the values you supply in
    # the `ReplacementValues` parameter of
    # [AcquireRole](https://docs.aws.amazon.com/IAM/latest/APIReference/API_AcquireRole.html).
    property role_name_pattern : String | Nil

    # The pattern that is used to generate the path of a role that is created from this template.
    property role_path_pattern : String | Nil

    # The pattern that is used to generate the description of a role that is created from this
    # template.
    property role_description_pattern : String | Nil

    # The trust policy template that grants an entity permission to assume roles that you create from
    # this template.
    property assume_role_policy_document_template : String | Nil

    # A list of inline policy templates that the service embeds in roles that you create from this
    # template.
    property inline_policy_templates : Array(InlinePolicy) | Nil

    # A list of the ARNs of the managed policies that the service attaches to roles that you create
    # from this template.
    property managed_policy_arns : Array(String) | Nil

    # The ARN of the policy that sets the permissions boundary for roles that you create from this
    # template.
    #
    # For more information about ARNs, see [Amazon Resource Names
    # (ARNs)](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html) in the
    # *Amazon Web Services General Reference*.
    property permission_boundary_arn : String | Nil

    # A list of the parameters that are defined for this role template version. You supply values for
    # these parameters when you create a role with
    # [AcquireRole](https://docs.aws.amazon.com/IAM/latest/APIReference/API_AcquireRole.html).
    property parameters_definition : Array(ParameterDefinition) | Nil

    # A list of tag templates that are applied to roles that are created from this template.
    property role_tags_template : Array(TagTemplate) | Nil

    # The maximum session duration (in seconds) for roles that are created from this template.
    property max_session_duration : Int32 | Nil

    # Specifies whether this specific minor version of the role template is enabled.
    property version_enabled : Bool | Nil

    # The date and time, in [ISO 8601 date-time format](http://www.iso.org/iso/iso8601), when the role
    # template version was created.
    property create_timestamp : Time | Nil

    # The date and time, in [ISO 8601 date-time format](http://www.iso.org/iso/iso8601), when the role
    # template version was last updated.
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

    def_equals_and_hash(@template_arn, @template_name, @template_version_id, @description, @major_version, @default_minor_version, @managed_by_type, @managed_by_value, @enabled, @minor_version, @role_name_pattern, @role_path_pattern, @role_description_pattern, @assume_role_policy_document_template, @inline_policy_templates, @managed_policy_arns, @permission_boundary_arn, @parameters_definition, @role_tags_template, @max_session_duration, @version_enabled, @create_timestamp, @update_timestamp)
  end
end
