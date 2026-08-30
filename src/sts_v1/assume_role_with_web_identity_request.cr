private alias Core = Amazonite::Core

module Amazonite::StsV1
  class AssumeRoleWithWebIdentityRequest
    # The Amazon Resource Name (ARN) of the role that the caller is assuming.
    #
    # Additional considerations apply to Amazon Cognito identity pools that assume [cross-account IAM
    # roles](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies-cross-account-resource-access.html).
    # The trust policies of these roles must accept the `cognito-identity.amazonaws.com` service
    # principal and must contain the `cognito-identity.amazonaws.com:aud` condition key to restrict
    # role assumption to users from your intended identity pools. A policy that trusts Amazon Cognito
    # identity pools without this condition creates a risk that a user from an unintended identity
    # pool can assume the role. For more information, see [ Trust policies for IAM roles in Basic
    # (Classic) authentication
    # ](https://docs.aws.amazon.com/cognito/latest/developerguide/iam-roles.html#trust-policies) in
    # the *Amazon Cognito Developer Guide*.
    property role_arn : String

    # An identifier for the assumed role session. Typically, you pass the name or identifier that is
    # associated with the user who is using your application. That way, the temporary security
    # credentials that your application will use are associated with that user. This session name is
    # included as part of the ARN and assumed role ID in the `AssumedRoleUser` response element.
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
    # the following characters: =,.@-
    property role_session_name : String

    # The OAuth 2.0 access token or OpenID Connect ID token that is provided by the identity provider.
    # Your application must get this token by authenticating the user who is using your application
    # with a web identity provider before the application makes an `AssumeRoleWithWebIdentity` call.
    # Timestamps in the token must be formatted as either an integer or a long integer. Tokens must be
    # signed using either RSA keys (RS256, RS384, or RS512) or ECDSA keys (ES256, ES384, or ES512).
    property web_identity_token : String

    # The fully qualified host component of the domain name of the OAuth 2.0 identity provider. Do not
    # specify this value for an OpenID Connect identity provider.
    #
    # Currently `www.amazon.com` and `graph.facebook.com` are the only supported identity providers
    # for OAuth 2.0 access tokens. Do not include URL schemes and port numbers.
    #
    # Do not specify this value for OpenID Connect ID tokens.
    property provider_id : String | Nil

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
    # For more information about role session permissions, see [Session
    # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session).
    #
    # An Amazon Web Services conversion compresses the passed inline session policy, managed policy
    # ARNs, and session tags into a packed binary format that has a separate limit. Your request can
    # fail for this limit even if your plaintext meets the other requirements. The `PackedPolicySize`
    # response element indicates by percentage how close the policies and tags for your request are to
    # the upper size limit.
    property policy : String | Nil

    # The duration, in seconds, of the role session. The value can range from 900 seconds (15 minutes)
    # up to the maximum session duration setting for the role. This setting can have a value from 1
    # hour to 12 hours. If you specify a value higher than this setting, the operation fails. For
    # example, if you specify a session duration of 12 hours, but your administrator set the maximum
    # session duration to 6 hours, your operation fails. To learn how to view the maximum value for
    # your role, see [View the Maximum Session Duration Setting for a
    # Role](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use.html#id_roles_use_view-role-max-session)
    # in the *IAM User Guide*.
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

    def initialize(
      @role_arn : String,
      @role_session_name : String,
      @web_identity_token : String,
      @provider_id : String | Nil = nil,
      @policy_arns : Array(PolicyDescriptorType) | Nil = nil,
      @policy : String | Nil = nil,
      @duration_seconds : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}RoleArn", @role_arn}

      params << {"#{prefix}RoleSessionName", @role_session_name}

      params << {"#{prefix}WebIdentityToken", @web_identity_token}

      if value = @provider_id
        params << {"#{prefix}ProviderId", value}
      end

      (@policy_arns || [] of PolicyDescriptorType).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PolicyArns.member.#{i}."))
      end

      if value = @policy
        params << {"#{prefix}Policy", value}
      end

      if value = @duration_seconds
        params << {"#{prefix}DurationSeconds", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        role_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='RoleArn']")).not_nil!,
        role_session_name: Core::XMLValue.string(node.xpath_node("*[local-name()='RoleSessionName']")).not_nil!,
        web_identity_token: Core::XMLValue.string(node.xpath_node("*[local-name()='WebIdentityToken']")).not_nil!,
        provider_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ProviderId']")),
        policy_arns: node.xpath_nodes("*[local-name()='PolicyArns']/*[local-name()='member']").map { |n| PolicyDescriptorType.from_xml(n) },
        policy: Core::XMLValue.string(node.xpath_node("*[local-name()='Policy']")),
        duration_seconds: Core::XMLValue.i32(node.xpath_node("*[local-name()='DurationSeconds']")),
      )
    end

    def validate! : Nil
      if value = @role_arn
        raise Core::ValidationError.new("RoleArn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("RoleArn length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("RoleArn does not match the required pattern") unless value.matches?(Regex.new("^[\t\n\r -~\u0085\u00A0-퟿\uE000-�က0-ჿFF]+$"))
      end

      if value = @role_session_name
        raise Core::ValidationError.new("RoleSessionName length must be >= 2") if value.size < 2
        raise Core::ValidationError.new("RoleSessionName length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("RoleSessionName does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@-]*$"))
      end

      if value = @web_identity_token
        raise Core::ValidationError.new("WebIdentityToken length must be >= 4") if value.size < 4
        raise Core::ValidationError.new("WebIdentityToken length must be <= 20000") if value.size > 20000
      end

      if value = @provider_id
        raise Core::ValidationError.new("ProviderId length must be >= 4") if value.size < 4
        raise Core::ValidationError.new("ProviderId length must be <= 2048") if value.size > 2048
      end

      if value = @policy_arns
        value.each(&.validate!)
      end

      if value = @policy
        raise Core::ValidationError.new("Policy length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Policy length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("Policy does not match the required pattern") unless value.matches?(Regex.new("^[\t\n\r -ÿ]+$"))
      end

      if value = @duration_seconds
        raise Core::ValidationError.new("DurationSeconds value must be >= 900") if value < 900
        raise Core::ValidationError.new("DurationSeconds value must be <= 43200") if value > 43200
      end
    end

    def_equals_and_hash(@role_arn, @role_session_name, @web_identity_token, @provider_id, @policy_arns, @policy, @duration_seconds)
  end
end
