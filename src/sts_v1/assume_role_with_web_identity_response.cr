private alias Core = Amazonite::Core

module Amazonite::StsV1
  # Contains the response to a successful AssumeRoleWithWebIdentity request, including temporary
  # Amazon Web Services credentials that can be used to make Amazon Web Services requests.
  class AssumeRoleWithWebIdentityResponse
    # The temporary security credentials, which include an access key ID, a secret access key, and a
    # security token.
    #
    # The size of the security token that STS API operations return is not fixed. We strongly
    # recommend that you make no assumptions about the maximum size.
    property credentials : Credentials | Nil

    # The unique user identifier that is returned by the identity provider. This identifier is
    # associated with the `WebIdentityToken` that was submitted with the `AssumeRoleWithWebIdentity`
    # call. The identifier is typically unique to the user and the application that acquired the
    # `WebIdentityToken` (pairwise identifier). For OpenID Connect ID tokens, this field contains the
    # value returned by the identity provider as the token's `sub` (Subject) claim.
    property subject_from_web_identity_token : String | Nil

    # The Amazon Resource Name (ARN) and the assumed role ID, which are identifiers that you can use
    # to refer to the resulting temporary security credentials. For example, you can reference these
    # credentials as a principal in a resource-based policy by using the ARN or assumed role ID. The
    # ARN and ID include the `RoleSessionName` that you specified when you called `AssumeRole`.
    property assumed_role_user : AssumedRoleUser | Nil

    # A percentage value that indicates the packed size of the session policies and session tags
    # combined passed in the request. The request fails if the packed size is greater than 100
    # percent, which means the policies and tags exceeded the allowed space.
    property packed_policy_size : Int32 | Nil

    # The issuing authority of the web identity token presented. For OpenID Connect ID tokens, this
    # contains the value of the `iss` field. For OAuth 2.0 access tokens, this contains the value of
    # the `ProviderId` parameter that was passed in the `AssumeRoleWithWebIdentity` request.
    property provider : String | Nil

    # The intended audience (also known as client ID) of the web identity token. This is traditionally
    # the client identifier issued to the application that requested the web identity token.
    property audience : String | Nil

    # The value of the source identity that is returned in the JSON web token (JWT) from the identity
    # provider.
    #
    # You can require users to set a source identity value when they assume a role. You do this by
    # using the `sts:SourceIdentity` condition key in a role trust policy. That way, actions that are
    # taken with the role are associated with that user. After the source identity is set, the value
    # cannot be changed. It is present in the request for all actions that are taken by the role and
    # persists across [chained
    # role](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html#id_roles_terms-and-concepts)
    # sessions. You can configure your identity provider to use an attribute associated with your
    # users, like user name or email, as the source identity when calling `AssumeRoleWithWebIdentity`.
    # You do this by adding a claim to the JSON web token. To learn more about OIDC tokens and claims,
    # see [Using Tokens with User
    # Pools](https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-using-tokens-with-identity-providers.html)
    # in the *Amazon Cognito Developer Guide*. For more information about using source identity, see
    # [Monitor and control actions taken with assumed
    # roles](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_control-access_monitor.html)
    # in the *IAM User Guide*.
    #
    # The regex used to validate this parameter is a string of characters consisting of upper- and
    # lower-case alphanumeric characters with no spaces. You can also include underscores or any of
    # the following characters: =,.@-
    property source_identity : String | Nil

    def initialize(
      @credentials : Credentials | Nil = nil,
      @subject_from_web_identity_token : String | Nil = nil,
      @assumed_role_user : AssumedRoleUser | Nil = nil,
      @packed_policy_size : Int32 | Nil = nil,
      @provider : String | Nil = nil,
      @audience : String | Nil = nil,
      @source_identity : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @credentials
        params.concat(value.to_query_params("#{prefix}Credentials."))
      end

      if value = @subject_from_web_identity_token
        params << {"#{prefix}SubjectFromWebIdentityToken", value}
      end

      if value = @assumed_role_user
        params.concat(value.to_query_params("#{prefix}AssumedRoleUser."))
      end

      if value = @packed_policy_size
        params << {"#{prefix}PackedPolicySize", value.to_s}
      end

      if value = @provider
        params << {"#{prefix}Provider", value}
      end

      if value = @audience
        params << {"#{prefix}Audience", value}
      end

      if value = @source_identity
        params << {"#{prefix}SourceIdentity", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        credentials: node.xpath_node("*[local-name()='Credentials']").try { |n| Credentials.from_xml(n) },
        subject_from_web_identity_token: Core::XMLValue.string(node.xpath_node("*[local-name()='SubjectFromWebIdentityToken']")),
        assumed_role_user: node.xpath_node("*[local-name()='AssumedRoleUser']").try { |n| AssumedRoleUser.from_xml(n) },
        packed_policy_size: Core::XMLValue.i32(node.xpath_node("*[local-name()='PackedPolicySize']")),
        provider: Core::XMLValue.string(node.xpath_node("*[local-name()='Provider']")),
        audience: Core::XMLValue.string(node.xpath_node("*[local-name()='Audience']")),
        source_identity: Core::XMLValue.string(node.xpath_node("*[local-name()='SourceIdentity']")),
      )
    end

    def validate! : Nil
      if value = @credentials
        value.validate!
      end

      if value = @subject_from_web_identity_token
        raise Core::ValidationError.new("SubjectFromWebIdentityToken length must be >= 6") if value.size < 6
        raise Core::ValidationError.new("SubjectFromWebIdentityToken length must be <= 255") if value.size > 255
      end

      if value = @assumed_role_user
        value.validate!
      end

      if value = @packed_policy_size
        raise Core::ValidationError.new("PackedPolicySize value must be >= 0") if value < 0
      end

      if value = @source_identity
        raise Core::ValidationError.new("SourceIdentity length must be >= 2") if value.size < 2
        raise Core::ValidationError.new("SourceIdentity length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("SourceIdentity does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@-]*$"))
      end
    end

    def_equals_and_hash(@credentials, @subject_from_web_identity_token, @assumed_role_user, @packed_policy_size, @provider, @audience, @source_identity)
  end
end
