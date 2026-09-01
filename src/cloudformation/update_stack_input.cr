private alias ACF = Amazonite::CloudFormation
private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  # The input for an UpdateStack action.
  class UpdateStackInput
    # The name or unique stack ID of the stack to update.
    property stack_name : String

    # Structure that contains the template body with a minimum length of 1 byte and a maximum length
    # of 51,200 bytes.
    #
    # Conditional: You must specify only one of the following parameters: `TemplateBody`,
    # `TemplateURL`, or set the `UsePreviousTemplate` to `true`.
    property template_body : String | Nil

    # The URL of a file that contains the template body. The URL must point to a template that's
    # located in an Amazon S3 bucket or a Systems Manager document. The location for an Amazon S3
    # bucket must start with `https://`.
    #
    # Conditional: You must specify only one of the following parameters: `TemplateBody`,
    # `TemplateURL`, or set the `UsePreviousTemplate` to `true`.
    property template_url : String | Nil

    # Reuse the existing template that is associated with the stack that you are updating.
    #
    # When using templates with the `AWS::LanguageExtensions` transform, provide the template instead
    # of using `UsePreviousTemplate` to ensure new parameter values and Systems Manager parameter
    # updates are applied correctly. For more information, see [AWS::LanguageExtensions
    # transform](https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/transform-aws-languageextensions.html).
    #
    # Conditional: You must specify only one of the following parameters: `TemplateBody`,
    # `TemplateURL`, or set the `UsePreviousTemplate` to `true`.
    property use_previous_template : Bool | Nil

    # Structure that contains the temporary overriding stack policy body. You can specify either the
    # `StackPolicyDuringUpdateBody` or the `StackPolicyDuringUpdateURL` parameter, but not both.
    #
    # If you want to update protected resources, specify a temporary overriding stack policy during
    # this update. If you don't specify a stack policy, the current policy that is associated with the
    # stack will be used.
    property stack_policy_during_update_body : String | Nil

    # Location of a file that contains the temporary overriding stack policy. The URL must point to a
    # policy (max size: 16KB) located in an S3 bucket in the same Region as the stack. The location
    # for an Amazon S3 bucket must start with `https://`. URLs from S3 static websites are not
    # supported.
    #
    # You can specify either the `StackPolicyDuringUpdateBody` or the `StackPolicyDuringUpdateURL`
    # parameter, but not both.
    #
    # If you want to update protected resources, specify a temporary overriding stack policy during
    # this update. If you don't specify a stack policy, the current policy that is associated with the
    # stack will be used.
    property stack_policy_during_update_url : String | Nil

    # A list of `Parameter` structures that specify input parameters for the stack. For more
    # information, see the
    # [Parameter](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_Parameter.html)
    # data type.
    property parameters : Array(Parameter) | Nil

    # In some cases, you must explicitly acknowledge that your stack template contains certain
    # capabilities in order for CloudFormation to update the stack.
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
    # -
    # [AWS::IAM::Policy](https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-iam-policy.html)
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
    # template, so that they can review the changes resulting from the macros before actually updating
    # the stack. If your stack template contains one or more macros, and you choose to update a stack
    # directly from the processed template, without first reviewing the resulting changes in a change
    # set, you must acknowledge this capability. This includes the
    # [AWS::Include](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/transform-aws-include.html)
    # and
    # [AWS::Serverless](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/transform-aws-serverless.html)
    # transforms, which are macros hosted by CloudFormation.
    #
    # If you want to update a stack from a stack template that contains macros *and* nested stacks,
    # you must update the stack directly from the template using this capability.
    #
    # You should only update stacks directly from a stack template that contains macros if you know
    # what processing the macro performs.
    #
    # Each macro relies on an underlying Lambda service function for processing stack templates. Be
    # aware that the Lambda function owner can update the function operation without CloudFormation
    # being notified.
    #
    # For more information, see [Perform custom processing on CloudFormation templates with template
    # macros](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-macros.html).
    #
    # Only one of the `Capabilities` and `ResourceType` parameters can be specified.
    property capabilities : Array(Capability) | Nil

    # Specifies which resource types you can work with, such as `AWS::EC2::Instance` or
    # `Custom::MyCustomInstance`.
    #
    # If the list of resource types doesn't include a resource that you're updating, the stack update
    # fails. By default, CloudFormation grants permissions to all resource types. IAM uses this
    # parameter for CloudFormation-specific condition keys in IAM policies. For more information, see
    # [Control CloudFormation access with Identity and Access
    # Management](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/control-access-with-iam.html).
    #
    # Only one of the `Capabilities` and `ResourceType` parameters can be specified.
    property resource_types : Array(String) | Nil

    # The Amazon Resource Name (ARN) of an IAM role that CloudFormation assumes to update the stack.
    # CloudFormation uses the role's credentials to make calls on your behalf. CloudFormation always
    # uses this role for all future operations on the stack. Provided that users have permission to
    # operate on the stack, CloudFormation uses this role even if the users don't have permission to
    # pass it. Ensure that the role grants least privilege.
    #
    # If you don't specify a value, CloudFormation uses the role that was previously associated with
    # the stack. If no role is available, CloudFormation uses a temporary session that is generated
    # from your user credentials.
    property role_arn : String | Nil

    # The rollback triggers for CloudFormation to monitor during stack creation and updating
    # operations, and for the specified monitoring period afterwards.
    property rollback_configuration : RollbackConfiguration | Nil

    # Structure that contains a new stack policy body. You can specify either the `StackPolicyBody` or
    # the `StackPolicyURL` parameter, but not both.
    #
    # You might update the stack policy, for example, in order to protect a new resource that you
    # created during a stack update. If you don't specify a stack policy, the current policy that is
    # associated with the stack is unchanged.
    property stack_policy_body : String | Nil

    # Location of a file that contains the updated stack policy. The URL must point to a policy (max
    # size: 16KB) located in an S3 bucket in the same Region as the stack. The location for an Amazon
    # S3 bucket must start with `https://`. URLs from S3 static websites are not supported.
    #
    # You can specify either the `StackPolicyBody` or the `StackPolicyURL` parameter, but not both.
    #
    # You might update the stack policy, for example, in order to protect a new resource that you
    # created during a stack update. If you don't specify a stack policy, the current policy that is
    # associated with the stack is unchanged.
    property stack_policy_url : String | Nil

    # Amazon Simple Notification Service topic Amazon Resource Names (ARNs) that CloudFormation
    # associates with the stack. Specify an empty list to remove all notification topics.
    property notification_ar_ns : Array(String) | Nil

    # Key-value pairs to associate with this stack. CloudFormation also propagates these tags to
    # supported resources in the stack. You can specify a maximum number of 50 tags.
    #
    # If you don't specify this parameter, CloudFormation doesn't modify the stack's tags. If you
    # specify an empty value, CloudFormation removes all associated tags.
    property tags : Array(Tag) | Nil

    # Preserve the state of previously provisioned resources when an operation fails.
    #
    # Default: `False`
    property disable_rollback : Bool | Nil

    # A unique identifier for this `UpdateStack` request. Specify this token if you plan to retry
    # requests so that CloudFormation knows that you're not attempting to update a stack with the same
    # name. You might retry `UpdateStack` requests to ensure that CloudFormation successfully received
    # them.
    #
    # All events triggered by a given stack operation are assigned the same client request token,
    # which you can use to track operations. For example, if you execute a `CreateStack` operation
    # with the token `token1`, then all the `StackEvents` generated by that operation will have
    # `ClientRequestToken` set as `token1`.
    #
    # In the console, stack operations display the client request token on the Events tab. Stack
    # operations that are initiated from the console use the token format *Console-StackOperation-ID*,
    # which helps you easily identify the stack operation . For example, if you create a stack using
    # the console, each stack event would be assigned the same token in the following format:
    # `Console-CreateStack-7f59c3cf-00d2-40c7-b2ff-e75db0987002`.
    property client_request_token : String | Nil

    # When set to `true`, newly created resources are deleted when the operation rolls back. This
    # includes newly created resources marked with a deletion policy of `Retain`.
    #
    # Default: `false`
    property retain_except_on_create : Bool | Nil

    # The deployment configuration for this stack operation, including the deployment mode.
    property deployment_config : DeploymentConfig | Nil

    # Set to `true` to disable pre-deployment validations in changeset or stack operations.
    #
    # Default: `false`
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

    def validate! : Nil
      if value = @template_body
        raise Core::ValidationError.new("TemplateBody length must be >= 1") if value.size < 1
      end

      if value = @template_url
        raise Core::ValidationError.new("TemplateURL length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TemplateURL length must be <= 5120") if value.size > 5120
      end

      if value = @stack_policy_during_update_body
        raise Core::ValidationError.new("StackPolicyDuringUpdateBody length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StackPolicyDuringUpdateBody length must be <= 16384") if value.size > 16384
      end

      if value = @stack_policy_during_update_url
        raise Core::ValidationError.new("StackPolicyDuringUpdateURL length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StackPolicyDuringUpdateURL length must be <= 5120") if value.size > 5120
      end

      if value = @parameters
        value.each(&.validate!)
      end

      if value = @role_arn
        raise Core::ValidationError.new("RoleARN length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("RoleARN length must be <= 2048") if value.size > 2048
      end

      if value = @rollback_configuration
        value.validate!
      end

      if value = @stack_policy_body
        raise Core::ValidationError.new("StackPolicyBody length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StackPolicyBody length must be <= 16384") if value.size > 16384
      end

      if value = @stack_policy_url
        raise Core::ValidationError.new("StackPolicyURL length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StackPolicyURL length must be <= 5120") if value.size > 5120
      end

      if value = @notification_ar_ns
        raise Core::ValidationError.new("NotificationARNs must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("NotificationARNs must have at most 5 item(s)") if value.size > 5
      end

      if value = @tags
        raise Core::ValidationError.new("Tags must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Tags must have at most 50 item(s)") if value.size > 50
        value.each(&.validate!)
      end

      if value = @client_request_token
        raise Core::ValidationError.new("ClientRequestToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ClientRequestToken length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("ClientRequestToken does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9][-a-zA-Z0-9]*$"))
      end

      if value = @deployment_config
        value.validate!
      end
    end

    def_equals_and_hash(@stack_name, @template_body, @template_url, @use_previous_template, @stack_policy_during_update_body, @stack_policy_during_update_url, @parameters, @capabilities, @resource_types, @role_arn, @rollback_configuration, @stack_policy_body, @stack_policy_url, @notification_ar_ns, @tags, @disable_rollback, @client_request_token, @retain_except_on_create, @deployment_config, @disable_validation)
  end
end
