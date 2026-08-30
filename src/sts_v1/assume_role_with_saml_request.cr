private alias Core = Amazonite::Core

module Amazonite::StsV1
  class AssumeRoleWithSAMLRequest
    # The Amazon Resource Name (ARN) of the role that the caller is assuming.
    property role_arn : String

    # The Amazon Resource Name (ARN) of the SAML provider in IAM that describes the IdP.
    property principal_arn : String

    # The base64 encoded SAML authentication response provided by the IdP.
    #
    # For more information, see [Configuring a Relying Party and Adding
    # Claims](https://docs.aws.amazon.com/IAM/latest/UserGuide/create-role-saml-IdP-tasks.html) in the
    # *IAM User Guide*.
    property saml_assertion : String

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

    # The duration, in seconds, of the role session. Your role session lasts for the duration that you
    # specify for the `DurationSeconds` parameter, or until the time specified in the SAML
    # authentication response's `SessionNotOnOrAfter` value, whichever is shorter. You can provide a
    # `DurationSeconds` value from 900 seconds (15 minutes) up to the maximum session duration setting
    # for the role. This setting can have a value from 1 hour to 12 hours. If you specify a value
    # higher than this setting, the operation fails. For example, if you specify a session duration of
    # 12 hours, but your administrator set the maximum session duration to 6 hours, your operation
    # fails. To learn how to view the maximum value for your role, see [View the Maximum Session
    # Duration Setting for a
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
      @principal_arn : String,
      @saml_assertion : String,
      @policy_arns : Array(PolicyDescriptorType) | Nil = nil,
      @policy : String | Nil = nil,
      @duration_seconds : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}RoleArn", @role_arn}

      params << {"#{prefix}PrincipalArn", @principal_arn}

      params << {"#{prefix}SAMLAssertion", @saml_assertion}

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
        principal_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='PrincipalArn']")).not_nil!,
        saml_assertion: Core::XMLValue.string(node.xpath_node("*[local-name()='SAMLAssertion']")).not_nil!,
        policy_arns: node.xpath_nodes("*[local-name()='PolicyArns']/*[local-name()='member']").map { |n| PolicyDescriptorType.from_xml(n) },
        policy: Core::XMLValue.string(node.xpath_node("*[local-name()='Policy']")),
        duration_seconds: Core::XMLValue.i32(node.xpath_node("*[local-name()='DurationSeconds']")),
      )
    end

    def validate! : Nil
      if value = @role_arn
        raise Core::ValidationError.new("RoleArn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("RoleArn length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("RoleArn does not match the required pattern") unless value.matches?(Regex.new("^[\\u0009\\u000A\\u000D\\u0020-\\u007E\\u0085\\u00A0-\\uD7FF\\uE000-\\uFFFD\\u10000-\\u10FFFF]+$"))
      end

      if value = @principal_arn
        raise Core::ValidationError.new("PrincipalArn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("PrincipalArn length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("PrincipalArn does not match the required pattern") unless value.matches?(Regex.new("^[\\u0009\\u000A\\u000D\\u0020-\\u007E\\u0085\\u00A0-\\uD7FF\\uE000-\\uFFFD\\u10000-\\u10FFFF]+$"))
      end

      if value = @saml_assertion
        raise Core::ValidationError.new("SAMLAssertion length must be >= 4") if value.size < 4
        raise Core::ValidationError.new("SAMLAssertion length must be <= 100000") if value.size > 100000
      end

      if value = @policy_arns
        value.each(&.validate!)
      end

      if value = @policy
        raise Core::ValidationError.new("Policy length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Policy length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("Policy does not match the required pattern") unless value.matches?(Regex.new("^[\\u0009\\u000A\\u000D\\u0020-\\u00FF]+$"))
      end

      if value = @duration_seconds
        raise Core::ValidationError.new("DurationSeconds value must be >= 900") if value < 900
        raise Core::ValidationError.new("DurationSeconds value must be <= 43200") if value > 43200
      end
    end

    def_equals_and_hash(@role_arn, @principal_arn, @saml_assertion, @policy_arns, @policy, @duration_seconds)
  end
end
