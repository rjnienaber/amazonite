private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # The input for the CreateChangeSet action.
  class CreateChangeSetInput
    # The name or the unique ID of the stack for which you are creating a change set. CloudFormation
    # generates the change set by comparing this stack's information with the information that you
    # submit, such as a modified template or different parameter input values.
    property stack_name : String

    # A structure that contains the body of the revised template, with a minimum length of 1 byte and
    # a maximum length of 51,200 bytes. CloudFormation generates the change set by comparing this
    # template with the template of the stack that you specified.
    #
    # Conditional: You must specify only one of the following parameters: `TemplateBody`,
    # `TemplateURL`, or set the `UsePreviousTemplate` to `true`.
    property template_body : String | Nil

    # The URL of the file that contains the revised template. The URL must point to a template (max
    # size: 1 MB) that's located in an Amazon S3 bucket or a Systems Manager document. CloudFormation
    # generates the change set by comparing this template with the stack that you specified. The
    # location for an Amazon S3 bucket must start with `https://`. URLs from S3 static websites are
    # not supported.
    #
    # Conditional: You must specify only one of the following parameters: `TemplateBody`,
    # `TemplateURL`, or set the `UsePreviousTemplate` to `true`.
    property template_url : String | Nil

    # Whether to reuse the template that's associated with the stack to create the change set.
    #
    # When using templates with the `AWS::LanguageExtensions` transform, provide the template instead
    # of using `UsePreviousTemplate` to ensure new parameter values and Systems Manager parameter
    # updates are applied correctly. For more information, see [AWS::LanguageExtensions
    # transform](https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/transform-aws-languageextensions.html).
    #
    # Conditional: You must specify only one of the following parameters: `TemplateBody`,
    # `TemplateURL`, or set the `UsePreviousTemplate` to `true`.
    property use_previous_template : Bool | Nil

    # A list of `Parameter` structures that specify input parameters for the change set. For more
    # information, see the Parameter data type.
    property parameters : Array(Parameter) | Nil

    # In some cases, you must explicitly acknowledge that your stack template contains certain
    # capabilities in order for CloudFormation to create the stack.
    #
    # - `CAPABILITY_IAM` and `CAPABILITY_NAMED_IAM`
    #
    # Some stack templates might include resources that can affect permissions in your Amazon Web
    # Services account, for example, by creating new IAM users. For those stacks, you must explicitly
    # acknowledge this by specifying one of these capabilities.
    #
    # The following IAM resources require you to specify either the `CAPABILITY_IAM` or
    # `CAPABILITY_NAMED_IAM` capability.
    #
    # - If you have IAM resources, you can specify either capability.
    #
    # - If you have IAM resources with custom names, you *must* specify `CAPABILITY_NAMED_IAM`.
    #
    # - If you don't specify either of these capabilities, CloudFormation returns an
    # `InsufficientCapabilities` error.
    #
    # If your stack template contains these resources, we suggest that you review all permissions
    # associated with them and edit their permissions if necessary.
    #
    # - [
    # AWS::IAM::AccessKey](https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-accesskey.html)
    #
    # - [
    # AWS::IAM::Group](https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-group.html)
    #
    # -
    # [AWS::IAM::InstanceProfile](https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-instanceprofile.html)
    #
    # - [
    # AWS::IAM::ManagedPolicy](https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-managedpolicy.html)
    #
    # - [
    # AWS::IAM::Policy](https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-policy.html)
    #
    # - [
    # AWS::IAM::Role](https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-role.html)
    #
    # - [
    # AWS::IAM::User](https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-user.html)
    #
    # -
    # [AWS::IAM::UserToGroupAddition](https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-usertogroupaddition.html)
    #
    # For more information, see [Acknowledging IAM resources in CloudFormation
    # templates](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/control-access-with-iam.html#using-iam-capabilities).
    #
    # - `CAPABILITY_AUTO_EXPAND`
    #
    # Some template contain macros. Macros perform custom processing on templates; this can include
    # simple actions like find-and-replace operations, all the way to extensive transformations of
    # entire templates. Because of this, users typically create a change set from the processed
    # template, so that they can review the changes resulting from the macros before actually creating
    # the stack. If your stack template contains one or more macros, and you choose to create a stack
    # directly from the processed template, without first reviewing the resulting changes in a change
    # set, you must acknowledge this capability. This includes the
    # [AWS::Include](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/transform-aws-include.html)
    # and
    # [AWS::Serverless](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/transform-aws-serverless.html)
    # transforms, which are macros hosted by CloudFormation.
    #
    # This capacity doesn't apply to creating change sets, and specifying it when creating change sets
    # has no effect.
    #
    # If you want to create a stack from a stack template that contains macros *and* nested stacks,
    # you must create or update the stack directly from the template using the CreateStack or
    # UpdateStack action, and specifying this capability.
    #
    # For more information about macros, see [Perform custom processing on CloudFormation templates
    # with template
    # macros](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-macros.html).
    #
    # Only one of the `Capabilities` and `ResourceType` parameters can be specified.
    property capabilities : Array(Capability) | Nil

    # Specifies which resource types you can work with, such as `AWS::EC2::Instance` or
    # `Custom::MyCustomInstance`.
    #
    # If the list of resource types doesn't include a resource type that you're updating, the stack
    # update fails. By default, CloudFormation grants permissions to all resource types. IAM uses this
    # parameter for condition keys in IAM policies for CloudFormation. For more information, see
    # [Control CloudFormation access with Identity and Access
    # Management](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/control-access-with-iam.html)
    # in the *CloudFormation User Guide*.
    #
    # Only one of the `Capabilities` and `ResourceType` parameters can be specified.
    property resource_types : Array(String) | Nil

    # The Amazon Resource Name (ARN) of an IAM role that CloudFormation assumes when executing the
    # change set. CloudFormation uses the role's credentials to make calls on your behalf.
    # CloudFormation uses this role for all future operations on the stack. Provided that users have
    # permission to operate on the stack, CloudFormation uses this role even if the users don't have
    # permission to pass it. Ensure that the role grants least permission.
    #
    # If you don't specify a value, CloudFormation uses the role that was previously associated with
    # the stack. If no role is available, CloudFormation uses a temporary session that is generated
    # from your user credentials.
    property role_arn : String | Nil

    # The rollback triggers for CloudFormation to monitor during stack creation and updating
    # operations, and for the specified monitoring period afterwards.
    property rollback_configuration : RollbackConfiguration | Nil

    # The Amazon Resource Names (ARNs) of Amazon SNS topics that CloudFormation associates with the
    # stack. To remove all associated notification topics, specify an empty list.
    property notification_ar_ns : Array(String) | Nil

    # Key-value pairs to associate with this stack. CloudFormation also propagates these tags to
    # resources in the stack. You can specify a maximum of 50 tags.
    property tags : Array(Tag) | Nil

    # The name of the change set. The name must be unique among all change sets that are associated
    # with the specified stack.
    #
    # A change set name can contain only alphanumeric, case sensitive characters, and hyphens. It must
    # start with an alphabetical character and can't exceed 128 characters.
    property change_set_name : String

    # A unique identifier for this `CreateChangeSet` request. Specify this token if you plan to retry
    # requests so that CloudFormation knows that you're not attempting to create another change set
    # with the same name. You might retry `CreateChangeSet` requests to ensure that CloudFormation
    # successfully received them.
    property client_token : String | Nil

    # A description to help you identify this change set.
    property description : String | Nil

    # The type of change set operation. To create a change set for a new stack, specify `CREATE`. To
    # create a change set for an existing stack, specify `UPDATE`. To create a change set for an
    # import operation, specify `IMPORT`.
    #
    # If you create a change set for a new stack, CloudFormation creates a stack with a unique stack
    # ID, but no template or resources. The stack will be in the `REVIEW_IN_PROGRESS` state until you
    # execute the change set.
    #
    # By default, CloudFormation specifies `UPDATE`. You can't use the `UPDATE` type to create a
    # change set for a new stack or the `CREATE` type to create a change set for an existing stack.
    property change_set_type : ChangeSetType | Nil

    # The resources to import into your stack.
    property resources_to_import : Array(ResourceToImport) | Nil

    # Creates a change set for the all nested stacks specified in the template. The default behavior
    # of this action is set to `False`. To include nested sets in a change set, specify `True`.
    property include_nested_stacks : Bool | Nil

    # Determines what action will be taken if stack creation fails. If this parameter is specified,
    # the `DisableRollback` parameter to the
    # [ExecuteChangeSet](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ExecuteChangeSet.html)
    # API operation must not be specified. This must be one of these values:
    #
    # - `DELETE` - Deletes the change set if the stack creation fails. This is only valid when the
    # `ChangeSetType` parameter is set to `CREATE`. If the deletion of the stack fails, the status of
    # the stack is `DELETE_FAILED`.
    #
    # - `DO_NOTHING` - if the stack creation fails, do nothing. This is equivalent to specifying
    # `true` for the `DisableRollback` parameter to the
    # [ExecuteChangeSet](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ExecuteChangeSet.html)
    # API operation.
    #
    # - `ROLLBACK` - if the stack creation fails, roll back the stack. This is equivalent to
    # specifying `false` for the `DisableRollback` parameter to the
    # [ExecuteChangeSet](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ExecuteChangeSet.html)
    # API operation.
    #
    # For nested stacks, when the `OnStackFailure` parameter is set to `DELETE` for the change set for
    # the parent stack, any failure in a child stack will cause the parent stack creation to fail and
    # all stacks to be deleted.
    property on_stack_failure : OnStackFailure | Nil

    # Indicates if the change set auto-imports resources that already exist. For more information, see
    # [Import Amazon Web Services resources into a CloudFormation stack
    # automatically](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/import-resources-automatically.html)
    # in the *CloudFormation User Guide*.
    #
    # This parameter can only import resources that have custom names in templates. For more
    # information, see [name
    # type](https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-properties-name.html)
    # in the *CloudFormation User Guide*. To import resources that do not accept custom names, such as
    # EC2 instances, use the `ResourcesToImport` parameter instead.
    property import_existing_resources : Bool | Nil

    # Determines how CloudFormation handles configuration drift during deployment.
    #
    # - `REVERT_DRIFT` – Creates a drift-aware change set that brings actual resource states in line
    # with template definitions. Provides a three-way comparison between actual state, previous
    # deployment state, and desired state.
    #
    # For more information, see [Using drift-aware change
    # sets](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/drift-aware-change-sets.html)
    # in the *CloudFormation User Guide*.
    property deployment_mode : DeploymentMode | Nil

    # The deployment configuration for this stack operation, including the deployment mode.
    property deployment_config : DeploymentConfig | Nil

    # Set to `true` to disable pre-deployment validations in changeset or stack operations.
    #
    # Default: `false`
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

    def_equals_and_hash(@stack_name, @template_body, @template_url, @use_previous_template, @parameters, @capabilities, @resource_types, @role_arn, @rollback_configuration, @notification_ar_ns, @tags, @change_set_name, @client_token, @description, @change_set_type, @resources_to_import, @include_nested_stacks, @on_stack_failure, @import_existing_resources, @deployment_mode, @deployment_config, @disable_validation)
  end
end
