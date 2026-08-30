private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class CreateStackSetInput
    # The name to associate with the StackSet. The name must be unique in the Region where you create
    # your StackSet.
    #
    # A stack name can contain only alphanumeric characters (case-sensitive) and hyphens. It must
    # start with an alphabetic character and can't be longer than 128 characters.
    property stack_set_name : String

    # A description of the StackSet. You can use the description to identify the StackSet's purpose or
    # other important information.
    property description : String | Nil

    # The structure that contains the template body, with a minimum length of 1 byte and a maximum
    # length of 51,200 bytes.
    #
    # Conditional: You must specify either the `TemplateBody` or the `TemplateURL` parameter, but not
    # both.
    property template_body : String | Nil

    # The URL of a file that contains the template body. The URL must point to a template (maximum
    # size: 1 MB) that's located in an Amazon S3 bucket or a Systems Manager document. The location
    # for an Amazon S3 bucket must start with `https://`. S3 static website URLs are not supported.
    #
    # Conditional: You must specify either the `TemplateBody` or the `TemplateURL` parameter, but not
    # both.
    property template_url : String | Nil

    # The stack ID you are importing into a new StackSet. Specify the Amazon Resource Name (ARN) of
    # the stack.
    property stack_id : String | Nil

    # The input parameters for the StackSet template.
    property parameters : Array(Parameter) | Nil

    # In some cases, you must explicitly acknowledge that your StackSet template contains certain
    # capabilities in order for CloudFormation to create the StackSet and related stack instances.
    #
    # - `CAPABILITY_IAM` and `CAPABILITY_NAMED_IAM`
    #
    # Some stack templates might include resources that can affect permissions in your Amazon Web
    # Services account; for example, by creating new IAM users. For those StackSets, you must
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
    # must create the StackSet directly from the processed template, without first reviewing the
    # resulting changes in a change set. To create the StackSet directly, you must acknowledge this
    # capability. For more information, see [Perform custom processing on CloudFormation templates
    # with template
    # macros](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-macros.html).
    #
    # StackSets with service-managed permissions don't currently support the use of macros in
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
    # A maximum number of 50 tags can be specified.
    #
    # If you specify tags as part of a `CreateStackSet` action, CloudFormation checks to see if you
    # have the required IAM permission to tag resources. If you don't, the entire `CreateStackSet`
    # action fails with an `access denied` error, and the StackSet is not created.
    property tags : Array(Tag) | Nil

    # The Amazon Resource Name (ARN) of the IAM role to use to create this StackSet.
    #
    # Specify an IAM role only if you are using customized administrator roles to control which users
    # or groups can manage specific StackSets within the same administrator account. For more
    # information, see [Grant self-managed
    # permissions](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs-self-managed.html)
    # in the *CloudFormation User Guide*.
    #
    # Valid only if the permissions model is `SELF_MANAGED`.
    property administration_role_arn : String | Nil

    # The name of the IAM execution role to use to create the StackSet. If you do not specify an
    # execution role, CloudFormation uses the `AWSCloudFormationStackSetExecutionRole` role for the
    # StackSet operation.
    #
    # Specify an IAM role only if you are using customized execution roles to control which stack
    # resources users and groups can include in their StackSets.
    #
    # Valid only if the permissions model is `SELF_MANAGED`.
    property execution_role_name : String | Nil

    # Describes how the IAM roles required for StackSet operations are created. By default,
    # `SELF-MANAGED` is specified.
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

    # Describes whether StackSets automatically deploys to Organizations accounts that are added to
    # the target organization or organizational unit (OU). For more information, see [Enable or
    # disable automatic deployments for StackSets in
    # Organizations](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-manage-auto-deployment.html)
    # in the *CloudFormation User Guide*.
    #
    # Required if the permissions model is `SERVICE_MANAGED`. (Not used with self-managed
    # permissions.)
    property auto_deployment : AutoDeployment | Nil

    # Specifies whether you are acting as an account administrator in the organization's management
    # account or as a delegated administrator in a member account.
    #
    # By default, `SELF` is specified. Use `SELF` for StackSets with self-managed permissions.
    #
    # - To create a StackSet with service-managed permissions while signed in to the management
    # account, specify `SELF`.
    #
    # - To create a StackSet with service-managed permissions while signed in to a delegated
    # administrator account, specify `DELEGATED_ADMIN`.
    #
    # Your Amazon Web Services account must be registered as a delegated admin in the management
    # account. For more information, see [Register a delegated
    # administrator](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-delegated-admin.html)
    # in the *CloudFormation User Guide*.
    #
    # StackSets with service-managed permissions are created in the management account, including
    # StackSets that are created by delegated administrators.
    #
    # Valid only if the permissions model is `SERVICE_MANAGED`.
    property call_as : CallAs | Nil

    # A unique identifier for this `CreateStackSet` request. Specify this token if you plan to retry
    # requests so that CloudFormation knows that you're not attempting to create another StackSet with
    # the same name. You might retry `CreateStackSet` requests to ensure that CloudFormation
    # successfully received them.
    #
    # If you don't specify an operation ID, the SDK generates one automatically.
    property client_request_token : String | Nil

    # Describes whether CloudFormation performs non-conflicting operations concurrently and queues
    # conflicting operations.
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

      if value = @administration_role_arn
        raise Core::ValidationError.new("AdministrationRoleARN length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("AdministrationRoleARN length must be <= 2048") if value.size > 2048
      end

      if value = @execution_role_name
        raise Core::ValidationError.new("ExecutionRoleName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ExecutionRoleName length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("ExecutionRoleName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z_0-9+=,.@-]+$"))
      end

      if value = @auto_deployment
        value.validate!
      end

      if value = @client_request_token
        raise Core::ValidationError.new("ClientRequestToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ClientRequestToken length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("ClientRequestToken does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9][-a-zA-Z0-9]*$"))
      end

      if value = @managed_execution
        value.validate!
      end
    end

    def_equals_and_hash(@stack_set_name, @description, @template_body, @template_url, @stack_id, @parameters, @capabilities, @tags, @administration_role_arn, @execution_role_name, @permission_model, @auto_deployment, @call_as, @client_request_token, @managed_execution)
  end
end
