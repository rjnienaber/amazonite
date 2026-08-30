private alias Core = Amazonite::Core

module Amazonite::StsV1
  class AssumeRoleRequest
    # The Amazon Resource Name (ARN) of the role to assume.
    property role_arn : String

    # An identifier for the assumed role session.
    #
    # Use the role session name to uniquely identify a session when the same role is assumed by
    # different principals or for different reasons. In cross-account scenarios, the role session name
    # is visible to, and can be logged by the account that owns the role. The role session name is
    # also used in the ARN of the assumed role principal. This means that subsequent cross-account API
    # requests that use the temporary security credentials will expose the role session name to the
    # external account in their CloudTrail logs.
    #
    # For security purposes, administrators can view this field in [CloudTrail
    # logs](https://docs.aws.amazon.com/IAM/latest/UserGuide/cloudtrail-integration.html#cloudtrail-integration_signin-tempcreds)
    # to help identify who performed an action in Amazon Web Services. Your administrator might
    # require that you specify your user name as the session name when you assume the role. For more
    # information, see [ `sts:RoleSessionName`
    # ](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_iam-condition-keys.html#ck_rolesessionname).
    #
    # The regex used to validate this parameter is a string of characters consisting of upper- and
    # lower-case alphanumeric characters with no spaces. You can also include underscores or any of
    # the following characters: +=,.@-
    property role_session_name : String

    # The Amazon Resource Names (ARNs) of the IAM managed policies that you want to use as managed
    # session policies. The policies must exist in the same account as the role.
    #
    # This parameter is optional. You can provide up to 10 managed policy ARNs. However, the plaintext
    # that you use for both inline and managed session policies can't exceed 2,048 characters. For
    # more information about ARNs, see [Amazon Resource Names (ARNs) and Amazon Web Services Service
    # Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html) in the
    # Amazon Web Services General Reference.
    #
    # An Amazon Web Services conversion compresses the passed inline session policy, managed policy
    # ARNs, and session tags into a packed binary format that has a separate limit. Your request can
    # fail for this limit even if your plaintext meets the other requirements. The `PackedPolicySize`
    # response element indicates by percentage how close the policies and tags for your request are to
    # the upper size limit.
    #
    # Passing policies to this operation returns new temporary credentials. The resulting session's
    # permissions are the intersection of the role's identity-based policy and the session policies.
    # You can use the role's temporary credentials in subsequent Amazon Web Services API calls to
    # access resources in the account that owns the role. You cannot use session policies to grant
    # more permissions than those allowed by the identity-based policy of the role that is being
    # assumed. For more information, see [Session
    # Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session)
    # in the *IAM User Guide*.
    property policy_arns : Array(PolicyDescriptorType) | Nil

    # An IAM policy in JSON format that you want to use as an inline session policy.
    #
    # This parameter is optional. Passing policies to this operation returns new temporary
    # credentials. The resulting session's permissions are the intersection of the role's
    # identity-based policy and the session policies. You can use the role's temporary credentials in
    # subsequent Amazon Web Services API calls to access resources in the account that owns the role.
    # You cannot use session policies to grant more permissions than those allowed by the
    # identity-based policy of the role that is being assumed. For more information, see [Session
    # Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session)
    # in the *IAM User Guide*.
    #
    # The plaintext that you use for both inline and managed session policies can't exceed 2,048
    # characters. The JSON policy characters can be any ASCII character from the space character to
    # the end of the valid character list (\u0020 through \u00FF). It can also include the tab
    # (\u0009), linefeed (\u000A), and carriage return (\u000D) characters.
    #
    # An Amazon Web Services conversion compresses the passed inline session policy, managed policy
    # ARNs, and session tags into a packed binary format that has a separate limit. Your request can
    # fail for this limit even if your plaintext meets the other requirements. The `PackedPolicySize`
    # response element indicates by percentage how close the policies and tags for your request are to
    # the upper size limit.
    #
    # For more information about role session permissions, see [Session
    # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session).
    property policy : String | Nil

    # The duration, in seconds, of the role session. The value specified can range from 900 seconds
    # (15 minutes) up to the maximum session duration set for the role. The maximum session duration
    # setting can have a value from 1 hour to 12 hours. If you specify a value higher than this
    # setting or the administrator setting (whichever is lower), the operation fails. For example, if
    # you specify a session duration of 12 hours, but your administrator set the maximum session
    # duration to 6 hours, your operation fails.
    #
    # Role chaining limits your Amazon Web Services CLI or Amazon Web Services API role session to a
    # maximum of one hour. When you use the `AssumeRole` API operation to assume a role, you can
    # specify the duration of your role session with the `DurationSeconds` parameter. You can specify
    # a parameter value of up to 43200 seconds (12 hours), depending on the maximum session duration
    # setting for your role. However, if you assume a role using role chaining and provide a
    # `DurationSeconds` parameter value greater than one hour, the operation fails. To learn how to
    # view the maximum value for your role, see [Update the maximum session duration for a
    # role](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_update-role-settings.html#id_roles_update-session-duration).
    #
    # By default, the value is set to `3600` seconds.
    #
    # The `DurationSeconds` parameter is separate from the duration of a console session that you
    # might request using the returned credentials. The request to the federation endpoint for a
    # console sign-in token takes a `SessionDuration` parameter that specifies the maximum length of
    # the console session. For more information, see [Creating a URL that Enables Federated Users to
    # Access the Amazon Web Services Management
    # Console](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_enable-console-custom-url.html)
    # in the *IAM User Guide*.
    property duration_seconds : Int32 | Nil

    # A list of session tags that you want to pass. Each session tag consists of a key name and an
    # associated value. For more information about session tags, see [Tagging Amazon Web Services STS
    # Sessions](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_session-tags.html) in the *IAM
    # User Guide*.
    #
    # This parameter is optional. You can pass up to 50 session tags. The plaintext session tag keys
    # can’t exceed 128 characters, and the values can’t exceed 256 characters. For these and
    # additional limits, see [IAM and STS Character
    # Limits](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-limits.html#reference_iam-limits-entity-length)
    # in the *IAM User Guide*.
    #
    # An Amazon Web Services conversion compresses the passed inline session policy, managed policy
    # ARNs, and session tags into a packed binary format that has a separate limit. Your request can
    # fail for this limit even if your plaintext meets the other requirements. The `PackedPolicySize`
    # response element indicates by percentage how close the policies and tags for your request are to
    # the upper size limit.
    #
    # You can pass a session tag with the same key as a tag that is already attached to the role. When
    # you do, session tags override a role tag with the same key.
    #
    # Tag key–value pairs are not case sensitive, but case is preserved. This means that you cannot
    # have separate `Department` and `department` tag keys. Assume that the role has the
    # `Department`=`Marketing` tag and you pass the `department`=`engineering` session tag.
    # `Department` and `department` are not saved as separate tags, and the session tag passed in the
    # request takes precedence over the role tag.
    #
    # Additionally, if you used temporary credentials to perform this operation, the new session
    # inherits any transitive session tags from the calling session. If you pass a session tag with
    # the same key as an inherited tag, the operation fails. To view the inherited tags for a session,
    # see the CloudTrail logs. For more information, see [Viewing Session Tags in
    # CloudTrail](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_session-tags.html#id_session-tags_ctlogs)
    # in the *IAM User Guide*.
    property tags : Array(Tag) | Nil

    # A list of keys for session tags that you want to set as transitive. If you set a tag key as
    # transitive, the corresponding key and value passes to subsequent sessions in a role chain. For
    # more information, see [Chaining Roles with Session
    # Tags](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_session-tags.html#id_session-tags_role-chaining)
    # in the *IAM User Guide*.
    #
    # This parameter is optional. The transitive status of a session tag does not impact its packed
    # binary size.
    #
    # If you choose not to specify a transitive tag key, then no tags are passed from this session to
    # any subsequent sessions.
    property transitive_tag_keys : Array(String) | Nil

    # A unique identifier that might be required when you assume a role in another account. If the
    # administrator of the account to which the role belongs provided you with an external ID, then
    # provide that value in the `ExternalId` parameter. This value can be any string, such as a
    # passphrase or account number. A cross-account role is usually set up to trust everyone in an
    # account. Therefore, the administrator of the trusting account might send an external ID to the
    # administrator of the trusted account. That way, only someone with the ID can assume the role,
    # rather than everyone in the account. For more information about the external ID, see [How to Use
    # an External ID When Granting Access to Your Amazon Web Services Resources to a Third
    # Party](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_create_for-user_externalid.html)
    # in the *IAM User Guide*.
    #
    # The regex used to validate this parameter is a string of characters consisting of upper- and
    # lower-case alphanumeric characters with no spaces. You can also include underscores or any of
    # the following characters: +=,.@:\/-
    property external_id : String | Nil

    # The identification number of the MFA device that is associated with the user who is making the
    # `AssumeRole` call. Specify this value if the trust policy of the role being assumed includes a
    # condition that requires MFA authentication. The value is either the serial number for a hardware
    # device (such as `GAHT12345678`) or an Amazon Resource Name (ARN) for a virtual device (such as
    # `arn:aws:iam::123456789012:mfa/user`).
    #
    # The regex used to validate this parameter is a string of characters consisting of upper- and
    # lower-case alphanumeric characters with no spaces. You can also include underscores or any of
    # the following characters: +=/:,.@-
    property serial_number : String | Nil

    # The value provided by the MFA device, if the trust policy of the role being assumed requires
    # MFA. (In other words, if the policy includes a condition that tests for MFA). If the role being
    # assumed requires MFA and if the `TokenCode` value is missing or expired, the `AssumeRole` call
    # returns an "access denied" error.
    #
    # The format for this parameter, as described by its regex pattern, is a sequence of six numeric
    # digits.
    property token_code : String | Nil

    # The source identity specified by the principal that is calling the `AssumeRole` operation. The
    # source identity value persists across [chained
    # role](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html#iam-term-role-chaining)
    # sessions.
    #
    # You can require users to specify a source identity when they assume a role. You do this by using
    # the [ `sts:SourceIdentity`
    # ](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_condition-keys.html#condition-keys-sourceidentity)
    # condition key in a role trust policy. You can use source identity information in CloudTrail logs
    # to determine who took actions with a role. You can use the `aws:SourceIdentity` condition key to
    # further control access to Amazon Web Services resources based on the value of source identity.
    # For more information about using source identity, see [Monitor and control actions taken with
    # assumed
    # roles](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_control-access_monitor.html)
    # in the *IAM User Guide*.
    #
    # The regex used to validate this parameter is a string of characters consisting of upper- and
    # lower-case alphanumeric characters with no spaces. You can also include underscores or any of
    # the following characters: +=,.@-. You cannot use a value that begins with the text `aws:`. This
    # prefix is reserved for Amazon Web Services internal use.
    property source_identity : String | Nil

    # A list of previously acquired trusted context assertions in the format of a JSON array. The
    # trusted context assertion is signed and encrypted by Amazon Web Services STS.
    #
    # The following is an example of a `ProvidedContext` value that includes a single trusted context
    # assertion and the ARN of the context provider from which the trusted context assertion was
    # generated.
    #
    # `[{"ProviderArn":"arn:aws:iam::aws:contextProvider/IdentityCenter","ContextAssertion":"trusted-context-assertion"}]`
    property provided_contexts : Array(ProvidedContext) | Nil

    def initialize(
      @role_arn : String,
      @role_session_name : String,
      @policy_arns : Array(PolicyDescriptorType) | Nil = nil,
      @policy : String | Nil = nil,
      @duration_seconds : Int32 | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @transitive_tag_keys : Array(String) | Nil = nil,
      @external_id : String | Nil = nil,
      @serial_number : String | Nil = nil,
      @token_code : String | Nil = nil,
      @source_identity : String | Nil = nil,
      @provided_contexts : Array(ProvidedContext) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}RoleArn", @role_arn}

      params << {"#{prefix}RoleSessionName", @role_session_name}

      (@policy_arns || [] of PolicyDescriptorType).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PolicyArns.member.#{i}."))
      end

      if value = @policy
        params << {"#{prefix}Policy", value}
      end

      if value = @duration_seconds
        params << {"#{prefix}DurationSeconds", value.to_s}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Tags.member.#{i}."))
      end

      (@transitive_tag_keys || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}TransitiveTagKeys.member.#{i}", item}
      end

      if value = @external_id
        params << {"#{prefix}ExternalId", value}
      end

      if value = @serial_number
        params << {"#{prefix}SerialNumber", value}
      end

      if value = @token_code
        params << {"#{prefix}TokenCode", value}
      end

      if value = @source_identity
        params << {"#{prefix}SourceIdentity", value}
      end

      (@provided_contexts || [] of ProvidedContext).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ProvidedContexts.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        role_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='RoleArn']")).not_nil!,
        role_session_name: Core::XMLValue.string(node.xpath_node("*[local-name()='RoleSessionName']")).not_nil!,
        policy_arns: node.xpath_nodes("*[local-name()='PolicyArns']/*[local-name()='member']").map { |n| PolicyDescriptorType.from_xml(n) },
        policy: Core::XMLValue.string(node.xpath_node("*[local-name()='Policy']")),
        duration_seconds: Core::XMLValue.i32(node.xpath_node("*[local-name()='DurationSeconds']")),
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
        transitive_tag_keys: node.xpath_nodes("*[local-name()='TransitiveTagKeys']/*[local-name()='member']").map { |n| n.content },
        external_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ExternalId']")),
        serial_number: Core::XMLValue.string(node.xpath_node("*[local-name()='SerialNumber']")),
        token_code: Core::XMLValue.string(node.xpath_node("*[local-name()='TokenCode']")),
        source_identity: Core::XMLValue.string(node.xpath_node("*[local-name()='SourceIdentity']")),
        provided_contexts: node.xpath_nodes("*[local-name()='ProvidedContexts']/*[local-name()='member']").map { |n| ProvidedContext.from_xml(n) },
      )
    end
  end
end
