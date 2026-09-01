private alias ACF = Amazonite::CloudFormation
private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  class UpdateStackSetInput
    # The name or unique ID of the StackSet that you want to update.
    property stack_set_name : String

    # A brief description of updates that you are making.
    property description : String | Nil

    # The structure that contains the template body, with a minimum length of 1 byte and a maximum
    # length of 51,200 bytes.
    #
    # Conditional: You must specify only one of the following parameters: `TemplateBody` or
    # `TemplateURL`—or set `UsePreviousTemplate` to true.
    property template_body : String | Nil

    # The URL of a file that contains the template body. The URL must point to a template (maximum
    # size: 1 MB) that is located in an Amazon S3 bucket or a Systems Manager document. The location
    # for an Amazon S3 bucket must start with `https://`. S3 static website URLs are not supported.
    #
    # Conditional: You must specify only one of the following parameters: `TemplateBody` or
    # `TemplateURL`—or set `UsePreviousTemplate` to true.
    property template_url : String | Nil

    # Use the existing template that's associated with the StackSet that you're updating.
    #
    # Conditional: You must specify only one of the following parameters: `TemplateBody` or
    # `TemplateURL`—or set `UsePreviousTemplate` to true.
    property use_previous_template : Bool | Nil

    # A list of input parameters for the StackSet template.
    property parameters : Array(Parameter) | Nil

    # In some cases, you must explicitly acknowledge that your stack template contains certain
    # capabilities in order for CloudFormation to update the StackSet and its associated stack
    # instances.
    #
    # - `CAPABILITY_IAM` and `CAPABILITY_NAMED_IAM`
    #
    # Some stack templates might include resources that can affect permissions in your Amazon Web
    # Services account, for example, by creating new IAM users. For those stacks sets, you must
    # explicitly acknowledge this by specifying one of these capabilities.
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
    # If your stack template contains these resources, we recommend that you review all permissions
    # associated with them and edit their permissions if necessary.
    #
    # -
    # [AWS::IAM::AccessKey](https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-accesskey.html)
    #
    # -
    # [AWS::IAM::Group](https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-group.html)
    #
    # -
    # [AWS::IAM::InstanceProfile](https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-instanceprofile.html)
    #
    # -
    # [AWS::IAM::Policy](https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-policy.html)
    #
    # -
    # [AWS::IAM::Role](https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-role.html)
    #
    # -
    # [AWS::IAM::User](https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-user.html)
    #
    # -
    # [AWS::IAM::UserToGroupAddition](https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-usertogroupaddition.html)
    #
    # For more information, see [Acknowledging IAM resources in CloudFormation
    # templates](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/control-access-with-iam.html#using-iam-capabilities).
    #
    # - `CAPABILITY_AUTO_EXPAND`
    #
    # Some templates reference macros. If your StackSet template references one or more macros, you
    # must update the StackSet directly from the processed template, without first reviewing the
    # resulting changes in a change set. To update the StackSet directly, you must acknowledge this
    # capability. For more information, see [Perform custom processing on CloudFormation templates
    # with template
    # macros](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-macros.html).
    #
    # StackSets with service-managed permissions do not currently support the use of macros in
    # templates. (This includes the
    # [AWS::Include](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/transform-aws-include.html)
    # and
    # [AWS::Serverless](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/transform-aws-serverless.html)
    # transforms, which are macros hosted by CloudFormation.) Even if you specify this capability for
    # a StackSet with service-managed permissions, if you reference a macro in your template the
    # StackSet operation will fail.
    property capabilities : Array(Capability) | Nil

    # The key-value pairs to associate with this StackSet and the stacks created from it.
    # CloudFormation also propagates these tags to supported resources that are created in the stacks.
    # You can specify a maximum number of 50 tags.
    #
    # If you specify tags for this parameter, those tags replace any list of tags that are currently
    # associated with this StackSet. This means:
    #
    # - If you don't specify this parameter, CloudFormation doesn't modify the stack's tags.
    #
    # - If you specify *any* tags using this parameter, you must specify *all* the tags that you want
    # associated with this StackSet, even tags you've specified before (for example, when creating the
    # StackSet or during a previous update of the StackSet.). Any tags that you don't include in the
    # updated list of tags are removed from the StackSet, and therefore from the stacks and resources
    # as well.
    #
    # - If you specify an empty value, CloudFormation removes all currently associated tags.
    #
    # If you specify new tags as part of an `UpdateStackSet` action, CloudFormation checks to see if
    # you have the required IAM permission to tag resources. If you omit tags that are currently
    # associated with the StackSet from the list of tags you specify, CloudFormation assumes that you
    # want to remove those tags from the StackSet, and checks to see if you have permission to untag
    # resources. If you don't have the necessary permission(s), the entire `UpdateStackSet` action
    # fails with an `access denied` error, and the StackSet is not updated.
    property tags : Array(Tag) | Nil

    # Preferences for how CloudFormation performs this StackSet operation.
    property operation_preferences : StackSetOperationPreferences | Nil

    # [Self-managed permissions] The Amazon Resource Name (ARN) of the IAM role to use to update this
    # StackSet.
    #
    # Specify an IAM role only if you are using customized administrator roles to control which users
    # or groups can manage specific StackSets within the same administrator account. For more
    # information, see [Grant self-managed
    # permissions](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs-self-managed.html)
    # in the *CloudFormation User Guide*.
    #
    # If you specified a customized administrator role when you created the StackSet, you must specify
    # a customized administrator role, even if it is the same customized administrator role used with
    # this StackSet previously.
    property administration_role_arn : String | Nil

    # [Self-managed permissions] The name of the IAM execution role to use to update the stack set. If
    # you do not specify an execution role, CloudFormation uses the
    # `AWSCloudFormationStackSetExecutionRole` role for the StackSet operation.
    #
    # Specify an IAM role only if you are using customized execution roles to control which stack
    # resources users and groups can include in their StackSets.
    #
    # If you specify a customized execution role, CloudFormation uses that role to update the stack.
    # If you do not specify a customized execution role, CloudFormation performs the update using the
    # role previously associated with the StackSet, so long as you have permissions to perform
    # operations on the StackSet.
    property execution_role_name : String | Nil

    # [Service-managed permissions] The Organizations accounts in which to update associated stack
    # instances.
    #
    # To update all the stack instances associated with this StackSet, do not specify
    # `DeploymentTargets` or `Regions`.
    #
    # If the StackSet update includes changes to the template (that is, if `TemplateBody` or
    # `TemplateURL` is specified), or the `Parameters`, CloudFormation marks all stack instances with
    # a status of `OUTDATED` prior to updating the stack instances in the specified accounts and
    # Amazon Web Services Regions. If the StackSet update doesn't include changes to the template or
    # parameters, CloudFormation updates the stack instances in the specified accounts and Regions,
    # while leaving all other stack instances with their existing stack instance status.
    property deployment_targets : DeploymentTargets | Nil

    # Describes how the IAM roles required for StackSet operations are created. You cannot modify
    # `PermissionModel` if there are stack instances associated with your stack set.
    #
    # - With `self-managed` permissions, you must create the administrator and execution roles
    # required to deploy to target accounts. For more information, see [Grant self-managed
    # permissions](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs-self-managed.html).
    #
    # - With `service-managed` permissions, StackSets automatically creates the IAM roles required to
    # deploy to accounts managed by Organizations. For more information, see [Activate trusted access
    # for StackSets with
    # Organizations](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-activate-trusted-access.html).
    property permission_model : PermissionModels | Nil

    # [Service-managed permissions] Describes whether StackSets automatically deploys to Organizations
    # accounts that are added to a target organization or organizational unit (OU). For more
    # information, see [Enable or disable automatic deployments for StackSets in
    # Organizations](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-manage-auto-deployment.html)
    # in the *CloudFormation User Guide*.
    #
    # If you specify `AutoDeployment`, don't specify `DeploymentTargets` or `Regions`.
    property auto_deployment : AutoDeployment | Nil

    # The unique ID for this StackSet operation.
    #
    # The operation ID also functions as an idempotency token, to ensure that CloudFormation performs
    # the StackSet operation only once, even if you retry the request multiple times. You might retry
    # StackSet operation requests to ensure that CloudFormation successfully received them.
    #
    # If you don't specify an operation ID, CloudFormation generates one automatically.
    #
    # Repeating this StackSet operation with a new operation ID retries all stack instances whose
    # status is `OUTDATED`.
    property operation_id : String | Nil

    # [Self-managed permissions] The accounts in which to update associated stack instances. If you
    # specify accounts, you must also specify the Amazon Web Services Regions in which to update
    # StackSet instances.
    #
    # To update *all* the stack instances associated with this StackSet, don't specify the `Accounts`
    # or `Regions` properties.
    #
    # If the StackSet update includes changes to the template (that is, if the `TemplateBody` or
    # `TemplateURL` properties are specified), or the `Parameters` property, CloudFormation marks all
    # stack instances with a status of `OUTDATED` prior to updating the stack instances in the
    # specified accounts and Amazon Web Services Regions. If the StackSet update does not include
    # changes to the template or parameters, CloudFormation updates the stack instances in the
    # specified accounts and Amazon Web Services Regions, while leaving all other stack instances with
    # their existing stack instance status.
    property accounts : Array(String) | Nil

    # The Amazon Web Services Regions in which to update associated stack instances. If you specify
    # Regions, you must also specify accounts in which to update StackSet instances.
    #
    # To update *all* the stack instances associated with this StackSet, do not specify the `Accounts`
    # or `Regions` properties.
    #
    # If the StackSet update includes changes to the template (that is, if the `TemplateBody` or
    # `TemplateURL` properties are specified), or the `Parameters` property, CloudFormation marks all
    # stack instances with a status of `OUTDATED` prior to updating the stack instances in the
    # specified accounts and Regions. If the StackSet update does not include changes to the template
    # or parameters, CloudFormation updates the stack instances in the specified accounts and Regions,
    # while leaving all other stack instances with their existing stack instance status.
    property regions : Array(String) | Nil

    # [Service-managed permissions] Specifies whether you are acting as an account administrator in
    # the organization's management account or as a delegated administrator in a member account.
    #
    # By default, `SELF` is specified. Use `SELF` for StackSets with self-managed permissions.
    #
    # - If you are signed in to the management account, specify `SELF`.
    #
    # - If you are signed in to a delegated administrator account, specify `DELEGATED_ADMIN`.
    #
    # Your Amazon Web Services account must be registered as a delegated administrator in the
    # management account. For more information, see [Register a delegated
    # administrator](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-delegated-admin.html)
    # in the *CloudFormation User Guide*.
    property call_as : CallAs | Nil

    # Describes whether CloudFormation performs non-conflicting operations concurrently and queues
    # conflicting operations.
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

    def validate! : Nil
      if value = @description
        raise Core::ValidationError.new("Description length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Description length must be <= 1024") if value.size > 1024
      end

      if value = @template_body
        raise Core::ValidationError.new("TemplateBody length must be >= 1") if value.size < 1
      end

      if value = @template_url
        raise Core::ValidationError.new("TemplateURL length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TemplateURL length must be <= 5120") if value.size > 5120
      end

      if value = @parameters
        value.each(&.validate!)
      end

      if value = @tags
        raise Core::ValidationError.new("Tags must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Tags must have at most 50 item(s)") if value.size > 50
        value.each(&.validate!)
      end

      if value = @operation_preferences
        value.validate!
      end

      if value = @administration_role_arn
        raise Core::ValidationError.new("AdministrationRoleARN length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("AdministrationRoleARN length must be <= 2048") if value.size > 2048
      end

      if value = @execution_role_name
        raise Core::ValidationError.new("ExecutionRoleName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ExecutionRoleName length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("ExecutionRoleName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z_0-9+=,.@-]+$"))
      end

      if value = @deployment_targets
        value.validate!
      end

      if value = @auto_deployment
        value.validate!
      end

      if value = @operation_id
        raise Core::ValidationError.new("OperationId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("OperationId length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("OperationId does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9][-a-zA-Z0-9]*$"))
      end

      if value = @managed_execution
        value.validate!
      end
    end

    def_equals_and_hash(@stack_set_name, @description, @template_body, @template_url, @use_previous_template, @parameters, @capabilities, @tags, @operation_preferences, @administration_role_arn, @execution_role_name, @deployment_targets, @permission_model, @auto_deployment, @operation_id, @accounts, @regions, @call_as, @managed_execution)
  end
end
