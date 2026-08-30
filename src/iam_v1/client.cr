private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  class Client < Core::Client
    Log               = ::Log.for("amazonite.iam_v1.client")
    EXCEPTION_FACTORY = ExceptionFactory.new

    def initialize(config = Core::Config.new)
      super("AWSIdentityManagementV20100508", "iam", "1.0", EXCEPTION_FACTORY, config)
    end

    # Accepts a delegation request, granting the requested temporary access.
    #
    # Once the delegation request is accepted, it is eligible to send the exchange token to the
    # partner. The
    # [SendDelegationToken](https://docs.aws.amazon.com/IAM/latest/APIReference/API_SendDelegationToken.html)
    # API has to be explicitly called to send the delegation token.
    #
    # At the time of acceptance, IAM records the details and the state of the identity that called
    # this API. This is the identity that gets mapped to the delegated credential.
    #
    # An accepted request may be rejected before the exchange token is sent to the partner.
    def accept_delegation_request(input : AI::AcceptDelegationRequestRequest) : Core::Response
      Log.info { "performing 'AcceptDelegationRequest' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "AcceptDelegationRequest")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("AcceptDelegationRequest", body)
      Core::Response.new(response)
    end

    # Creates an IAM role from the specified role template. The new role takes its
    # configuration—including its name, path, trust policy, inline and managed policies, permissions
    # boundary, tags, and maximum session duration—from the role template version that you specify.
    # For more information about roles, see [IAM
    # roles](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html) in the *IAM User Guide*.
    #
    # If the template version defines parameters, use the `ReplacementValues` parameter to supply the
    # values that the service substitutes into the role during creation.
    def acquire_role(input : AI::AcquireRoleRequest) : Core::ParsedResponse(AI::AcquireRoleResponse)
      Log.info { "performing 'AcquireRole' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "AcquireRole")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("AcquireRole", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='AcquireRoleResult']").not_nil!
      result = AI::AcquireRoleResponse.from_xml(result_node)
      Core::ParsedResponse(AI::AcquireRoleResponse).new(response, result)
    end

    # Adds a new client ID (also known as audience) to the list of client IDs already registered for
    # the specified IAM OpenID Connect (OIDC) provider resource.
    #
    # This operation is idempotent; it does not fail or return an error if you add an existing client
    # ID to the provider.
    def add_client_id_to_open_id_connect_provider(input : AI::AddClientIDToOpenIDConnectProviderRequest) : Core::Response
      Log.info { "performing 'AddClientIDToOpenIDConnectProvider' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "AddClientIDToOpenIDConnectProvider")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("AddClientIDToOpenIDConnectProvider", body)
      Core::Response.new(response)
    end

    # Adds the specified IAM role to the specified instance profile. An instance profile can contain
    # only one role, and this quota cannot be increased. You can remove the existing role and then add
    # a different role to an instance profile. You must then wait for the change to appear across all
    # of Amazon Web Services because of [eventual
    # consistency](https://en.wikipedia.org/wiki/Eventual_consistency). To force the change, you must
    # [disassociate the instance
    # profile](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DisassociateIamInstanceProfile.html)
    # and then [associate the instance
    # profile](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_AssociateIamInstanceProfile.html),
    # or you can stop your instance and then restart it.
    #
    # The caller of this operation must be granted the `PassRole` permission on the IAM role by a
    # permissions policy.
    #
    # When using the
    # [iam:AssociatedResourceArn](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_iam-condition-keys.html#available-keys-for-iam)
    # condition in a policy to restrict the
    # [PassRole](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_passrole.html) IAM
    # action, special considerations apply if the policy is intended to define access for the
    # `AddRoleToInstanceProfile` action. In this case, you cannot specify a Region or instance ID in
    # the EC2 instance ARN. The ARN value must be `arn:aws:ec2:*:CallerAccountId:instance/*`. Using
    # any other ARN value may lead to unexpected evaluation results.
    #
    # For more information about roles, see [IAM
    # roles](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html) in the *IAM User Guide*.
    # For more information about instance profiles, see [Using instance
    # profiles](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_switch-role-ec2_instance-profiles.html)
    # in the *IAM User Guide*.
    def add_role_to_instance_profile(input : AI::AddRoleToInstanceProfileRequest) : Core::Response
      Log.info { "performing 'AddRoleToInstanceProfile' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "AddRoleToInstanceProfile")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("AddRoleToInstanceProfile", body)
      Core::Response.new(response)
    end

    # Adds the specified user to the specified group.
    def add_user_to_group(input : AI::AddUserToGroupRequest) : Core::Response
      Log.info { "performing 'AddUserToGroup' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "AddUserToGroup")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("AddUserToGroup", body)
      Core::Response.new(response)
    end

    # Associates a delegation request with the current identity.
    #
    # If the partner that created the delegation request has specified the owner account during
    # creation, only an identity from that owner account can call the `AssociateDelegationRequest` API
    # for the specified delegation request. Once the `AssociateDelegationRequest` API call is
    # successful, the ARN of the current calling identity will be stored as the `ownerId` of the
    # request.
    #
    # If the partner that created the delegation request has not specified the owner account during
    # creation, any caller from any account can call the `AssociateDelegationRequest` API for the
    # delegation request. Once this API call is successful, the ARN of the current calling identity
    # will be stored as the `ownerId` and the Amazon Web Services account ID of the current calling
    # identity will be stored as the `ownerAccount` of the request.
    #
    # For more details, see [ Managing Permissions for Delegation
    # Requests](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies-temporary-delegation.html#temporary-delegation-managing-permissions).
    def associate_delegation_request(input : AI::AssociateDelegationRequestRequest) : Core::Response
      Log.info { "performing 'AssociateDelegationRequest' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "AssociateDelegationRequest")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("AssociateDelegationRequest", body)
      Core::Response.new(response)
    end

    # Attaches the specified managed policy to the specified IAM group.
    #
    # You use this operation to attach a managed policy to a group. To embed an inline policy in a
    # group, use [ `PutGroupPolicy`
    # ](https://docs.aws.amazon.com/IAM/latest/APIReference/API_PutGroupPolicy.html).
    #
    # As a best practice, you can validate your IAM policies. To learn more, see [Validating IAM
    # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_policy-validator.html)
    # in the *IAM User Guide*.
    #
    # For more information about policies, see [Managed policies and inline
    # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html) in
    # the *IAM User Guide*.
    def attach_group_policy(input : AI::AttachGroupPolicyRequest) : Core::Response
      Log.info { "performing 'AttachGroupPolicy' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "AttachGroupPolicy")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("AttachGroupPolicy", body)
      Core::Response.new(response)
    end

    # Attaches the specified managed policy to the specified IAM role. When you attach a managed
    # policy to a role, the managed policy becomes part of the role's permission (access) policy.
    #
    # You cannot use a managed policy as the role's trust policy. The role's trust policy is created
    # at the same time as the role, using [ `CreateRole`
    # ](https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateRole.html). You can update a
    # role's trust policy using [ `UpdateAssumerolePolicy`
    # ](https://docs.aws.amazon.com/IAM/latest/APIReference/API_UpdateAssumeRolePolicy.html).
    #
    # Use this operation to attach a *managed* policy to a role. To embed an inline policy in a role,
    # use [ `PutRolePolicy`
    # ](https://docs.aws.amazon.com/IAM/latest/APIReference/API_PutRolePolicy.html). For more
    # information about policies, see [Managed policies and inline
    # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html) in
    # the *IAM User Guide*.
    #
    # As a best practice, you can validate your IAM policies. To learn more, see [Validating IAM
    # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_policy-validator.html)
    # in the *IAM User Guide*.
    def attach_role_policy(input : AI::AttachRolePolicyRequest) : Core::Response
      Log.info { "performing 'AttachRolePolicy' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "AttachRolePolicy")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("AttachRolePolicy", body)
      Core::Response.new(response)
    end

    # Attaches the specified managed policy to the specified user.
    #
    # You use this operation to attach a *managed* policy to a user. To embed an inline policy in a
    # user, use [ `PutUserPolicy`
    # ](https://docs.aws.amazon.com/IAM/latest/APIReference/API_PutUserPolicy.html).
    #
    # As a best practice, you can validate your IAM policies. To learn more, see [Validating IAM
    # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_policy-validator.html)
    # in the *IAM User Guide*.
    #
    # For more information about policies, see [Managed policies and inline
    # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html) in
    # the *IAM User Guide*.
    def attach_user_policy(input : AI::AttachUserPolicyRequest) : Core::Response
      Log.info { "performing 'AttachUserPolicy' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "AttachUserPolicy")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("AttachUserPolicy", body)
      Core::Response.new(response)
    end

    # Changes the password of the IAM user who is calling this operation. This operation can be
    # performed using the CLI, the Amazon Web Services API, or the **My Security Credentials** page in
    # the Amazon Web Services Management Console. The Amazon Web Services account root user password
    # is not affected by this operation.
    #
    # Use
    # [UpdateLoginProfile](https://docs.aws.amazon.com/IAM/latest/APIReference/API_UpdateLoginProfile.html)
    # to use the CLI, the Amazon Web Services API, or the **Users** page in the IAM console to change
    # the password for any IAM user. For more information about modifying passwords, see [Managing
    # passwords](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_ManagingLogins.html) in the
    # *IAM User Guide*.
    def change_password(input : AI::ChangePasswordRequest) : Core::Response
      Log.info { "performing 'ChangePassword' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ChangePassword")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ChangePassword", body)
      Core::Response.new(response)
    end

    # Creates a new Amazon Web Services secret access key and corresponding Amazon Web Services access
    # key ID for the specified user. The default status for new keys is `Active`.
    #
    # If you do not specify a user name, IAM determines the user name implicitly based on the Amazon
    # Web Services access key ID signing the request. This operation works for access keys under the
    # Amazon Web Services account. Consequently, you can use this operation to manage Amazon Web
    # Services account root user credentials. This is true even if the Amazon Web Services account has
    # no associated users.
    #
    # For information about quotas on the number of keys you can create, see [IAM and STS
    # quotas](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html) in the *IAM
    # User Guide*.
    #
    # To ensure the security of your Amazon Web Services account, the secret access key is accessible
    # only during key and user creation. You must save the key (for example, in a text file) if you
    # want to be able to access it again. If a secret key is lost, you can delete the access keys for
    # the associated user and then create new keys.
    def create_access_key(input : AI::CreateAccessKeyRequest) : Core::ParsedResponse(AI::CreateAccessKeyResponse)
      Log.info { "performing 'CreateAccessKey' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "CreateAccessKey")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("CreateAccessKey", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='CreateAccessKeyResult']").not_nil!
      result = AI::CreateAccessKeyResponse.from_xml(result_node)
      Core::ParsedResponse(AI::CreateAccessKeyResponse).new(response, result)
    end

    # Creates an alias for your Amazon Web Services account. For information about using an Amazon Web
    # Services account alias, see [Creating, deleting, and listing an Amazon Web Services account
    # alias](https://docs.aws.amazon.com/signin/latest/userguide/CreateAccountAlias.html) in the
    # *Amazon Web Services Sign-In User Guide*.
    def create_account_alias(input : AI::CreateAccountAliasRequest) : Core::Response
      Log.info { "performing 'CreateAccountAlias' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "CreateAccountAlias")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("CreateAccountAlias", body)
      Core::Response.new(response)
    end

    # Creates an IAM delegation request for temporary access delegation.
    #
    # This API is not available for general use. In order to use this API, a caller first need to go
    # through an onboarding process described in the [partner onboarding
    # documentation](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies-temporary-delegation-partner-guide.html).
    def create_delegation_request(input : AI::CreateDelegationRequestRequest) : Core::ParsedResponse(AI::CreateDelegationRequestResponse)
      Log.info { "performing 'CreateDelegationRequest' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "CreateDelegationRequest")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("CreateDelegationRequest", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='CreateDelegationRequestResult']").not_nil!
      result = AI::CreateDelegationRequestResponse.from_xml(result_node)
      Core::ParsedResponse(AI::CreateDelegationRequestResponse).new(response, result)
    end

    # Creates a new group.
    #
    # For information about the number of groups you can create, see [IAM and STS
    # quotas](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html) in the *IAM
    # User Guide*.
    def create_group(input : AI::CreateGroupRequest) : Core::ParsedResponse(AI::CreateGroupResponse)
      Log.info { "performing 'CreateGroup' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "CreateGroup")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("CreateGroup", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='CreateGroupResult']").not_nil!
      result = AI::CreateGroupResponse.from_xml(result_node)
      Core::ParsedResponse(AI::CreateGroupResponse).new(response, result)
    end

    # Creates a new instance profile. For information about instance profiles, see [Using roles for
    # applications on Amazon
    # EC2](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_switch-role-ec2.html) in the
    # *IAM User Guide*, and [Instance
    # profiles](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/iam-roles-for-amazon-ec2.html#ec2-instance-profile)
    # in the *Amazon EC2 User Guide*.
    #
    # For information about the number of instance profiles you can create, see [IAM object
    # quotas](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html) in the *IAM
    # User Guide*.
    def create_instance_profile(input : AI::CreateInstanceProfileRequest) : Core::ParsedResponse(AI::CreateInstanceProfileResponse)
      Log.info { "performing 'CreateInstanceProfile' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "CreateInstanceProfile")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("CreateInstanceProfile", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='CreateInstanceProfileResult']").not_nil!
      result = AI::CreateInstanceProfileResponse.from_xml(result_node)
      Core::ParsedResponse(AI::CreateInstanceProfileResponse).new(response, result)
    end

    # Creates a password for the specified IAM user. A password allows an IAM user to access Amazon
    # Web Services services through the Amazon Web Services Management Console.
    #
    # You can use the CLI, the Amazon Web Services API, or the **Users** page in the IAM console to
    # create a password for any IAM user. Use
    # [ChangePassword](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ChangePassword.html) to
    # update your own existing password in the **My Security Credentials** page in the Amazon Web
    # Services Management Console.
    #
    # For more information about managing passwords, see [Managing
    # passwords](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_ManagingLogins.html) in the
    # *IAM User Guide*.
    def create_login_profile(input : AI::CreateLoginProfileRequest) : Core::ParsedResponse(AI::CreateLoginProfileResponse)
      Log.info { "performing 'CreateLoginProfile' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "CreateLoginProfile")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("CreateLoginProfile", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='CreateLoginProfileResult']").not_nil!
      result = AI::CreateLoginProfileResponse.from_xml(result_node)
      Core::ParsedResponse(AI::CreateLoginProfileResponse).new(response, result)
    end

    # Creates an IAM entity to describe an identity provider (IdP) that supports [OpenID Connect
    # (OIDC)](http://openid.net/connect/).
    #
    # The OIDC provider that you create with this operation can be used as a principal in a role's
    # trust policy. Such a policy establishes a trust relationship between Amazon Web Services and the
    # OIDC provider.
    #
    # If you are using an OIDC identity provider from Google, Facebook, or Amazon Cognito, you don't
    # need to create a separate IAM identity provider. These OIDC identity providers are already
    # built-in to Amazon Web Services and are available for your use. Instead, you can move directly
    # to creating new roles using your identity provider. To learn more, see [Creating a role for web
    # identity or OpenID connect
    # federation](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_create_for-idp_oidc.html)
    # in the *IAM User Guide*.
    #
    # When you create the IAM OIDC provider, you specify the following:
    #
    # - The URL of the OIDC identity provider (IdP) to trust
    #
    # - A list of client IDs (also known as audiences) that identify the application or applications
    # allowed to authenticate using the OIDC provider
    #
    # - A list of tags that are attached to the specified IAM OIDC provider
    #
    # - A list of thumbprints of one or more server certificates that the IdP uses
    #
    # You get all of this information from the OIDC IdP you want to use to access Amazon Web Services.
    #
    # Amazon Web Services secures communication with OIDC identity providers (IdPs) using our library
    # of trusted root certificate authorities (CAs) to verify the JSON Web Key Set (JWKS) endpoint's
    # TLS certificate. If your OIDC IdP relies on a certificate that is not signed by one of these
    # trusted CAs, only then we secure communication using the thumbprints set in the IdP's
    # configuration.
    #
    # The trust for the OIDC provider is derived from the IAM provider that this operation creates.
    # Therefore, it is best to limit access to the
    # [CreateOpenIDConnectProvider](https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateOpenIDConnectProvider.html)
    # operation to highly privileged users.
    def create_open_id_connect_provider(input : AI::CreateOpenIDConnectProviderRequest) : Core::ParsedResponse(AI::CreateOpenIDConnectProviderResponse)
      Log.info { "performing 'CreateOpenIDConnectProvider' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "CreateOpenIDConnectProvider")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("CreateOpenIDConnectProvider", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='CreateOpenIDConnectProviderResult']").not_nil!
      result = AI::CreateOpenIDConnectProviderResponse.from_xml(result_node)
      Core::ParsedResponse(AI::CreateOpenIDConnectProviderResponse).new(response, result)
    end

    # Creates a new managed policy for your Amazon Web Services account.
    #
    # This operation creates a policy version with a version identifier of `v1` and sets v1 as the
    # policy's default version. For more information about policy versions, see [Versioning for
    # managed
    # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-versions.html) in
    # the *IAM User Guide*.
    #
    # As a best practice, you can validate your IAM policies. To learn more, see [Validating IAM
    # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_policy-validator.html)
    # in the *IAM User Guide*.
    #
    # For more information about managed policies in general, see [Managed policies and inline
    # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html) in
    # the *IAM User Guide*.
    def create_policy(input : AI::CreatePolicyRequest) : Core::ParsedResponse(AI::CreatePolicyResponse)
      Log.info { "performing 'CreatePolicy' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "CreatePolicy")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("CreatePolicy", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='CreatePolicyResult']").not_nil!
      result = AI::CreatePolicyResponse.from_xml(result_node)
      Core::ParsedResponse(AI::CreatePolicyResponse).new(response, result)
    end

    # Creates a new version of the specified managed policy. To update a managed policy, you create a
    # new policy version. A managed policy can have up to five versions. If the policy has five
    # versions, you must delete an existing version using
    # [DeletePolicyVersion](https://docs.aws.amazon.com/IAM/latest/APIReference/API_DeletePolicyVersion.html)
    # before you create a new version.
    #
    # Optionally, you can set the new version as the policy's default version. The default version is
    # the version that is in effect for the IAM users, groups, and roles to which the policy is
    # attached.
    #
    # For more information about managed policy versions, see [Versioning for managed
    # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-versions.html) in
    # the *IAM User Guide*.
    def create_policy_version(input : AI::CreatePolicyVersionRequest) : Core::ParsedResponse(AI::CreatePolicyVersionResponse)
      Log.info { "performing 'CreatePolicyVersion' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "CreatePolicyVersion")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("CreatePolicyVersion", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='CreatePolicyVersionResult']").not_nil!
      result = AI::CreatePolicyVersionResponse.from_xml(result_node)
      Core::ParsedResponse(AI::CreatePolicyVersionResponse).new(response, result)
    end

    # Creates a new role for your Amazon Web Services account.
    #
    # For more information about roles, see [IAM
    # roles](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html) in the *IAM User Guide*.
    # For information about quotas for role names and the number of roles you can create, see [IAM and
    # STS quotas](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html) in the
    # *IAM User Guide*.
    def create_role(input : AI::CreateRoleRequest) : Core::ParsedResponse(AI::CreateRoleResponse)
      Log.info { "performing 'CreateRole' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "CreateRole")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("CreateRole", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='CreateRoleResult']").not_nil!
      result = AI::CreateRoleResponse.from_xml(result_node)
      Core::ParsedResponse(AI::CreateRoleResponse).new(response, result)
    end

    # Creates an IAM resource that describes an identity provider (IdP) that supports SAML 2.0.
    #
    # The SAML provider resource that you create with this operation can be used as a principal in an
    # IAM role's trust policy. Such a policy can enable federated users who sign in using the SAML IdP
    # to assume the role. You can create an IAM role that supports Web-based single sign-on (SSO) to
    # the Amazon Web Services Management Console or one that supports API access to Amazon Web
    # Services.
    #
    # When you create the SAML provider resource, you upload a SAML metadata document that you get
    # from your IdP. That document includes the issuer's name, expiration information, and keys that
    # can be used to validate the SAML authentication response (assertions) that the IdP sends. You
    # must generate the metadata document using the identity management software that is used as your
    # organization's IdP.
    #
    # This operation requires [Signature Version
    # 4](https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html).
    #
    # For more information, see [Enabling SAML 2.0 federated users to access the Amazon Web Services
    # Management
    # Console](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_enable-console-saml.html)
    # and [About SAML 2.0-based
    # federation](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_saml.html) in
    # the *IAM User Guide*.
    def create_saml_provider(input : AI::CreateSAMLProviderRequest) : Core::ParsedResponse(AI::CreateSAMLProviderResponse)
      Log.info { "performing 'CreateSAMLProvider' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "CreateSAMLProvider")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("CreateSAMLProvider", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='CreateSAMLProviderResult']").not_nil!
      result = AI::CreateSAMLProviderResponse.from_xml(result_node)
      Core::ParsedResponse(AI::CreateSAMLProviderResponse).new(response, result)
    end

    # Creates an IAM role that is linked to a specific Amazon Web Services service. The service
    # controls the attached policies and when the role can be deleted. This helps ensure that the
    # service is not broken by an unexpectedly changed or deleted role, which could put your Amazon
    # Web Services resources into an unknown state. Allowing the service to control the role helps
    # improve service stability and proper cleanup when a service and its role are no longer needed.
    # For more information, see [Using service-linked
    # roles](https://docs.aws.amazon.com/IAM/latest/UserGuide/using-service-linked-roles.html) in the
    # *IAM User Guide*.
    #
    # To attach a policy to this service-linked role, you must make the request using the Amazon Web
    # Services service that depends on this role.
    def create_service_linked_role(input : AI::CreateServiceLinkedRoleRequest) : Core::ParsedResponse(AI::CreateServiceLinkedRoleResponse)
      Log.info { "performing 'CreateServiceLinkedRole' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "CreateServiceLinkedRole")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("CreateServiceLinkedRole", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='CreateServiceLinkedRoleResult']").not_nil!
      result = AI::CreateServiceLinkedRoleResponse.from_xml(result_node)
      Core::ParsedResponse(AI::CreateServiceLinkedRoleResponse).new(response, result)
    end

    # Generates a set of credentials consisting of a user name and password that can be used to access
    # the service specified in the request. These credentials are generated by IAM, and can be used
    # only for the specified service.
    #
    # You can have a maximum of two sets of service-specific credentials for each supported service
    # per user.
    #
    # You can reset the password to a new service-generated value by calling
    # [ResetServiceSpecificCredential](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ResetServiceSpecificCredential.html).
    #
    # For more information about using service-specific credentials to authenticate to an Amazon Web
    # Services service, refer to the following docs:
    #
    # - For service-specific credentials with CodeCommit, refer to [IAM credentials for CodeCommit:
    # Git credentials, SSH keys, and Amazon Web Services access
    # keys](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_ssh-keys.html) in the *IAM
    # User Guide*.
    #
    # - For service-specific credentials with Amazon Keyspaces (for Apache Cassandra), refer to [Use
    # IAM with Amazon Keyspaces (for Apache
    # Cassandra)](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_keyspaces.html) in
    # the *IAM User Guide*.
    #
    # - For services that support long-term API keys, refer to [API keys for Amazon Web Services
    # services](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_api_keys_for_aws_services.html)
    # in the *IAM User Guide*.
    def create_service_specific_credential(input : AI::CreateServiceSpecificCredentialRequest) : Core::ParsedResponse(AI::CreateServiceSpecificCredentialResponse)
      Log.info { "performing 'CreateServiceSpecificCredential' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "CreateServiceSpecificCredential")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("CreateServiceSpecificCredential", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='CreateServiceSpecificCredentialResult']").not_nil!
      result = AI::CreateServiceSpecificCredentialResponse.from_xml(result_node)
      Core::ParsedResponse(AI::CreateServiceSpecificCredentialResponse).new(response, result)
    end

    # Creates a new IAM user for your Amazon Web Services account.
    #
    # For information about quotas for the number of IAM users you can create, see [IAM and STS
    # quotas](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html) in the *IAM
    # User Guide*.
    def create_user(input : AI::CreateUserRequest) : Core::ParsedResponse(AI::CreateUserResponse)
      Log.info { "performing 'CreateUser' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "CreateUser")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("CreateUser", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='CreateUserResult']").not_nil!
      result = AI::CreateUserResponse.from_xml(result_node)
      Core::ParsedResponse(AI::CreateUserResponse).new(response, result)
    end

    # Creates a new virtual MFA device for the Amazon Web Services account. After creating the virtual
    # MFA, use
    # [EnableMFADevice](https://docs.aws.amazon.com/IAM/latest/APIReference/API_EnableMFADevice.html)
    # to attach the MFA device to an IAM user. For more information about creating and working with
    # virtual MFA devices, see [Using a virtual MFA
    # device](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_VirtualMFA.html) in the *IAM User
    # Guide*.
    #
    # For information about the maximum number of MFA devices you can create, see [IAM and STS
    # quotas](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html) in the *IAM
    # User Guide*.
    #
    # The seed information contained in the QR code and the Base32 string should be treated like any
    # other secret access information. In other words, protect the seed information as you would your
    # Amazon Web Services access keys or your passwords. After you provision your virtual device, you
    # should ensure that the information is destroyed following secure procedures.
    def create_virtual_mfa_device(input : AI::CreateVirtualMFADeviceRequest) : Core::ParsedResponse(AI::CreateVirtualMFADeviceResponse)
      Log.info { "performing 'CreateVirtualMFADevice' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "CreateVirtualMFADevice")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("CreateVirtualMFADevice", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='CreateVirtualMFADeviceResult']").not_nil!
      result = AI::CreateVirtualMFADeviceResponse.from_xml(result_node)
      Core::ParsedResponse(AI::CreateVirtualMFADeviceResponse).new(response, result)
    end

    # Deactivates the specified MFA device and removes it from association with the user name for
    # which it was originally enabled.
    #
    # For more information about creating and working with virtual MFA devices, see [Enabling a
    # virtual multi-factor authentication (MFA)
    # device](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_VirtualMFA.html) in the *IAM User
    # Guide*.
    def deactivate_mfa_device(input : AI::DeactivateMFADeviceRequest) : Core::Response
      Log.info { "performing 'DeactivateMFADevice' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeactivateMFADevice")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeactivateMFADevice", body)
      Core::Response.new(response)
    end

    # Deletes the access key pair associated with the specified IAM user.
    #
    # If you do not specify a user name, IAM determines the user name implicitly based on the Amazon
    # Web Services access key ID signing the request. This operation works for access keys under the
    # Amazon Web Services account. Consequently, you can use this operation to manage Amazon Web
    # Services account root user credentials even if the Amazon Web Services account has no associated
    # users.
    def delete_access_key(input : AI::DeleteAccessKeyRequest) : Core::Response
      Log.info { "performing 'DeleteAccessKey' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeleteAccessKey")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeleteAccessKey", body)
      Core::Response.new(response)
    end

    # Deletes the specified Amazon Web Services account alias. For information about using an Amazon
    # Web Services account alias, see [Creating, deleting, and listing an Amazon Web Services account
    # alias](https://docs.aws.amazon.com/signin/latest/userguide/CreateAccountAlias.html) in the
    # *Amazon Web Services Sign-In User Guide*.
    def delete_account_alias(input : AI::DeleteAccountAliasRequest) : Core::Response
      Log.info { "performing 'DeleteAccountAlias' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeleteAccountAlias")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeleteAccountAlias", body)
      Core::Response.new(response)
    end

    # Deletes the password policy for the Amazon Web Services account. There are no parameters.
    def delete_account_password_policy : Core::Response
      Log.info { "performing 'DeleteAccountPasswordPolicy' operation" }
      params = [] of {String, String}
      body = URI::Params.build do |form|
        form.add("Action", "DeleteAccountPasswordPolicy")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeleteAccountPasswordPolicy", body)
      Core::Response.new(response)
    end

    # Deletes the specified IAM group. The group must not contain any users or have any attached
    # policies.
    def delete_group(input : AI::DeleteGroupRequest) : Core::Response
      Log.info { "performing 'DeleteGroup' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeleteGroup")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeleteGroup", body)
      Core::Response.new(response)
    end

    # Deletes the specified inline policy that is embedded in the specified IAM group.
    #
    # A group can also have managed policies attached to it. To detach a managed policy from a group,
    # use
    # [DetachGroupPolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_DetachGroupPolicy.html).
    # For more information about policies, refer to [Managed policies and inline
    # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html) in
    # the *IAM User Guide*.
    def delete_group_policy(input : AI::DeleteGroupPolicyRequest) : Core::Response
      Log.info { "performing 'DeleteGroupPolicy' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeleteGroupPolicy")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeleteGroupPolicy", body)
      Core::Response.new(response)
    end

    # Deletes the specified instance profile. The instance profile must not have an associated role.
    #
    # Make sure that you do not have any Amazon EC2 instances running with the instance profile you
    # are about to delete. Deleting a role or instance profile that is associated with a running
    # instance will break any applications running on the instance.
    #
    # For more information about instance profiles, see [Using instance
    # profiles](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_switch-role-ec2_instance-profiles.html)
    # in the *IAM User Guide*.
    def delete_instance_profile(input : AI::DeleteInstanceProfileRequest) : Core::Response
      Log.info { "performing 'DeleteInstanceProfile' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeleteInstanceProfile")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeleteInstanceProfile", body)
      Core::Response.new(response)
    end

    # Deletes the password for the specified IAM user or root user, For more information, see
    # [Managing passwords for IAM
    # users](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_passwords_admin-change-user.html).
    #
    # You can use the CLI, the Amazon Web Services API, or the **Users** page in the IAM console to
    # delete a password for any IAM user. You can use
    # [ChangePassword](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ChangePassword.html) to
    # update, but not delete, your own password in the **My Security Credentials** page in the Amazon
    # Web Services Management Console.
    #
    # Deleting a user's password does not prevent a user from accessing Amazon Web Services through
    # the command line interface or the API. To prevent all user access, you must also either make any
    # access keys inactive or delete them. For more information about making keys inactive or deleting
    # them, see
    # [UpdateAccessKey](https://docs.aws.amazon.com/IAM/latest/APIReference/API_UpdateAccessKey.html)
    # and
    # [DeleteAccessKey](https://docs.aws.amazon.com/IAM/latest/APIReference/API_DeleteAccessKey.html).
    def delete_login_profile(input : AI::DeleteLoginProfileRequest) : Core::Response
      Log.info { "performing 'DeleteLoginProfile' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeleteLoginProfile")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeleteLoginProfile", body)
      Core::Response.new(response)
    end

    # Deletes an OpenID Connect identity provider (IdP) resource object in IAM.
    #
    # Deleting an IAM OIDC provider resource does not update any roles that reference the provider as
    # a principal in their trust policies. Any attempt to assume a role that references a deleted
    # provider fails.
    #
    # This operation is idempotent; it does not fail or return an error if you call the operation for
    # a provider that does not exist.
    def delete_open_id_connect_provider(input : AI::DeleteOpenIDConnectProviderRequest) : Core::Response
      Log.info { "performing 'DeleteOpenIDConnectProvider' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeleteOpenIDConnectProvider")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeleteOpenIDConnectProvider", body)
      Core::Response.new(response)
    end

    # Deletes the specified managed policy.
    #
    # Before you can delete a managed policy, you must first detach the policy from all users, groups,
    # and roles that it is attached to. In addition, you must delete all the policy's versions. The
    # following steps describe the process for deleting a managed policy:
    #
    # - Detach the policy from all users, groups, and roles that the policy is attached to, using
    # [DetachUserPolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_DetachUserPolicy.html),
    # [DetachGroupPolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_DetachGroupPolicy.html),
    # or
    # [DetachRolePolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_DetachRolePolicy.html).
    # To list all the users, groups, and roles that a policy is attached to, use
    # [ListEntitiesForPolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListEntitiesForPolicy.html).
    #
    # - Delete all versions of the policy using
    # [DeletePolicyVersion](https://docs.aws.amazon.com/IAM/latest/APIReference/API_DeletePolicyVersion.html).
    # To list the policy's versions, use
    # [ListPolicyVersions](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListPolicyVersions.html).
    # You cannot use
    # [DeletePolicyVersion](https://docs.aws.amazon.com/IAM/latest/APIReference/API_DeletePolicyVersion.html)
    # to delete the version that is marked as the default version. You delete the policy's default
    # version in the next step of the process.
    #
    # - Delete the policy (this automatically deletes the policy's default version) using this
    # operation.
    #
    # For information about managed policies, see [Managed policies and inline
    # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html) in
    # the *IAM User Guide*.
    def delete_policy(input : AI::DeletePolicyRequest) : Core::Response
      Log.info { "performing 'DeletePolicy' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeletePolicy")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeletePolicy", body)
      Core::Response.new(response)
    end

    # Deletes the specified version from the specified managed policy.
    #
    # You cannot delete the default version from a policy using this operation. To delete the default
    # version from a policy, use
    # [DeletePolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_DeletePolicy.html). To
    # find out which version of a policy is marked as the default version, use
    # [ListPolicyVersions](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListPolicyVersions.html).
    #
    # For information about versions for managed policies, see [Versioning for managed
    # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-versions.html) in
    # the *IAM User Guide*.
    def delete_policy_version(input : AI::DeletePolicyVersionRequest) : Core::Response
      Log.info { "performing 'DeletePolicyVersion' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeletePolicyVersion")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeletePolicyVersion", body)
      Core::Response.new(response)
    end

    # Deletes the specified role. Unlike the Amazon Web Services Management Console, when you delete a
    # role programmatically, you must delete the items attached to the role manually, or the deletion
    # fails. For more information, see [Deleting an IAM
    # role](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_manage_delete.html#roles-managingrole-deleting-cli).
    # Before attempting to delete a role, remove the following attached items:
    #
    # - Inline policies
    # ([DeleteRolePolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_DeleteRolePolicy.html))
    #
    # - Attached managed policies
    # ([DetachRolePolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_DetachRolePolicy.html))
    #
    # - Instance profile
    # ([RemoveRoleFromInstanceProfile](https://docs.aws.amazon.com/IAM/latest/APIReference/API_RemoveRoleFromInstanceProfile.html))
    #
    # - Optional – Delete instance profile after detaching from role for resource clean up
    # ([DeleteInstanceProfile](https://docs.aws.amazon.com/IAM/latest/APIReference/API_DeleteInstanceProfile.html))
    #
    # Make sure that you do not have any Amazon EC2 instances running with the role you are about to
    # delete. Deleting a role or instance profile that is associated with a running instance will
    # break any applications running on the instance.
    def delete_role(input : AI::DeleteRoleRequest) : Core::Response
      Log.info { "performing 'DeleteRole' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeleteRole")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeleteRole", body)
      Core::Response.new(response)
    end

    # Deletes the permissions boundary for the specified IAM role.
    #
    # You cannot set the boundary for a service-linked role.
    #
    # Deleting the permissions boundary for a role might increase its permissions. For example, it
    # might allow anyone who assumes the role to perform all the actions granted in its permissions
    # policies.
    def delete_role_permissions_boundary(input : AI::DeleteRolePermissionsBoundaryRequest) : Core::Response
      Log.info { "performing 'DeleteRolePermissionsBoundary' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeleteRolePermissionsBoundary")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeleteRolePermissionsBoundary", body)
      Core::Response.new(response)
    end

    # Deletes the specified inline policy that is embedded in the specified IAM role.
    #
    # A role can also have managed policies attached to it. To detach a managed policy from a role,
    # use
    # [DetachRolePolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_DetachRolePolicy.html).
    # For more information about policies, refer to [Managed policies and inline
    # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html) in
    # the *IAM User Guide*.
    def delete_role_policy(input : AI::DeleteRolePolicyRequest) : Core::Response
      Log.info { "performing 'DeleteRolePolicy' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeleteRolePolicy")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeleteRolePolicy", body)
      Core::Response.new(response)
    end

    # Deletes a SAML provider resource in IAM.
    #
    # Deleting the provider resource from IAM does not update any roles that reference the SAML
    # provider resource's ARN as a principal in their trust policies. Any attempt to assume a role
    # that references a non-existent provider resource ARN fails.
    #
    # This operation requires [Signature Version
    # 4](https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html).
    def delete_saml_provider(input : AI::DeleteSAMLProviderRequest) : Core::Response
      Log.info { "performing 'DeleteSAMLProvider' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeleteSAMLProvider")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeleteSAMLProvider", body)
      Core::Response.new(response)
    end

    # Deletes the specified server certificate.
    #
    # For more information about working with server certificates, see [Working with server
    # certificates](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs.html)
    # in the *IAM User Guide*. This topic also includes a list of Amazon Web Services services that
    # can use the server certificates that you manage with IAM.
    #
    # If you are using a server certificate with Elastic Load Balancing, deleting the certificate
    # could have implications for your application. If Elastic Load Balancing doesn't detect the
    # deletion of bound certificates, it may continue to use the certificates. This could cause
    # Elastic Load Balancing to stop accepting traffic. We recommend that you remove the reference to
    # the certificate from Elastic Load Balancing before using this command to delete the certificate.
    # For more information, see
    # [DeleteLoadBalancerListeners](https://docs.aws.amazon.com/ElasticLoadBalancing/latest/APIReference/API_DeleteLoadBalancerListeners.html)
    # in the *Elastic Load Balancing API Reference*.
    def delete_server_certificate(input : AI::DeleteServerCertificateRequest) : Core::Response
      Log.info { "performing 'DeleteServerCertificate' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeleteServerCertificate")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeleteServerCertificate", body)
      Core::Response.new(response)
    end

    # Submits a service-linked role deletion request and returns a `DeletionTaskId`, which you can use
    # to check the status of the deletion. Before you call this operation, confirm that the role has
    # no active sessions and that any resources used by the role in the linked service are deleted. If
    # you call this operation more than once for the same service-linked role and an earlier deletion
    # task is not complete, then the `DeletionTaskId` of the earlier request is returned.
    #
    # If you submit a deletion request for a service-linked role whose linked service is still
    # accessing a resource, then the deletion task fails. If it fails, the
    # [GetServiceLinkedRoleDeletionStatus](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetServiceLinkedRoleDeletionStatus.html)
    # operation returns the reason for the failure, usually including the resources that must be
    # deleted. To delete the service-linked role, you must first remove those resources from the
    # linked service and then submit the deletion request again. Resources are specific to the service
    # that is linked to the role. For more information about removing resources from a service, see
    # the [Amazon Web Services documentation](http://docs.aws.amazon.com/) for your service.
    #
    # For more information about service-linked roles, see [Roles terms and concepts: Amazon Web
    # Services service-linked
    # role](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_terms-and-concepts.html#iam-term-service-linked-role)
    # in the *IAM User Guide*.
    def delete_service_linked_role(input : AI::DeleteServiceLinkedRoleRequest) : Core::ParsedResponse(AI::DeleteServiceLinkedRoleResponse)
      Log.info { "performing 'DeleteServiceLinkedRole' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeleteServiceLinkedRole")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeleteServiceLinkedRole", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='DeleteServiceLinkedRoleResult']").not_nil!
      result = AI::DeleteServiceLinkedRoleResponse.from_xml(result_node)
      Core::ParsedResponse(AI::DeleteServiceLinkedRoleResponse).new(response, result)
    end

    # Deletes the specified service-specific credential.
    def delete_service_specific_credential(input : AI::DeleteServiceSpecificCredentialRequest) : Core::Response
      Log.info { "performing 'DeleteServiceSpecificCredential' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeleteServiceSpecificCredential")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeleteServiceSpecificCredential", body)
      Core::Response.new(response)
    end

    # Deletes a signing certificate associated with the specified IAM user.
    #
    # If you do not specify a user name, IAM determines the user name implicitly based on the Amazon
    # Web Services access key ID signing the request. This operation works for access keys under the
    # Amazon Web Services account. Consequently, you can use this operation to manage Amazon Web
    # Services account root user credentials even if the Amazon Web Services account has no associated
    # IAM users.
    def delete_signing_certificate(input : AI::DeleteSigningCertificateRequest) : Core::Response
      Log.info { "performing 'DeleteSigningCertificate' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeleteSigningCertificate")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeleteSigningCertificate", body)
      Core::Response.new(response)
    end

    # Deletes the specified SSH public key.
    #
    # The SSH public key deleted by this operation is used only for authenticating the associated IAM
    # user to an CodeCommit repository. For more information about using SSH keys to authenticate to
    # an CodeCommit repository, see [Set up CodeCommit for SSH
    # connections](https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-credentials-ssh.html)
    # in the *CodeCommit User Guide*.
    def delete_ssh_public_key(input : AI::DeleteSSHPublicKeyRequest) : Core::Response
      Log.info { "performing 'DeleteSSHPublicKey' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeleteSSHPublicKey")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeleteSSHPublicKey", body)
      Core::Response.new(response)
    end

    # Deletes the specified IAM user. Unlike the Amazon Web Services Management Console, when you
    # delete a user programmatically, you must delete the items attached to the user manually, or the
    # deletion fails. For more information, see [Deleting an IAM
    # user](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_manage.html#id_users_deleting_cli).
    # Before attempting to delete a user, remove the following items:
    #
    # - Password
    # ([DeleteLoginProfile](https://docs.aws.amazon.com/IAM/latest/APIReference/API_DeleteLoginProfile.html))
    #
    # - Access keys
    # ([DeleteAccessKey](https://docs.aws.amazon.com/IAM/latest/APIReference/API_DeleteAccessKey.html))
    #
    # - Signing certificate
    # ([DeleteSigningCertificate](https://docs.aws.amazon.com/IAM/latest/APIReference/API_DeleteSigningCertificate.html))
    #
    # - SSH public key
    # ([DeleteSSHPublicKey](https://docs.aws.amazon.com/IAM/latest/APIReference/API_DeleteSSHPublicKey.html))
    #
    # - Git credentials
    # ([DeleteServiceSpecificCredential](https://docs.aws.amazon.com/IAM/latest/APIReference/API_DeleteServiceSpecificCredential.html))
    #
    # - Multi-factor authentication (MFA) device
    # ([DeactivateMFADevice](https://docs.aws.amazon.com/IAM/latest/APIReference/API_DeactivateMFADevice.html),
    # [DeleteVirtualMFADevice](https://docs.aws.amazon.com/IAM/latest/APIReference/API_DeleteVirtualMFADevice.html))
    #
    # - Inline policies
    # ([DeleteUserPolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_DeleteUserPolicy.html))
    #
    # - Attached managed policies
    # ([DetachUserPolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_DetachUserPolicy.html))
    #
    # - Group memberships
    # ([RemoveUserFromGroup](https://docs.aws.amazon.com/IAM/latest/APIReference/API_RemoveUserFromGroup.html))
    def delete_user(input : AI::DeleteUserRequest) : Core::Response
      Log.info { "performing 'DeleteUser' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeleteUser")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeleteUser", body)
      Core::Response.new(response)
    end

    # Deletes the permissions boundary for the specified IAM user.
    #
    # Deleting the permissions boundary for a user might increase its permissions by allowing the user
    # to perform all the actions granted in its permissions policies.
    def delete_user_permissions_boundary(input : AI::DeleteUserPermissionsBoundaryRequest) : Core::Response
      Log.info { "performing 'DeleteUserPermissionsBoundary' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeleteUserPermissionsBoundary")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeleteUserPermissionsBoundary", body)
      Core::Response.new(response)
    end

    # Deletes the specified inline policy that is embedded in the specified IAM user.
    #
    # A user can also have managed policies attached to it. To detach a managed policy from a user,
    # use
    # [DetachUserPolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_DetachUserPolicy.html).
    # For more information about policies, refer to [Managed policies and inline
    # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html) in
    # the *IAM User Guide*.
    def delete_user_policy(input : AI::DeleteUserPolicyRequest) : Core::Response
      Log.info { "performing 'DeleteUserPolicy' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeleteUserPolicy")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeleteUserPolicy", body)
      Core::Response.new(response)
    end

    # Deletes a virtual MFA device.
    #
    # You must deactivate a user's virtual MFA device before you can delete it. For information about
    # deactivating MFA devices, see
    # [DeactivateMFADevice](https://docs.aws.amazon.com/IAM/latest/APIReference/API_DeactivateMFADevice.html).
    def delete_virtual_mfa_device(input : AI::DeleteVirtualMFADeviceRequest) : Core::Response
      Log.info { "performing 'DeleteVirtualMFADevice' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeleteVirtualMFADevice")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeleteVirtualMFADevice", body)
      Core::Response.new(response)
    end

    # Removes the specified managed policy from the specified IAM group.
    #
    # A group can also have inline policies embedded with it. To delete an inline policy, use
    # [DeleteGroupPolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_DeleteGroupPolicy.html).
    # For information about policies, see [Managed policies and inline
    # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html) in
    # the *IAM User Guide*.
    def detach_group_policy(input : AI::DetachGroupPolicyRequest) : Core::Response
      Log.info { "performing 'DetachGroupPolicy' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DetachGroupPolicy")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DetachGroupPolicy", body)
      Core::Response.new(response)
    end

    # Removes the specified managed policy from the specified role.
    #
    # A role can also have inline policies embedded with it. To delete an inline policy, use
    # [DeleteRolePolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_DeleteRolePolicy.html).
    # For information about policies, see [Managed policies and inline
    # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html) in
    # the *IAM User Guide*.
    def detach_role_policy(input : AI::DetachRolePolicyRequest) : Core::Response
      Log.info { "performing 'DetachRolePolicy' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DetachRolePolicy")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DetachRolePolicy", body)
      Core::Response.new(response)
    end

    # Removes the specified managed policy from the specified user.
    #
    # A user can also have inline policies embedded with it. To delete an inline policy, use
    # [DeleteUserPolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_DeleteUserPolicy.html).
    # For information about policies, see [Managed policies and inline
    # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html) in
    # the *IAM User Guide*.
    def detach_user_policy(input : AI::DetachUserPolicyRequest) : Core::Response
      Log.info { "performing 'DetachUserPolicy' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DetachUserPolicy")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DetachUserPolicy", body)
      Core::Response.new(response)
    end

    # Disables the management of privileged root user credentials across member accounts in your
    # organization. When you disable this feature, the management account and the delegated
    # administrator for IAM can no longer manage root user credentials for member accounts in your
    # organization.
    def disable_organizations_root_credentials_management(input : AI::DisableOrganizationsRootCredentialsManagementRequest) : Core::ParsedResponse(AI::DisableOrganizationsRootCredentialsManagementResponse)
      Log.info { "performing 'DisableOrganizationsRootCredentialsManagement' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DisableOrganizationsRootCredentialsManagement")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DisableOrganizationsRootCredentialsManagement", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='DisableOrganizationsRootCredentialsManagementResult']").not_nil!
      result = AI::DisableOrganizationsRootCredentialsManagementResponse.from_xml(result_node)
      Core::ParsedResponse(AI::DisableOrganizationsRootCredentialsManagementResponse).new(response, result)
    end

    # Disables root user sessions for privileged tasks across member accounts in your organization.
    # When you disable this feature, the management account and the delegated administrator for IAM
    # can no longer perform privileged tasks on member accounts in your organization.
    def disable_organizations_root_sessions(input : AI::DisableOrganizationsRootSessionsRequest) : Core::ParsedResponse(AI::DisableOrganizationsRootSessionsResponse)
      Log.info { "performing 'DisableOrganizationsRootSessions' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DisableOrganizationsRootSessions")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DisableOrganizationsRootSessions", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='DisableOrganizationsRootSessionsResult']").not_nil!
      result = AI::DisableOrganizationsRootSessionsResponse.from_xml(result_node)
      Core::ParsedResponse(AI::DisableOrganizationsRootSessionsResponse).new(response, result)
    end

    # Disables the outbound identity federation feature for your Amazon Web Services account. When
    # disabled, IAM principals in the account cannot use the `GetWebIdentityToken` API to obtain JSON
    # Web Tokens (JWTs) for authentication with external services. This operation does not affect
    # tokens that were issued before the feature was disabled.
    def disable_outbound_web_identity_federation : Core::Response
      Log.info { "performing 'DisableOutboundWebIdentityFederation' operation" }
      params = [] of {String, String}
      body = URI::Params.build do |form|
        form.add("Action", "DisableOutboundWebIdentityFederation")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DisableOutboundWebIdentityFederation", body)
      Core::Response.new(response)
    end

    # Enables the specified MFA device and associates it with the specified IAM user. When enabled,
    # the MFA device is required for every subsequent login by the IAM user associated with the
    # device.
    def enable_mfa_device(input : AI::EnableMFADeviceRequest) : Core::Response
      Log.info { "performing 'EnableMFADevice' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "EnableMFADevice")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("EnableMFADevice", body)
      Core::Response.new(response)
    end

    # Enables the management of privileged root user credentials across member accounts in your
    # organization. When you enable root credentials management for [centralized root
    # access](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_root-user.html#id_root-user-access-management),
    # the management account and the delegated administrator for IAM can manage root user credentials
    # for member accounts in your organization.
    #
    # Before you enable centralized root access, you must have an account configured with the
    # following settings:
    #
    # - You must manage your Amazon Web Services accounts in
    # [Organizations](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_introduction.html).
    #
    # - Enable trusted access for Identity and Access Management in Organizations. For details, see
    # [IAM and
    # Organizations](https://docs.aws.amazon.com/organizations/latest/userguide/services-that-can-integrate-iam.html)
    # in the *Organizations User Guide*.
    def enable_organizations_root_credentials_management(input : AI::EnableOrganizationsRootCredentialsManagementRequest) : Core::ParsedResponse(AI::EnableOrganizationsRootCredentialsManagementResponse)
      Log.info { "performing 'EnableOrganizationsRootCredentialsManagement' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "EnableOrganizationsRootCredentialsManagement")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("EnableOrganizationsRootCredentialsManagement", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='EnableOrganizationsRootCredentialsManagementResult']").not_nil!
      result = AI::EnableOrganizationsRootCredentialsManagementResponse.from_xml(result_node)
      Core::ParsedResponse(AI::EnableOrganizationsRootCredentialsManagementResponse).new(response, result)
    end

    # Allows the management account or delegated administrator to perform privileged tasks on member
    # accounts in your organization. For more information, see [Centrally manage root access for
    # member
    # accounts](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_root-user.html#id_root-user-access-management)
    # in the *Identity and Access Management User Guide*.
    #
    # Before you enable this feature, you must have an account configured with the following settings:
    #
    # - You must manage your Amazon Web Services accounts in
    # [Organizations](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_introduction.html).
    #
    # - Enable trusted access for Identity and Access Management in Organizations. For details, see
    # [IAM and
    # Organizations](https://docs.aws.amazon.com/organizations/latest/userguide/services-that-can-integrate-ra.html)
    # in the *Organizations User Guide*.
    def enable_organizations_root_sessions(input : AI::EnableOrganizationsRootSessionsRequest) : Core::ParsedResponse(AI::EnableOrganizationsRootSessionsResponse)
      Log.info { "performing 'EnableOrganizationsRootSessions' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "EnableOrganizationsRootSessions")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("EnableOrganizationsRootSessions", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='EnableOrganizationsRootSessionsResult']").not_nil!
      result = AI::EnableOrganizationsRootSessionsResponse.from_xml(result_node)
      Core::ParsedResponse(AI::EnableOrganizationsRootSessionsResponse).new(response, result)
    end

    # Enables the outbound identity federation feature for your Amazon Web Services account. When
    # enabled, IAM principals in your account can use the `GetWebIdentityToken` API to obtain JSON Web
    # Tokens (JWTs) for secure authentication with external services. This operation also generates a
    # unique issuer URL for your Amazon Web Services account.
    def enable_outbound_web_identity_federation : Core::ParsedResponse(AI::EnableOutboundWebIdentityFederationResponse)
      Log.info { "performing 'EnableOutboundWebIdentityFederation' operation" }
      params = [] of {String, String}
      body = URI::Params.build do |form|
        form.add("Action", "EnableOutboundWebIdentityFederation")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("EnableOutboundWebIdentityFederation", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='EnableOutboundWebIdentityFederationResult']").not_nil!
      result = AI::EnableOutboundWebIdentityFederationResponse.from_xml(result_node)
      Core::ParsedResponse(AI::EnableOutboundWebIdentityFederationResponse).new(response, result)
    end

    # Generates a credential report for the Amazon Web Services account. For more information about
    # the credential report, see [Getting credential
    # reports](https://docs.aws.amazon.com/IAM/latest/UserGuide/credential-reports.html) in the *IAM
    # User Guide*.
    def generate_credential_report : Core::ParsedResponse(AI::GenerateCredentialReportResponse)
      Log.info { "performing 'GenerateCredentialReport' operation" }
      params = [] of {String, String}
      body = URI::Params.build do |form|
        form.add("Action", "GenerateCredentialReport")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GenerateCredentialReport", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GenerateCredentialReportResult']").not_nil!
      result = AI::GenerateCredentialReportResponse.from_xml(result_node)
      Core::ParsedResponse(AI::GenerateCredentialReportResponse).new(response, result)
    end

    # Generates a report for service last accessed data for Organizations. You can generate a report
    # for any entities (organization root, organizational unit, or account) or policies in your
    # organization.
    #
    # To call this operation, you must be signed in using your Organizations management account
    # credentials. You can use your long-term IAM user or root user credentials, or temporary
    # credentials from assuming an IAM role. SCPs must be enabled for your organization root. You must
    # have the required IAM and Organizations permissions. For more information, see [Refining
    # permissions using service last accessed
    # data](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html) in
    # the *IAM User Guide*.
    #
    # You can generate a service last accessed data report for entities by specifying only the
    # entity's path. This data includes a list of services that are allowed by any service control
    # policies (SCPs) that apply to the entity.
    #
    # You can generate a service last accessed data report for a policy by specifying an entity's path
    # and an optional Organizations policy ID. This data includes a list of services that are allowed
    # by the specified SCP.
    #
    # For each service in both report types, the data includes the most recent account activity that
    # the policy allows to account principals in the entity or the entity's children. For important
    # information about the data, reporting period, permissions required, troubleshooting, and
    # supported Regions see [Reducing permissions using service last accessed
    # data](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html) in
    # the *IAM User Guide*.
    #
    # The data includes all attempts to access Amazon Web Services, not just the successful ones. This
    # includes all attempts that were made using the Amazon Web Services Management Console, the
    # Amazon Web Services API through any of the SDKs, or any of the command line tools. An unexpected
    # entry in the service last accessed data does not mean that an account has been compromised,
    # because the request might have been denied. Refer to your CloudTrail logs as the authoritative
    # source for information about all API calls and whether they were successful or denied access.
    # For more information, see [Logging IAM events with
    # CloudTrail](https://docs.aws.amazon.com/IAM/latest/UserGuide/cloudtrail-integration.html) in the
    # *IAM User Guide*.
    #
    # This operation returns a `JobId`. Use this parameter in the `
    # [GetOrganizationsAccessReport](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetOrganizationsAccessReport.html)
    # ` operation to check the status of the report generation. To check the status of this request,
    # use the `JobId` parameter in the `
    # [GetOrganizationsAccessReport](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetOrganizationsAccessReport.html)
    # ` operation and test the `JobStatus` response parameter. When the job is complete, you can
    # retrieve the report.
    #
    # To generate a service last accessed data report for entities, specify an entity path without
    # specifying the optional Organizations policy ID. The type of entity that you specify determines
    # the data returned in the report.
    #
    # - **Root** – When you specify the organizations root as the entity, the resulting report lists
    # all of the services allowed by SCPs that are attached to your root. For each service, the report
    # includes data for all accounts in your organization except the management account, because the
    # management account is not limited by SCPs.
    #
    # - **OU** – When you specify an organizational unit (OU) as the entity, the resulting report
    # lists all of the services allowed by SCPs that are attached to the OU and its parents. For each
    # service, the report includes data for all accounts in the OU or its children. This data excludes
    # the management account, because the management account is not limited by SCPs.
    #
    # - **management account** – When you specify the management account, the resulting report lists
    # all Amazon Web Services services, because the management account is not limited by SCPs. For
    # each service, the report includes data for only the management account.
    #
    # - **Account** – When you specify another account as the entity, the resulting report lists all
    # of the services allowed by SCPs that are attached to the account and its parents. For each
    # service, the report includes data for only the specified account.
    #
    # To generate a service last accessed data report for policies, specify an entity path and the
    # optional Organizations policy ID. The type of entity that you specify determines the data
    # returned for each service.
    #
    # - **Root** – When you specify the root entity and a policy ID, the resulting report lists all of
    # the services that are allowed by the specified SCP. For each service, the report includes data
    # for all accounts in your organization to which the SCP applies. This data excludes the
    # management account, because the management account is not limited by SCPs. If the SCP is not
    # attached to any entities in the organization, then the report will return a list of services
    # with no data.
    #
    # - **OU** – When you specify an OU entity and a policy ID, the resulting report lists all of the
    # services that are allowed by the specified SCP. For each service, the report includes data for
    # all accounts in the OU or its children to which the SCP applies. This means that other accounts
    # outside the OU that are affected by the SCP might not be included in the data. This data
    # excludes the management account, because the management account is not limited by SCPs. If the
    # SCP is not attached to the OU or one of its children, the report will return a list of services
    # with no data.
    #
    # - **management account** – When you specify the management account, the resulting report lists
    # all Amazon Web Services services, because the management account is not limited by SCPs. If you
    # specify a policy ID in the CLI or API, the policy is ignored. For each service, the report
    # includes data for only the management account.
    #
    # - **Account** – When you specify another account entity and a policy ID, the resulting report
    # lists all of the services that are allowed by the specified SCP. For each service, the report
    # includes data for only the specified account. This means that other accounts in the organization
    # that are affected by the SCP might not be included in the data. If the SCP is not attached to
    # the account, the report will return a list of services with no data.
    #
    # Service last accessed data does not use other policy types when determining whether a principal
    # could access a service. These other policy types include identity-based policies, resource-based
    # policies, access control lists, IAM permissions boundaries, and STS assume role policies. It
    # only applies SCP logic. For more about the evaluation of policy types, see [Evaluating
    # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html#policy-eval-basics)
    # in the *IAM User Guide*.
    #
    # For more information about service last accessed data, see [Reducing policy scope by viewing
    # user
    # activity](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html)
    # in the *IAM User Guide*.
    def generate_organizations_access_report(input : AI::GenerateOrganizationsAccessReportRequest) : Core::ParsedResponse(AI::GenerateOrganizationsAccessReportResponse)
      Log.info { "performing 'GenerateOrganizationsAccessReport' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "GenerateOrganizationsAccessReport")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GenerateOrganizationsAccessReport", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GenerateOrganizationsAccessReportResult']").not_nil!
      result = AI::GenerateOrganizationsAccessReportResponse.from_xml(result_node)
      Core::ParsedResponse(AI::GenerateOrganizationsAccessReportResponse).new(response, result)
    end

    # Generates a report that includes details about when an IAM resource (user, group, role, or
    # policy) was last used in an attempt to access Amazon Web Services services. Recent activity
    # usually appears within four hours. IAM reports activity for at least the last 400 days, or less
    # if your Region began supporting this feature within the last year. For more information, see
    # [Regions where data is
    # tracked](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#access-advisor_tracking-period).
    # For more information about services and actions for which action last accessed information is
    # displayed, see [IAM action last accessed information services and
    # actions](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor-action-last-accessed.html).
    #
    # The service last accessed data includes all attempts to access an Amazon Web Services API, not
    # just the successful ones. This includes all attempts that were made using the Amazon Web
    # Services Management Console, the Amazon Web Services API through any of the SDKs, or any of the
    # command line tools. An unexpected entry in the service last accessed data does not mean that
    # your account has been compromised, because the request might have been denied. Refer to your
    # CloudTrail logs as the authoritative source for information about all API calls and whether they
    # were successful or denied access. For more information, see [Logging IAM events with
    # CloudTrail](https://docs.aws.amazon.com/IAM/latest/UserGuide/cloudtrail-integration.html) in the
    # *IAM User Guide*.
    #
    # The `GenerateServiceLastAccessedDetails` operation returns a `JobId`. Use this parameter in the
    # following operations to retrieve the following details from your report:
    #
    # -
    # [GetServiceLastAccessedDetails](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetServiceLastAccessedDetails.html)
    # – Use this operation for users, groups, roles, or policies to list every Amazon Web Services
    # service that the resource could access using permissions policies. For each service, the
    # response includes information about the most recent access attempt.
    #
    # The `JobId` returned by `GenerateServiceLastAccessedDetail` must be used by the same role within
    # a session, or by the same user when used to call `GetServiceLastAccessedDetail`.
    #
    # -
    # [GetServiceLastAccessedDetailsWithEntities](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetServiceLastAccessedDetailsWithEntities.html)
    # – Use this operation for groups and policies to list information about the associated entities
    # (users or roles) that attempted to access a specific Amazon Web Services service.
    #
    # To check the status of the `GenerateServiceLastAccessedDetails` request, use the `JobId`
    # parameter in the same operations and test the `JobStatus` response parameter.
    #
    # For additional information about the permissions policies that allow an identity (user, group,
    # or role) to access specific services, use the
    # [ListPoliciesGrantingServiceAccess](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListPoliciesGrantingServiceAccess.html)
    # operation.
    #
    # Service last accessed data does not use other policy types when determining whether a resource
    # could access a service. These other policy types include resource-based policies, access control
    # lists, Organizations policies, IAM permissions boundaries, and STS assume role policies. It only
    # applies permissions policy logic. For more about the evaluation of policy types, see [Evaluating
    # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html#policy-eval-basics)
    # in the *IAM User Guide*.
    #
    # For more information about service and action last accessed data, see [Reducing permissions
    # using service last accessed
    # data](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html) in
    # the *IAM User Guide*.
    def generate_service_last_accessed_details(input : AI::GenerateServiceLastAccessedDetailsRequest) : Core::ParsedResponse(AI::GenerateServiceLastAccessedDetailsResponse)
      Log.info { "performing 'GenerateServiceLastAccessedDetails' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "GenerateServiceLastAccessedDetails")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GenerateServiceLastAccessedDetails", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GenerateServiceLastAccessedDetailsResult']").not_nil!
      result = AI::GenerateServiceLastAccessedDetailsResponse.from_xml(result_node)
      Core::ParsedResponse(AI::GenerateServiceLastAccessedDetailsResponse).new(response, result)
    end

    # Retrieves information about when the specified access key was last used. The information
    # includes the date and time of last use, along with the Amazon Web Services service and Region
    # that were specified in the last request made with that key.
    def get_access_key_last_used(input : AI::GetAccessKeyLastUsedRequest) : Core::ParsedResponse(AI::GetAccessKeyLastUsedResponse)
      Log.info { "performing 'GetAccessKeyLastUsed' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "GetAccessKeyLastUsed")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GetAccessKeyLastUsed", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GetAccessKeyLastUsedResult']").not_nil!
      result = AI::GetAccessKeyLastUsedResponse.from_xml(result_node)
      Core::ParsedResponse(AI::GetAccessKeyLastUsedResponse).new(response, result)
    end

    # Retrieves information about all IAM users, groups, roles, and policies in your Amazon Web
    # Services account, including their relationships to one another. Use this operation to obtain a
    # snapshot of the configuration of IAM permissions (users, groups, roles, and policies) in your
    # account.
    #
    # Policies returned by this operation are URL-encoded compliant with [RFC
    # 3986](https://tools.ietf.org/html/rfc3986). You can use a URL decoding method to convert the
    # policy back to plain JSON text. For example, if you use Java, you can use the `decode` method of
    # the `java.net.URLDecoder` utility class in the Java SDK. Other languages and SDKs provide
    # similar functionality, and some SDKs do this decoding automatically.
    #
    # You can optionally filter the results using the `Filter` parameter. You can paginate the results
    # using the `MaxItems` and `Marker` parameters.
    def get_account_authorization_details(input : AI::GetAccountAuthorizationDetailsRequest) : Core::ParsedResponse(AI::GetAccountAuthorizationDetailsResponse)
      Log.info { "performing 'GetAccountAuthorizationDetails' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "GetAccountAuthorizationDetails")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GetAccountAuthorizationDetails", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GetAccountAuthorizationDetailsResult']").not_nil!
      result = AI::GetAccountAuthorizationDetailsResponse.from_xml(result_node)
      Core::ParsedResponse(AI::GetAccountAuthorizationDetailsResponse).new(response, result)
    end

    # Retrieves the password policy for the Amazon Web Services account. This tells you the complexity
    # requirements and mandatory rotation periods for the IAM user passwords in your account. For more
    # information about using a password policy, see [Managing an IAM password
    # policy](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_ManagingPasswordPolicies.html).
    def get_account_password_policy : Core::ParsedResponse(AI::GetAccountPasswordPolicyResponse)
      Log.info { "performing 'GetAccountPasswordPolicy' operation" }
      params = [] of {String, String}
      body = URI::Params.build do |form|
        form.add("Action", "GetAccountPasswordPolicy")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GetAccountPasswordPolicy", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GetAccountPasswordPolicyResult']").not_nil!
      result = AI::GetAccountPasswordPolicyResponse.from_xml(result_node)
      Core::ParsedResponse(AI::GetAccountPasswordPolicyResponse).new(response, result)
    end

    # Retrieves the account-level properties for the caller's Amazon Web Services account. Account
    # properties are configuration settings that control account-wide IAM features such as Role
    # Manager.
    #
    # The service returns properties as key-value pairs in `Namespace/PropertyName` format. Each
    # namespace groups related configuration settings. Use
    # [PutAccountProperties](https://docs.aws.amazon.com/IAM/latest/APIReference/API_PutAccountProperties.html)
    # to modify these properties.
    def get_account_properties(input : AI::GetAccountPropertiesRequest) : Core::ParsedResponse(AI::GetAccountPropertiesResponse)
      Log.info { "performing 'GetAccountProperties' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "GetAccountProperties")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GetAccountProperties", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GetAccountPropertiesResult']").not_nil!
      result = AI::GetAccountPropertiesResponse.from_xml(result_node)
      Core::ParsedResponse(AI::GetAccountPropertiesResponse).new(response, result)
    end

    # Retrieves information about IAM entity usage and IAM quotas in the Amazon Web Services account.
    #
    # For information about IAM quotas, see [IAM and STS
    # quotas](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html) in the *IAM
    # User Guide*.
    def get_account_summary : Core::ParsedResponse(AI::GetAccountSummaryResponse)
      Log.info { "performing 'GetAccountSummary' operation" }
      params = [] of {String, String}
      body = URI::Params.build do |form|
        form.add("Action", "GetAccountSummary")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GetAccountSummary", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GetAccountSummaryResult']").not_nil!
      result = AI::GetAccountSummaryResponse.from_xml(result_node)
      Core::ParsedResponse(AI::GetAccountSummaryResponse).new(response, result)
    end

    # Gets a list of all of the context keys referenced in the input policies. The policies are
    # supplied as a list of one or more strings. To get the context keys from policies associated with
    # an IAM user, group, or role, use
    # [GetContextKeysForPrincipalPolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetContextKeysForPrincipalPolicy.html).
    #
    # Context keys are variables maintained by Amazon Web Services and its services that provide
    # details about the context of an API query request. Context keys can be evaluated by testing
    # against a value specified in an IAM policy. Use `GetContextKeysForCustomPolicy` to understand
    # what key names and values you must supply when you call
    # [SimulateCustomPolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_SimulateCustomPolicy.html).
    # Note that all parameters are shown in unencoded form here for clarity but must be URL encoded to
    # be included as a part of a real HTML request.
    def get_context_keys_for_custom_policy(input : AI::GetContextKeysForCustomPolicyRequest) : Core::ParsedResponse(AI::GetContextKeysForPolicyResponse)
      Log.info { "performing 'GetContextKeysForCustomPolicy' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "GetContextKeysForCustomPolicy")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GetContextKeysForCustomPolicy", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GetContextKeysForCustomPolicyResult']").not_nil!
      result = AI::GetContextKeysForPolicyResponse.from_xml(result_node)
      Core::ParsedResponse(AI::GetContextKeysForPolicyResponse).new(response, result)
    end

    # Gets a list of all of the context keys referenced in all the IAM policies that are attached to
    # the specified IAM entity. The entity can be an IAM user, group, or role. If you specify a user,
    # then the request also includes all of the policies attached to groups that the user is a member
    # of.
    #
    # You can optionally include a list of one or more additional policies, specified as strings. If
    # you want to include *only* a list of policies by string, use
    # [GetContextKeysForCustomPolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetContextKeysForCustomPolicy.html)
    # instead.
    #
    # **Note:** This operation discloses information about the permissions granted to other users. If
    # you do not want users to see other user's permissions, then consider allowing them to use
    # [GetContextKeysForCustomPolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetContextKeysForCustomPolicy.html)
    # instead.
    #
    # Context keys are variables maintained by Amazon Web Services and its services that provide
    # details about the context of an API query request. Context keys can be evaluated by testing
    # against a value in an IAM policy. Use
    # [GetContextKeysForPrincipalPolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetContextKeysForPrincipalPolicy.html)
    # to understand what key names and values you must supply when you call
    # [SimulatePrincipalPolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_SimulatePrincipalPolicy.html).
    # This operation doesn't return context keys referenced by service control policies (SCPs). Only
    # context keys referenced by the identity-based policies attached to the specified entity, and any
    # additional policies that you provide, are included.
    def get_context_keys_for_principal_policy(input : AI::GetContextKeysForPrincipalPolicyRequest) : Core::ParsedResponse(AI::GetContextKeysForPolicyResponse)
      Log.info { "performing 'GetContextKeysForPrincipalPolicy' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "GetContextKeysForPrincipalPolicy")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GetContextKeysForPrincipalPolicy", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GetContextKeysForPrincipalPolicyResult']").not_nil!
      result = AI::GetContextKeysForPolicyResponse.from_xml(result_node)
      Core::ParsedResponse(AI::GetContextKeysForPolicyResponse).new(response, result)
    end

    # Retrieves a credential report for the Amazon Web Services account. For more information about
    # the credential report, see [Getting credential
    # reports](https://docs.aws.amazon.com/IAM/latest/UserGuide/credential-reports.html) in the *IAM
    # User Guide*.
    def get_credential_report : Core::ParsedResponse(AI::GetCredentialReportResponse)
      Log.info { "performing 'GetCredentialReport' operation" }
      params = [] of {String, String}
      body = URI::Params.build do |form|
        form.add("Action", "GetCredentialReport")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GetCredentialReport", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GetCredentialReportResult']").not_nil!
      result = AI::GetCredentialReportResponse.from_xml(result_node)
      Core::ParsedResponse(AI::GetCredentialReportResponse).new(response, result)
    end

    # Retrieves information about a specific delegation request.
    #
    # If a delegation request has no owner or owner account, `GetDelegationRequest` for that
    # delegation request can be called by any account. If the owner account is assigned but there is
    # no owner id, only identities within that owner account can call `GetDelegationRequest` for the
    # delegation request. Once the delegation request is fully owned, the owner of the request gets a
    # default permission to get that delegation request. For more details, see [ Managing Permissions
    # for Delegation
    # Requests](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies-temporary-delegation.html#temporary-delegation-managing-permissions).
    def get_delegation_request(input : AI::GetDelegationRequestRequest) : Core::ParsedResponse(AI::GetDelegationRequestResponse)
      Log.info { "performing 'GetDelegationRequest' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "GetDelegationRequest")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GetDelegationRequest", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GetDelegationRequestResult']").not_nil!
      result = AI::GetDelegationRequestResponse.from_xml(result_node)
      Core::ParsedResponse(AI::GetDelegationRequestResponse).new(response, result)
    end

    # Returns a list of IAM users that are in the specified IAM group. You can paginate the results
    # using the `MaxItems` and `Marker` parameters.
    def get_group(input : AI::GetGroupRequest) : Core::ParsedResponse(AI::GetGroupResponse)
      Log.info { "performing 'GetGroup' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "GetGroup")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GetGroup", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GetGroupResult']").not_nil!
      result = AI::GetGroupResponse.from_xml(result_node)
      Core::ParsedResponse(AI::GetGroupResponse).new(response, result)
    end

    # Retrieves the specified inline policy document that is embedded in the specified IAM group.
    #
    # Policies returned by this operation are URL-encoded compliant with [RFC
    # 3986](https://tools.ietf.org/html/rfc3986). You can use a URL decoding method to convert the
    # policy back to plain JSON text. For example, if you use Java, you can use the `decode` method of
    # the `java.net.URLDecoder` utility class in the Java SDK. Other languages and SDKs provide
    # similar functionality, and some SDKs do this decoding automatically.
    #
    # An IAM group can also have managed policies attached to it. To retrieve a managed policy
    # document that is attached to a group, use
    # [GetPolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetPolicy.html) to determine
    # the policy's default version, then use
    # [GetPolicyVersion](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetPolicyVersion.html)
    # to retrieve the policy document.
    #
    # For more information about policies, see [Managed policies and inline
    # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html) in
    # the *IAM User Guide*.
    def get_group_policy(input : AI::GetGroupPolicyRequest) : Core::ParsedResponse(AI::GetGroupPolicyResponse)
      Log.info { "performing 'GetGroupPolicy' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "GetGroupPolicy")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GetGroupPolicy", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GetGroupPolicyResult']").not_nil!
      result = AI::GetGroupPolicyResponse.from_xml(result_node)
      Core::ParsedResponse(AI::GetGroupPolicyResponse).new(response, result)
    end

    # Retrieves a human readable summary for a given entity. At this time, the only supported entity
    # type is `delegation-request`
    #
    # This method uses a Large Language Model (LLM) to generate the summary.
    #
    # If a delegation request has no owner or owner account, `GetHumanReadableSummary` for that
    # delegation request can be called by any account. If the owner account is assigned but there is
    # no owner id, only identities within that owner account can call `GetHumanReadableSummary` for
    # the delegation request to retrieve a summary of that request. Once the delegation request is
    # fully owned, the owner of the request gets a default permission to get that delegation request.
    # For more details, read [default permissions granted to delegation requests](). These rules are
    # identical to
    # [GetDelegationRequest](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetDelegationRequest.html)
    # API behavior, such that a party who has permissions to call
    # [GetDelegationRequest](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetDelegationRequest.html)
    # for a given delegation request will always be able to retrieve the human readable summary for
    # that request.
    def get_human_readable_summary(input : AI::GetHumanReadableSummaryRequest) : Core::ParsedResponse(AI::GetHumanReadableSummaryResponse)
      Log.info { "performing 'GetHumanReadableSummary' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "GetHumanReadableSummary")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GetHumanReadableSummary", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GetHumanReadableSummaryResult']").not_nil!
      result = AI::GetHumanReadableSummaryResponse.from_xml(result_node)
      Core::ParsedResponse(AI::GetHumanReadableSummaryResponse).new(response, result)
    end

    # Retrieves information about the specified instance profile, including the instance profile's
    # path, GUID, ARN, and role. For more information about instance profiles, see [Using instance
    # profiles](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_switch-role-ec2_instance-profiles.html)
    # in the *IAM User Guide*.
    def get_instance_profile(input : AI::GetInstanceProfileRequest) : Core::ParsedResponse(AI::GetInstanceProfileResponse)
      Log.info { "performing 'GetInstanceProfile' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "GetInstanceProfile")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GetInstanceProfile", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GetInstanceProfileResult']").not_nil!
      result = AI::GetInstanceProfileResponse.from_xml(result_node)
      Core::ParsedResponse(AI::GetInstanceProfileResponse).new(response, result)
    end

    # Retrieves the user name for the specified IAM user. A login profile is created when you create a
    # password for the user to access the Amazon Web Services Management Console. If the user does not
    # exist or does not have a password, the operation returns a 404 (`NoSuchEntity`) error.
    #
    # If you create an IAM user with access to the console, the `CreateDate` reflects the date you
    # created the initial password for the user.
    #
    # If you create an IAM user with programmatic access, and then later add a password for the user
    # to access the Amazon Web Services Management Console, the `CreateDate` reflects the initial
    # password creation date. A user with programmatic access does not have a login profile unless you
    # create a password for the user to access the Amazon Web Services Management Console.
    def get_login_profile(input : AI::GetLoginProfileRequest) : Core::ParsedResponse(AI::GetLoginProfileResponse)
      Log.info { "performing 'GetLoginProfile' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "GetLoginProfile")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GetLoginProfile", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GetLoginProfileResult']").not_nil!
      result = AI::GetLoginProfileResponse.from_xml(result_node)
      Core::ParsedResponse(AI::GetLoginProfileResponse).new(response, result)
    end

    # Retrieves information about an MFA device for a specified user.
    def get_mfa_device(input : AI::GetMFADeviceRequest) : Core::ParsedResponse(AI::GetMFADeviceResponse)
      Log.info { "performing 'GetMFADevice' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "GetMFADevice")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GetMFADevice", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GetMFADeviceResult']").not_nil!
      result = AI::GetMFADeviceResponse.from_xml(result_node)
      Core::ParsedResponse(AI::GetMFADeviceResponse).new(response, result)
    end

    # Returns information about the specified OpenID Connect (OIDC) provider resource object in IAM.
    def get_open_id_connect_provider(input : AI::GetOpenIDConnectProviderRequest) : Core::ParsedResponse(AI::GetOpenIDConnectProviderResponse)
      Log.info { "performing 'GetOpenIDConnectProvider' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "GetOpenIDConnectProvider")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GetOpenIDConnectProvider", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GetOpenIDConnectProviderResult']").not_nil!
      result = AI::GetOpenIDConnectProviderResponse.from_xml(result_node)
      Core::ParsedResponse(AI::GetOpenIDConnectProviderResponse).new(response, result)
    end

    # Retrieves the service last accessed data report for Organizations that was previously generated
    # using the `
    # [GenerateOrganizationsAccessReport](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GenerateOrganizationsAccessReport.html)
    # ` operation. This operation retrieves the status of your report job and the report contents.
    #
    # Depending on the parameters that you passed when you generated the report, the data returned
    # could include different information. For details, see
    # [GenerateOrganizationsAccessReport](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GenerateOrganizationsAccessReport.html).
    #
    # To call this operation, you must be signed in to the management account in your organization.
    # SCPs must be enabled for your organization root. You must have permissions to perform this
    # operation. For more information, see [Refining permissions using service last accessed
    # data](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html) in
    # the *IAM User Guide*.
    #
    # For each service that principals in an account (root user, IAM users, or IAM roles) could access
    # using SCPs, the operation returns details about the most recent access attempt. If there was no
    # attempt, the service is listed without details about the most recent attempt to access the
    # service. If the operation fails, it returns the reason that it failed.
    #
    # By default, the list is sorted by service namespace.
    def get_organizations_access_report(input : AI::GetOrganizationsAccessReportRequest) : Core::ParsedResponse(AI::GetOrganizationsAccessReportResponse)
      Log.info { "performing 'GetOrganizationsAccessReport' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "GetOrganizationsAccessReport")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GetOrganizationsAccessReport", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GetOrganizationsAccessReportResult']").not_nil!
      result = AI::GetOrganizationsAccessReportResponse.from_xml(result_node)
      Core::ParsedResponse(AI::GetOrganizationsAccessReportResponse).new(response, result)
    end

    # Retrieves the configuration information for the outbound identity federation feature in your
    # Amazon Web Services account. The response includes the unique issuer URL for your Amazon Web
    # Services account and the current enabled/disabled status of the feature. Use this operation to
    # obtain the issuer URL that you need to configure trust relationships with external services.
    def get_outbound_web_identity_federation_info : Core::ParsedResponse(AI::GetOutboundWebIdentityFederationInfoResponse)
      Log.info { "performing 'GetOutboundWebIdentityFederationInfo' operation" }
      params = [] of {String, String}
      body = URI::Params.build do |form|
        form.add("Action", "GetOutboundWebIdentityFederationInfo")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GetOutboundWebIdentityFederationInfo", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GetOutboundWebIdentityFederationInfoResult']").not_nil!
      result = AI::GetOutboundWebIdentityFederationInfoResponse.from_xml(result_node)
      Core::ParsedResponse(AI::GetOutboundWebIdentityFederationInfoResponse).new(response, result)
    end

    # Retrieves information about the specified managed policy, including the policy's default version
    # and the total number of IAM users, groups, and roles to which the policy is attached. To
    # retrieve the list of the specific users, groups, and roles that the policy is attached to, use
    # [ListEntitiesForPolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListEntitiesForPolicy.html).
    # This operation returns metadata about the policy. To retrieve the actual policy document for a
    # specific version of the policy, use
    # [GetPolicyVersion](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetPolicyVersion.html).
    #
    # This operation retrieves information about managed policies. To retrieve information about an
    # inline policy that is embedded with an IAM user, group, or role, use
    # [GetUserPolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetUserPolicy.html),
    # [GetGroupPolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetGroupPolicy.html),
    # or [GetRolePolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetRolePolicy.html).
    #
    # For more information about policies, see [Managed policies and inline
    # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html) in
    # the *IAM User Guide*.
    def get_policy(input : AI::GetPolicyRequest) : Core::ParsedResponse(AI::GetPolicyResponse)
      Log.info { "performing 'GetPolicy' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "GetPolicy")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GetPolicy", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GetPolicyResult']").not_nil!
      result = AI::GetPolicyResponse.from_xml(result_node)
      Core::ParsedResponse(AI::GetPolicyResponse).new(response, result)
    end

    # Retrieves information about the specified version of the specified managed policy, including the
    # policy document.
    #
    # Policies returned by this operation are URL-encoded compliant with [RFC
    # 3986](https://tools.ietf.org/html/rfc3986). You can use a URL decoding method to convert the
    # policy back to plain JSON text. For example, if you use Java, you can use the `decode` method of
    # the `java.net.URLDecoder` utility class in the Java SDK. Other languages and SDKs provide
    # similar functionality, and some SDKs do this decoding automatically.
    #
    # To list the available versions for a policy, use
    # [ListPolicyVersions](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListPolicyVersions.html).
    #
    # This operation retrieves information about managed policies. To retrieve information about an
    # inline policy that is embedded in a user, group, or role, use
    # [GetUserPolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetUserPolicy.html),
    # [GetGroupPolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetGroupPolicy.html),
    # or [GetRolePolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetRolePolicy.html).
    #
    # For more information about the types of policies, see [Managed policies and inline
    # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html) in
    # the *IAM User Guide*.
    #
    # For more information about managed policy versions, see [Versioning for managed
    # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-versions.html) in
    # the *IAM User Guide*.
    def get_policy_version(input : AI::GetPolicyVersionRequest) : Core::ParsedResponse(AI::GetPolicyVersionResponse)
      Log.info { "performing 'GetPolicyVersion' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "GetPolicyVersion")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GetPolicyVersion", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GetPolicyVersionResult']").not_nil!
      result = AI::GetPolicyVersionResponse.from_xml(result_node)
      Core::ParsedResponse(AI::GetPolicyVersionResponse).new(response, result)
    end

    # Retrieves information about the specified role, including the role's path, GUID, ARN, and the
    # role's trust policy that grants permission to assume the role. For more information about roles,
    # see [IAM roles](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html) in the *IAM User
    # Guide*.
    #
    # Policies returned by this operation are URL-encoded compliant with [RFC
    # 3986](https://tools.ietf.org/html/rfc3986). You can use a URL decoding method to convert the
    # policy back to plain JSON text. For example, if you use Java, you can use the `decode` method of
    # the `java.net.URLDecoder` utility class in the Java SDK. Other languages and SDKs provide
    # similar functionality, and some SDKs do this decoding automatically.
    def get_role(input : AI::GetRoleRequest) : Core::ParsedResponse(AI::GetRoleResponse)
      Log.info { "performing 'GetRole' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "GetRole")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GetRole", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GetRoleResult']").not_nil!
      result = AI::GetRoleResponse.from_xml(result_node)
      Core::ParsedResponse(AI::GetRoleResponse).new(response, result)
    end

    # Retrieves the specified inline policy document that is embedded with the specified IAM role.
    #
    # Policies returned by this operation are URL-encoded compliant with [RFC
    # 3986](https://tools.ietf.org/html/rfc3986). You can use a URL decoding method to convert the
    # policy back to plain JSON text. For example, if you use Java, you can use the `decode` method of
    # the `java.net.URLDecoder` utility class in the Java SDK. Other languages and SDKs provide
    # similar functionality, and some SDKs do this decoding automatically.
    #
    # An IAM role can also have managed policies attached to it. To retrieve a managed policy document
    # that is attached to a role, use
    # [GetPolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetPolicy.html) to determine
    # the policy's default version, then use
    # [GetPolicyVersion](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetPolicyVersion.html)
    # to retrieve the policy document.
    #
    # For more information about policies, see [Managed policies and inline
    # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html) in
    # the *IAM User Guide*.
    #
    # For more information about roles, see [IAM
    # roles](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html) in the *IAM User Guide*.
    def get_role_policy(input : AI::GetRolePolicyRequest) : Core::ParsedResponse(AI::GetRolePolicyResponse)
      Log.info { "performing 'GetRolePolicy' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "GetRolePolicy")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GetRolePolicy", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GetRolePolicyResult']").not_nil!
      result = AI::GetRolePolicyResponse.from_xml(result_node)
      Core::ParsedResponse(AI::GetRolePolicyResponse).new(response, result)
    end

    # Retrieves information about a version of the specified role template. Role templates define a
    # reusable configuration—including role name and path patterns, trust policy, inline and managed
    # policies, permissions boundary, tags, and maximum session duration—that you use to create IAM
    # roles with
    # [AcquireRole](https://docs.aws.amazon.com/IAM/latest/APIReference/API_AcquireRole.html).
    #
    # If you do not specify a minor version, the service returns the template's default minor version.
    def get_role_template_version(input : AI::GetRoleTemplateVersionRequest) : Core::ParsedResponse(AI::GetRoleTemplateVersionResponse)
      Log.info { "performing 'GetRoleTemplateVersion' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "GetRoleTemplateVersion")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GetRoleTemplateVersion", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GetRoleTemplateVersionResult']").not_nil!
      result = AI::GetRoleTemplateVersionResponse.from_xml(result_node)
      Core::ParsedResponse(AI::GetRoleTemplateVersionResponse).new(response, result)
    end

    # Returns the SAML provider metadocument that was uploaded when the IAM SAML provider resource
    # object was created or updated.
    #
    # This operation requires [Signature Version
    # 4](https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html).
    def get_saml_provider(input : AI::GetSAMLProviderRequest) : Core::ParsedResponse(AI::GetSAMLProviderResponse)
      Log.info { "performing 'GetSAMLProvider' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "GetSAMLProvider")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GetSAMLProvider", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GetSAMLProviderResult']").not_nil!
      result = AI::GetSAMLProviderResponse.from_xml(result_node)
      Core::ParsedResponse(AI::GetSAMLProviderResponse).new(response, result)
    end

    # Retrieves information about the specified server certificate stored in IAM.
    #
    # For more information about working with server certificates, see [Working with server
    # certificates](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs.html)
    # in the *IAM User Guide*. This topic includes a list of Amazon Web Services services that can use
    # the server certificates that you manage with IAM.
    def get_server_certificate(input : AI::GetServerCertificateRequest) : Core::ParsedResponse(AI::GetServerCertificateResponse)
      Log.info { "performing 'GetServerCertificate' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "GetServerCertificate")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GetServerCertificate", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GetServerCertificateResult']").not_nil!
      result = AI::GetServerCertificateResponse.from_xml(result_node)
      Core::ParsedResponse(AI::GetServerCertificateResponse).new(response, result)
    end

    # Retrieves a service last accessed report that was created using the
    # `GenerateServiceLastAccessedDetails` operation. You can use the `JobId` parameter in
    # `GetServiceLastAccessedDetails` to retrieve the status of your report job. When the report is
    # complete, you can retrieve the generated report. The report includes a list of Amazon Web
    # Services services that the resource (user, group, role, or managed policy) can access.
    #
    # Service last accessed data does not use other policy types when determining whether a resource
    # could access a service. These other policy types include resource-based policies, access control
    # lists, Organizations policies, IAM permissions boundaries, and STS assume role policies. It only
    # applies permissions policy logic. For more about the evaluation of policy types, see [Evaluating
    # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html#policy-eval-basics)
    # in the *IAM User Guide*.
    #
    # For each service that the resource could access using permissions policies, the operation
    # returns details about the most recent access attempt. If there was no attempt, the service is
    # listed without details about the most recent attempt to access the service. If the operation
    # fails, the `GetServiceLastAccessedDetails` operation returns the reason that it failed.
    #
    # The `GetServiceLastAccessedDetails` operation returns a list of services. This list includes the
    # number of entities that have attempted to access the service and the date and time of the last
    # attempt. It also returns the ARN of the following entity, depending on the resource ARN that you
    # used to generate the report:
    #
    # - **User** – Returns the user ARN that you used to generate the report
    #
    # - **Group** – Returns the ARN of the group member (user) that last attempted to access the
    # service
    #
    # - **Role** – Returns the role ARN that you used to generate the report
    #
    # - **Policy** – Returns the ARN of the user or role that last used the policy to attempt to
    # access the service
    #
    # By default, the list is sorted by service namespace.
    #
    # If you specified `ACTION_LEVEL` granularity when you generated the report, this operation
    # returns service and action last accessed data. This includes the most recent access attempt for
    # each tracked action within a service. Otherwise, this operation returns only service data.
    #
    # For more information about service and action last accessed data, see [Reducing permissions
    # using service last accessed
    # data](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html) in
    # the *IAM User Guide*.
    def get_service_last_accessed_details(input : AI::GetServiceLastAccessedDetailsRequest) : Core::ParsedResponse(AI::GetServiceLastAccessedDetailsResponse)
      Log.info { "performing 'GetServiceLastAccessedDetails' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "GetServiceLastAccessedDetails")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GetServiceLastAccessedDetails", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GetServiceLastAccessedDetailsResult']").not_nil!
      result = AI::GetServiceLastAccessedDetailsResponse.from_xml(result_node)
      Core::ParsedResponse(AI::GetServiceLastAccessedDetailsResponse).new(response, result)
    end

    # After you generate a group or policy report using the `GenerateServiceLastAccessedDetails`
    # operation, you can use the `JobId` parameter in `GetServiceLastAccessedDetailsWithEntities`.
    # This operation retrieves the status of your report job and a list of entities that could have
    # used group or policy permissions to access the specified service.
    #
    # - **Group** – For a group report, this operation returns a list of users in the group that could
    # have used the group’s policies in an attempt to access the service.
    #
    # - **Policy** – For a policy report, this operation returns a list of entities (users or roles)
    # that could have used the policy in an attempt to access the service.
    #
    # You can also use this operation for user or role reports to retrieve details about those
    # entities.
    #
    # If the operation fails, the `GetServiceLastAccessedDetailsWithEntities` operation returns the
    # reason that it failed.
    #
    # By default, the list of associated entities is sorted by date, with the most recent access
    # listed first.
    def get_service_last_accessed_details_with_entities(input : AI::GetServiceLastAccessedDetailsWithEntitiesRequest) : Core::ParsedResponse(AI::GetServiceLastAccessedDetailsWithEntitiesResponse)
      Log.info { "performing 'GetServiceLastAccessedDetailsWithEntities' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "GetServiceLastAccessedDetailsWithEntities")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GetServiceLastAccessedDetailsWithEntities", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GetServiceLastAccessedDetailsWithEntitiesResult']").not_nil!
      result = AI::GetServiceLastAccessedDetailsWithEntitiesResponse.from_xml(result_node)
      Core::ParsedResponse(AI::GetServiceLastAccessedDetailsWithEntitiesResponse).new(response, result)
    end

    # Retrieves the status of your service-linked role deletion. After you use
    # [DeleteServiceLinkedRole](https://docs.aws.amazon.com/IAM/latest/APIReference/API_DeleteServiceLinkedRole.html)
    # to submit a service-linked role for deletion, you can use the `DeletionTaskId` parameter in
    # `GetServiceLinkedRoleDeletionStatus` to check the status of the deletion. If the deletion fails,
    # this operation returns the reason that it failed, if that information is returned by the
    # service.
    def get_service_linked_role_deletion_status(input : AI::GetServiceLinkedRoleDeletionStatusRequest) : Core::ParsedResponse(AI::GetServiceLinkedRoleDeletionStatusResponse)
      Log.info { "performing 'GetServiceLinkedRoleDeletionStatus' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "GetServiceLinkedRoleDeletionStatus")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GetServiceLinkedRoleDeletionStatus", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GetServiceLinkedRoleDeletionStatusResult']").not_nil!
      result = AI::GetServiceLinkedRoleDeletionStatusResponse.from_xml(result_node)
      Core::ParsedResponse(AI::GetServiceLinkedRoleDeletionStatusResponse).new(response, result)
    end

    # Retrieves the specified SSH public key, including metadata about the key.
    #
    # The SSH public key retrieved by this operation is used only for authenticating the associated
    # IAM user to an CodeCommit repository. For more information about using SSH keys to authenticate
    # to an CodeCommit repository, see [Set up CodeCommit for SSH
    # connections](https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-credentials-ssh.html)
    # in the *CodeCommit User Guide*.
    def get_ssh_public_key(input : AI::GetSSHPublicKeyRequest) : Core::ParsedResponse(AI::GetSSHPublicKeyResponse)
      Log.info { "performing 'GetSSHPublicKey' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "GetSSHPublicKey")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GetSSHPublicKey", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GetSSHPublicKeyResult']").not_nil!
      result = AI::GetSSHPublicKeyResponse.from_xml(result_node)
      Core::ParsedResponse(AI::GetSSHPublicKeyResponse).new(response, result)
    end

    # Retrieves information about the specified IAM user, including the user's creation date, path,
    # unique ID, and ARN.
    #
    # If you do not specify a user name, IAM determines the user name implicitly based on the Amazon
    # Web Services access key ID used to sign the request to this operation.
    def get_user(input : AI::GetUserRequest) : Core::ParsedResponse(AI::GetUserResponse)
      Log.info { "performing 'GetUser' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "GetUser")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GetUser", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GetUserResult']").not_nil!
      result = AI::GetUserResponse.from_xml(result_node)
      Core::ParsedResponse(AI::GetUserResponse).new(response, result)
    end

    # Retrieves the specified inline policy document that is embedded in the specified IAM user.
    #
    # Policies returned by this operation are URL-encoded compliant with [RFC
    # 3986](https://tools.ietf.org/html/rfc3986). You can use a URL decoding method to convert the
    # policy back to plain JSON text. For example, if you use Java, you can use the `decode` method of
    # the `java.net.URLDecoder` utility class in the Java SDK. Other languages and SDKs provide
    # similar functionality, and some SDKs do this decoding automatically.
    #
    # An IAM user can also have managed policies attached to it. To retrieve a managed policy document
    # that is attached to a user, use
    # [GetPolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetPolicy.html) to determine
    # the policy's default version. Then use
    # [GetPolicyVersion](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetPolicyVersion.html)
    # to retrieve the policy document.
    #
    # For more information about policies, see [Managed policies and inline
    # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html) in
    # the *IAM User Guide*.
    def get_user_policy(input : AI::GetUserPolicyRequest) : Core::ParsedResponse(AI::GetUserPolicyResponse)
      Log.info { "performing 'GetUserPolicy' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "GetUserPolicy")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GetUserPolicy", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GetUserPolicyResult']").not_nil!
      result = AI::GetUserPolicyResponse.from_xml(result_node)
      Core::ParsedResponse(AI::GetUserPolicyResponse).new(response, result)
    end

    # Returns information about the access key IDs associated with the specified IAM user. If there is
    # none, the operation returns an empty list.
    #
    # Although each user is limited to a small number of keys, you can still paginate the results
    # using the `MaxItems` and `Marker` parameters.
    #
    # If the `UserName` is not specified, the user name is determined implicitly based on the Amazon
    # Web Services access key ID used to sign the request. If a temporary access key is used, then
    # `UserName` is required. If a long-term key is assigned to the user, then `UserName` is not
    # required.
    #
    # This operation works for access keys under the Amazon Web Services account. If the Amazon Web
    # Services account has no associated users, the root user returns it's own access key IDs by
    # running this command.
    #
    # To ensure the security of your Amazon Web Services account, the secret access key is accessible
    # only during key and user creation.
    def list_access_keys(input : AI::ListAccessKeysRequest) : Core::ParsedResponse(AI::ListAccessKeysResponse)
      Log.info { "performing 'ListAccessKeys' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListAccessKeys")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListAccessKeys", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListAccessKeysResult']").not_nil!
      result = AI::ListAccessKeysResponse.from_xml(result_node)
      Core::ParsedResponse(AI::ListAccessKeysResponse).new(response, result)
    end

    # Lists the account alias associated with the Amazon Web Services account (Note: you can have only
    # one). For information about using an Amazon Web Services account alias, see [Creating, deleting,
    # and listing an Amazon Web Services account
    # alias](https://docs.aws.amazon.com/IAM/latest/UserGuide/console_account-alias.html#CreateAccountAlias)
    # in the *IAM User Guide*.
    def list_account_aliases(input : AI::ListAccountAliasesRequest) : Core::ParsedResponse(AI::ListAccountAliasesResponse)
      Log.info { "performing 'ListAccountAliases' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListAccountAliases")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListAccountAliases", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListAccountAliasesResult']").not_nil!
      result = AI::ListAccountAliasesResponse.from_xml(result_node)
      Core::ParsedResponse(AI::ListAccountAliasesResponse).new(response, result)
    end

    # Lists all managed policies that are attached to the specified IAM group.
    #
    # An IAM group can also have inline policies embedded with it. To list the inline policies for a
    # group, use
    # [ListGroupPolicies](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListGroupPolicies.html).
    # For information about policies, see [Managed policies and inline
    # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html) in
    # the *IAM User Guide*.
    #
    # You can paginate the results using the `MaxItems` and `Marker` parameters. You can use the
    # `PathPrefix` parameter to limit the list of policies to only those matching the specified path
    # prefix. If there are no policies attached to the specified group (or none that match the
    # specified path prefix), the operation returns an empty list.
    def list_attached_group_policies(input : AI::ListAttachedGroupPoliciesRequest) : Core::ParsedResponse(AI::ListAttachedGroupPoliciesResponse)
      Log.info { "performing 'ListAttachedGroupPolicies' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListAttachedGroupPolicies")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListAttachedGroupPolicies", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListAttachedGroupPoliciesResult']").not_nil!
      result = AI::ListAttachedGroupPoliciesResponse.from_xml(result_node)
      Core::ParsedResponse(AI::ListAttachedGroupPoliciesResponse).new(response, result)
    end

    # Lists all managed policies that are attached to the specified IAM role.
    #
    # An IAM role can also have inline policies embedded with it. To list the inline policies for a
    # role, use
    # [ListRolePolicies](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListRolePolicies.html).
    # For information about policies, see [Managed policies and inline
    # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html) in
    # the *IAM User Guide*.
    #
    # You can paginate the results using the `MaxItems` and `Marker` parameters. You can use the
    # `PathPrefix` parameter to limit the list of policies to only those matching the specified path
    # prefix. If there are no policies attached to the specified role (or none that match the
    # specified path prefix), the operation returns an empty list.
    def list_attached_role_policies(input : AI::ListAttachedRolePoliciesRequest) : Core::ParsedResponse(AI::ListAttachedRolePoliciesResponse)
      Log.info { "performing 'ListAttachedRolePolicies' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListAttachedRolePolicies")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListAttachedRolePolicies", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListAttachedRolePoliciesResult']").not_nil!
      result = AI::ListAttachedRolePoliciesResponse.from_xml(result_node)
      Core::ParsedResponse(AI::ListAttachedRolePoliciesResponse).new(response, result)
    end

    # Lists all managed policies that are attached to the specified IAM user.
    #
    # An IAM user can also have inline policies embedded with it. To list the inline policies for a
    # user, use
    # [ListUserPolicies](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListUserPolicies.html).
    # For information about policies, see [Managed policies and inline
    # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html) in
    # the *IAM User Guide*.
    #
    # You can paginate the results using the `MaxItems` and `Marker` parameters. You can use the
    # `PathPrefix` parameter to limit the list of policies to only those matching the specified path
    # prefix. If there are no policies attached to the specified group (or none that match the
    # specified path prefix), the operation returns an empty list.
    def list_attached_user_policies(input : AI::ListAttachedUserPoliciesRequest) : Core::ParsedResponse(AI::ListAttachedUserPoliciesResponse)
      Log.info { "performing 'ListAttachedUserPolicies' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListAttachedUserPolicies")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListAttachedUserPolicies", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListAttachedUserPoliciesResult']").not_nil!
      result = AI::ListAttachedUserPoliciesResponse.from_xml(result_node)
      Core::ParsedResponse(AI::ListAttachedUserPoliciesResponse).new(response, result)
    end

    # Lists delegation requests based on the specified criteria.
    #
    # If a delegation request has no owner, even if it is assigned to a specific account, it will not
    # be part of the `ListDelegationRequests` output for that account.
    #
    # For more details, see [ Managing Permissions for Delegation
    # Requests](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies-temporary-delegation.html#temporary-delegation-managing-permissions).
    def list_delegation_requests(input : AI::ListDelegationRequestsRequest) : Core::ParsedResponse(AI::ListDelegationRequestsResponse)
      Log.info { "performing 'ListDelegationRequests' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListDelegationRequests")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListDelegationRequests", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListDelegationRequestsResult']").not_nil!
      result = AI::ListDelegationRequestsResponse.from_xml(result_node)
      Core::ParsedResponse(AI::ListDelegationRequestsResponse).new(response, result)
    end

    # Lists all IAM users, groups, and roles that the specified managed policy is attached to.
    #
    # You can use the optional `EntityFilter` parameter to limit the results to a particular type of
    # entity (users, groups, or roles). For example, to list only the roles that are attached to the
    # specified policy, set `EntityFilter` to `Role`.
    #
    # You can paginate the results using the `MaxItems` and `Marker` parameters.
    def list_entities_for_policy(input : AI::ListEntitiesForPolicyRequest) : Core::ParsedResponse(AI::ListEntitiesForPolicyResponse)
      Log.info { "performing 'ListEntitiesForPolicy' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListEntitiesForPolicy")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListEntitiesForPolicy", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListEntitiesForPolicyResult']").not_nil!
      result = AI::ListEntitiesForPolicyResponse.from_xml(result_node)
      Core::ParsedResponse(AI::ListEntitiesForPolicyResponse).new(response, result)
    end

    # Lists the names of the inline policies that are embedded in the specified IAM group.
    #
    # An IAM group can also have managed policies attached to it. To list the managed policies that
    # are attached to a group, use
    # [ListAttachedGroupPolicies](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListAttachedGroupPolicies.html).
    # For more information about policies, see [Managed policies and inline
    # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html) in
    # the *IAM User Guide*.
    #
    # You can paginate the results using the `MaxItems` and `Marker` parameters. If there are no
    # inline policies embedded with the specified group, the operation returns an empty list.
    def list_group_policies(input : AI::ListGroupPoliciesRequest) : Core::ParsedResponse(AI::ListGroupPoliciesResponse)
      Log.info { "performing 'ListGroupPolicies' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListGroupPolicies")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListGroupPolicies", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListGroupPoliciesResult']").not_nil!
      result = AI::ListGroupPoliciesResponse.from_xml(result_node)
      Core::ParsedResponse(AI::ListGroupPoliciesResponse).new(response, result)
    end

    # Lists the IAM groups that have the specified path prefix.
    #
    # You can paginate the results using the `MaxItems` and `Marker` parameters.
    def list_groups(input : AI::ListGroupsRequest) : Core::ParsedResponse(AI::ListGroupsResponse)
      Log.info { "performing 'ListGroups' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListGroups")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListGroups", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListGroupsResult']").not_nil!
      result = AI::ListGroupsResponse.from_xml(result_node)
      Core::ParsedResponse(AI::ListGroupsResponse).new(response, result)
    end

    # Lists the IAM groups that the specified IAM user belongs to.
    #
    # You can paginate the results using the `MaxItems` and `Marker` parameters.
    def list_groups_for_user(input : AI::ListGroupsForUserRequest) : Core::ParsedResponse(AI::ListGroupsForUserResponse)
      Log.info { "performing 'ListGroupsForUser' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListGroupsForUser")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListGroupsForUser", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListGroupsForUserResult']").not_nil!
      result = AI::ListGroupsForUserResponse.from_xml(result_node)
      Core::ParsedResponse(AI::ListGroupsForUserResponse).new(response, result)
    end

    # Lists the instance profiles that have the specified path prefix. If there are none, the
    # operation returns an empty list. For more information about instance profiles, see [Using
    # instance
    # profiles](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_switch-role-ec2_instance-profiles.html)
    # in the *IAM User Guide*.
    #
    # IAM resource-listing operations return a subset of the available attributes for the resource.
    # For example, this operation does not return tags, even though they are an attribute of the
    # returned object. To view all of the information for an instance profile, see
    # [GetInstanceProfile](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetInstanceProfile.html).
    #
    # You can paginate the results using the `MaxItems` and `Marker` parameters.
    def list_instance_profiles(input : AI::ListInstanceProfilesRequest) : Core::ParsedResponse(AI::ListInstanceProfilesResponse)
      Log.info { "performing 'ListInstanceProfiles' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListInstanceProfiles")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListInstanceProfiles", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListInstanceProfilesResult']").not_nil!
      result = AI::ListInstanceProfilesResponse.from_xml(result_node)
      Core::ParsedResponse(AI::ListInstanceProfilesResponse).new(response, result)
    end

    # Lists the instance profiles that have the specified associated IAM role. If there are none, the
    # operation returns an empty list. For more information about instance profiles, go to [Using
    # instance
    # profiles](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_switch-role-ec2_instance-profiles.html)
    # in the *IAM User Guide*.
    #
    # You can paginate the results using the `MaxItems` and `Marker` parameters.
    def list_instance_profiles_for_role(input : AI::ListInstanceProfilesForRoleRequest) : Core::ParsedResponse(AI::ListInstanceProfilesForRoleResponse)
      Log.info { "performing 'ListInstanceProfilesForRole' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListInstanceProfilesForRole")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListInstanceProfilesForRole", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListInstanceProfilesForRoleResult']").not_nil!
      result = AI::ListInstanceProfilesForRoleResponse.from_xml(result_node)
      Core::ParsedResponse(AI::ListInstanceProfilesForRoleResponse).new(response, result)
    end

    # Lists the tags that are attached to the specified IAM instance profile. The returned list of
    # tags is sorted by tag key. For more information about tagging, see [Tagging IAM
    # resources](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html) in the *IAM User
    # Guide*.
    def list_instance_profile_tags(input : AI::ListInstanceProfileTagsRequest) : Core::ParsedResponse(AI::ListInstanceProfileTagsResponse)
      Log.info { "performing 'ListInstanceProfileTags' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListInstanceProfileTags")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListInstanceProfileTags", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListInstanceProfileTagsResult']").not_nil!
      result = AI::ListInstanceProfileTagsResponse.from_xml(result_node)
      Core::ParsedResponse(AI::ListInstanceProfileTagsResponse).new(response, result)
    end

    # Lists the MFA devices for an IAM user. If the request includes a IAM user name, then this
    # operation lists all the MFA devices associated with the specified user. If you do not specify a
    # user name, IAM determines the user name implicitly based on the Amazon Web Services access key
    # ID signing the request for this operation.
    #
    # You can paginate the results using the `MaxItems` and `Marker` parameters.
    def list_mfa_devices(input : AI::ListMFADevicesRequest) : Core::ParsedResponse(AI::ListMFADevicesResponse)
      Log.info { "performing 'ListMFADevices' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListMFADevices")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListMFADevices", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListMFADevicesResult']").not_nil!
      result = AI::ListMFADevicesResponse.from_xml(result_node)
      Core::ParsedResponse(AI::ListMFADevicesResponse).new(response, result)
    end

    # Lists the tags that are attached to the specified IAM virtual multi-factor authentication (MFA)
    # device. The returned list of tags is sorted by tag key. For more information about tagging, see
    # [Tagging IAM resources](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html) in the
    # *IAM User Guide*.
    def list_mfa_device_tags(input : AI::ListMFADeviceTagsRequest) : Core::ParsedResponse(AI::ListMFADeviceTagsResponse)
      Log.info { "performing 'ListMFADeviceTags' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListMFADeviceTags")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListMFADeviceTags", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListMFADeviceTagsResult']").not_nil!
      result = AI::ListMFADeviceTagsResponse.from_xml(result_node)
      Core::ParsedResponse(AI::ListMFADeviceTagsResponse).new(response, result)
    end

    # Lists information about the IAM OpenID Connect (OIDC) provider resource objects defined in the
    # Amazon Web Services account.
    #
    # IAM resource-listing operations return a subset of the available attributes for the resource.
    # For example, this operation does not return tags, even though they are an attribute of the
    # returned object. To view all of the information for an OIDC provider, see
    # [GetOpenIDConnectProvider](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetOpenIDConnectProvider.html).
    def list_open_id_connect_providers(input : AI::ListOpenIDConnectProvidersRequest) : Core::ParsedResponse(AI::ListOpenIDConnectProvidersResponse)
      Log.info { "performing 'ListOpenIDConnectProviders' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListOpenIDConnectProviders")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListOpenIDConnectProviders", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListOpenIDConnectProvidersResult']").not_nil!
      result = AI::ListOpenIDConnectProvidersResponse.from_xml(result_node)
      Core::ParsedResponse(AI::ListOpenIDConnectProvidersResponse).new(response, result)
    end

    # Lists the tags that are attached to the specified OpenID Connect (OIDC)-compatible identity
    # provider. The returned list of tags is sorted by tag key. For more information, see [About web
    # identity
    # federation](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_oidc.html).
    #
    # For more information about tagging, see [Tagging IAM
    # resources](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html) in the *IAM User
    # Guide*.
    def list_open_id_connect_provider_tags(input : AI::ListOpenIDConnectProviderTagsRequest) : Core::ParsedResponse(AI::ListOpenIDConnectProviderTagsResponse)
      Log.info { "performing 'ListOpenIDConnectProviderTags' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListOpenIDConnectProviderTags")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListOpenIDConnectProviderTags", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListOpenIDConnectProviderTagsResult']").not_nil!
      result = AI::ListOpenIDConnectProviderTagsResponse.from_xml(result_node)
      Core::ParsedResponse(AI::ListOpenIDConnectProviderTagsResponse).new(response, result)
    end

    # Lists the centralized root access features enabled for your organization. For more information,
    # see [Centrally manage root access for member
    # accounts](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_root-user.html#id_root-user-access-management).
    def list_organizations_features(input : AI::ListOrganizationsFeaturesRequest) : Core::ParsedResponse(AI::ListOrganizationsFeaturesResponse)
      Log.info { "performing 'ListOrganizationsFeatures' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListOrganizationsFeatures")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListOrganizationsFeatures", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListOrganizationsFeaturesResult']").not_nil!
      result = AI::ListOrganizationsFeaturesResponse.from_xml(result_node)
      Core::ParsedResponse(AI::ListOrganizationsFeaturesResponse).new(response, result)
    end

    # Lists all the managed policies that are available in your Amazon Web Services account, including
    # your own customer-defined managed policies and all Amazon Web Services managed policies.
    #
    # You can filter the list of policies that is returned using the optional `OnlyAttached`, `Scope`,
    # and `PathPrefix` parameters. For example, to list only the customer managed policies in your
    # Amazon Web Services account, set `Scope` to `Local`. To list only Amazon Web Services managed
    # policies, set `Scope` to `AWS`.
    #
    # You can paginate the results using the `MaxItems` and `Marker` parameters.
    #
    # For more information about managed policies, see [Managed policies and inline
    # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html) in
    # the *IAM User Guide*.
    #
    # IAM resource-listing operations return a subset of the available attributes for the resource.
    # For example, this operation does not return tags, even though they are an attribute of the
    # returned object. To view all of the information for a customer manged policy, see
    # [GetPolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetPolicy.html).
    def list_policies(input : AI::ListPoliciesRequest) : Core::ParsedResponse(AI::ListPoliciesResponse)
      Log.info { "performing 'ListPolicies' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListPolicies")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListPolicies", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListPoliciesResult']").not_nil!
      result = AI::ListPoliciesResponse.from_xml(result_node)
      Core::ParsedResponse(AI::ListPoliciesResponse).new(response, result)
    end

    # Retrieves a list of policies that the IAM identity (user, group, or role) can use to access each
    # specified service.
    #
    # This operation does not use other policy types when determining whether a resource could access
    # a service. These other policy types include resource-based policies, access control lists,
    # Organizations policies, IAM permissions boundaries, and STS assume role policies. It only
    # applies permissions policy logic. For more about the evaluation of policy types, see [Evaluating
    # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html#policy-eval-basics)
    # in the *IAM User Guide*.
    #
    # The list of policies returned by the operation depends on the ARN of the identity that you
    # provide.
    #
    # - **User** – The list of policies includes the managed and inline policies that are attached to
    # the user directly. The list also includes any additional managed and inline policies that are
    # attached to the group to which the user belongs.
    #
    # - **Group** – The list of policies includes only the managed and inline policies that are
    # attached to the group directly. Policies that are attached to the group’s user are not included.
    #
    # - **Role** – The list of policies includes only the managed and inline policies that are
    # attached to the role.
    #
    # For each managed policy, this operation returns the ARN and policy name. For each inline policy,
    # it returns the policy name and the entity to which it is attached. Inline policies do not have
    # an ARN. For more information about these policy types, see [Managed policies and inline
    # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_managed-vs-inline.html)
    # in the *IAM User Guide*.
    #
    # Policies that are attached to users and roles as permissions boundaries are not returned. To
    # view which managed policy is currently used to set the permissions boundary for a user or role,
    # use the [GetUser](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetUser.html) or
    # [GetRole](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetRole.html) operations.
    def list_policies_granting_service_access(input : AI::ListPoliciesGrantingServiceAccessRequest) : Core::ParsedResponse(AI::ListPoliciesGrantingServiceAccessResponse)
      Log.info { "performing 'ListPoliciesGrantingServiceAccess' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListPoliciesGrantingServiceAccess")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListPoliciesGrantingServiceAccess", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListPoliciesGrantingServiceAccessResult']").not_nil!
      result = AI::ListPoliciesGrantingServiceAccessResponse.from_xml(result_node)
      Core::ParsedResponse(AI::ListPoliciesGrantingServiceAccessResponse).new(response, result)
    end

    # Lists the tags that are attached to the specified IAM customer managed policy. The returned list
    # of tags is sorted by tag key. For more information about tagging, see [Tagging IAM
    # resources](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html) in the *IAM User
    # Guide*.
    def list_policy_tags(input : AI::ListPolicyTagsRequest) : Core::ParsedResponse(AI::ListPolicyTagsResponse)
      Log.info { "performing 'ListPolicyTags' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListPolicyTags")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListPolicyTags", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListPolicyTagsResult']").not_nil!
      result = AI::ListPolicyTagsResponse.from_xml(result_node)
      Core::ParsedResponse(AI::ListPolicyTagsResponse).new(response, result)
    end

    # Lists information about the versions of the specified managed policy, including the version that
    # is currently set as the policy's default version.
    #
    # For more information about managed policies, see [Managed policies and inline
    # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html) in
    # the *IAM User Guide*.
    def list_policy_versions(input : AI::ListPolicyVersionsRequest) : Core::ParsedResponse(AI::ListPolicyVersionsResponse)
      Log.info { "performing 'ListPolicyVersions' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListPolicyVersions")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListPolicyVersions", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListPolicyVersionsResult']").not_nil!
      result = AI::ListPolicyVersionsResponse.from_xml(result_node)
      Core::ParsedResponse(AI::ListPolicyVersionsResponse).new(response, result)
    end

    # Lists the names of the inline policies that are embedded in the specified IAM role.
    #
    # An IAM role can also have managed policies attached to it. To list the managed policies that are
    # attached to a role, use
    # [ListAttachedRolePolicies](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListAttachedRolePolicies.html).
    # For more information about policies, see [Managed policies and inline
    # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html) in
    # the *IAM User Guide*.
    #
    # You can paginate the results using the `MaxItems` and `Marker` parameters. If there are no
    # inline policies embedded with the specified role, the operation returns an empty list.
    def list_role_policies(input : AI::ListRolePoliciesRequest) : Core::ParsedResponse(AI::ListRolePoliciesResponse)
      Log.info { "performing 'ListRolePolicies' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListRolePolicies")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListRolePolicies", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListRolePoliciesResult']").not_nil!
      result = AI::ListRolePoliciesResponse.from_xml(result_node)
      Core::ParsedResponse(AI::ListRolePoliciesResponse).new(response, result)
    end

    # Lists the IAM roles that have the specified path prefix. If there are none, the operation
    # returns an empty list. For more information about roles, see [IAM
    # roles](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html) in the *IAM User Guide*.
    #
    # IAM resource-listing operations return a subset of the available attributes for the resource.
    # This operation does not return the following attributes, even though they are an attribute of
    # the returned object:
    #
    # - PermissionsBoundary
    #
    # - RoleLastUsed
    #
    # - Tags
    #
    # To view all of the information for a role, see
    # [GetRole](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetRole.html).
    #
    # You can paginate the results using the `MaxItems` and `Marker` parameters.
    def list_roles(input : AI::ListRolesRequest) : Core::ParsedResponse(AI::ListRolesResponse)
      Log.info { "performing 'ListRoles' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListRoles")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListRoles", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListRolesResult']").not_nil!
      result = AI::ListRolesResponse.from_xml(result_node)
      Core::ParsedResponse(AI::ListRolesResponse).new(response, result)
    end

    # Lists the tags that are attached to the specified role. The returned list of tags is sorted by
    # tag key. For more information about tagging, see [Tagging IAM
    # resources](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html) in the *IAM User
    # Guide*.
    def list_role_tags(input : AI::ListRoleTagsRequest) : Core::ParsedResponse(AI::ListRoleTagsResponse)
      Log.info { "performing 'ListRoleTags' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListRoleTags")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListRoleTags", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListRoleTagsResult']").not_nil!
      result = AI::ListRoleTagsResponse.from_xml(result_node)
      Core::ParsedResponse(AI::ListRoleTagsResponse).new(response, result)
    end

    # Lists the SAML provider resource objects defined in IAM in the account. IAM resource-listing
    # operations return a subset of the available attributes for the resource. For example, this
    # operation does not return tags, even though they are an attribute of the returned object. To
    # view all of the information for a SAML provider, see
    # [GetSAMLProvider](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetSAMLProvider.html).
    #
    # This operation requires [Signature Version
    # 4](https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html).
    def list_saml_providers(input : AI::ListSAMLProvidersRequest) : Core::ParsedResponse(AI::ListSAMLProvidersResponse)
      Log.info { "performing 'ListSAMLProviders' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListSAMLProviders")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListSAMLProviders", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListSAMLProvidersResult']").not_nil!
      result = AI::ListSAMLProvidersResponse.from_xml(result_node)
      Core::ParsedResponse(AI::ListSAMLProvidersResponse).new(response, result)
    end

    # Lists the tags that are attached to the specified Security Assertion Markup Language (SAML)
    # identity provider. The returned list of tags is sorted by tag key. For more information, see
    # [About SAML 2.0-based
    # federation](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_saml.html).
    #
    # For more information about tagging, see [Tagging IAM
    # resources](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html) in the *IAM User
    # Guide*.
    def list_saml_provider_tags(input : AI::ListSAMLProviderTagsRequest) : Core::ParsedResponse(AI::ListSAMLProviderTagsResponse)
      Log.info { "performing 'ListSAMLProviderTags' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListSAMLProviderTags")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListSAMLProviderTags", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListSAMLProviderTagsResult']").not_nil!
      result = AI::ListSAMLProviderTagsResponse.from_xml(result_node)
      Core::ParsedResponse(AI::ListSAMLProviderTagsResponse).new(response, result)
    end

    # Lists the server certificates stored in IAM that have the specified path prefix. If none exist,
    # the operation returns an empty list.
    #
    # You can paginate the results using the `MaxItems` and `Marker` parameters.
    #
    # For more information about working with server certificates, see [Working with server
    # certificates](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs.html)
    # in the *IAM User Guide*. This topic also includes a list of Amazon Web Services services that
    # can use the server certificates that you manage with IAM.
    #
    # IAM resource-listing operations return a subset of the available attributes for the resource.
    # For example, this operation does not return tags, even though they are an attribute of the
    # returned object. To view all of the information for a servercertificate, see
    # [GetServerCertificate](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetServerCertificate.html).
    def list_server_certificates(input : AI::ListServerCertificatesRequest) : Core::ParsedResponse(AI::ListServerCertificatesResponse)
      Log.info { "performing 'ListServerCertificates' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListServerCertificates")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListServerCertificates", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListServerCertificatesResult']").not_nil!
      result = AI::ListServerCertificatesResponse.from_xml(result_node)
      Core::ParsedResponse(AI::ListServerCertificatesResponse).new(response, result)
    end

    # Lists the tags that are attached to the specified IAM server certificate. The returned list of
    # tags is sorted by tag key. For more information about tagging, see [Tagging IAM
    # resources](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html) in the *IAM User
    # Guide*.
    #
    # For certificates in a Region supported by Certificate Manager (ACM), we recommend that you don't
    # use IAM server certificates. Instead, use ACM to provision, manage, and deploy your server
    # certificates. For more information about IAM server certificates, [Working with server
    # certificates](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs.html)
    # in the *IAM User Guide*.
    def list_server_certificate_tags(input : AI::ListServerCertificateTagsRequest) : Core::ParsedResponse(AI::ListServerCertificateTagsResponse)
      Log.info { "performing 'ListServerCertificateTags' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListServerCertificateTags")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListServerCertificateTags", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListServerCertificateTagsResult']").not_nil!
      result = AI::ListServerCertificateTagsResponse.from_xml(result_node)
      Core::ParsedResponse(AI::ListServerCertificateTagsResponse).new(response, result)
    end

    # Returns information about the service-specific credentials associated with the specified IAM
    # user. If none exists, the operation returns an empty list. The service-specific credentials
    # returned by this operation are used only for authenticating the IAM user to a specific service.
    # For more information about using service-specific credentials to authenticate to an Amazon Web
    # Services service, refer to the following docs:
    #
    # - For service-specific credentials with CodeCommit, refer to [IAM credentials for CodeCommit:
    # Git credentials, SSH keys, and Amazon Web Services access
    # keys](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_ssh-keys.html) in the *IAM
    # User Guide*.
    #
    # - For service-specific credentials with Amazon Keyspaces (for Apache Cassandra), refer to [Use
    # IAM with Amazon Keyspaces (for Apache
    # Cassandra)](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_keyspaces.html) in
    # the *IAM User Guide*.
    #
    # - For services that support long-term API keys, refer to [API keys for Amazon Web Services
    # services](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_api_keys_for_aws_services.html)
    # in the *IAM User Guide*.
    def list_service_specific_credentials(input : AI::ListServiceSpecificCredentialsRequest) : Core::ParsedResponse(AI::ListServiceSpecificCredentialsResponse)
      Log.info { "performing 'ListServiceSpecificCredentials' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListServiceSpecificCredentials")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListServiceSpecificCredentials", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListServiceSpecificCredentialsResult']").not_nil!
      result = AI::ListServiceSpecificCredentialsResponse.from_xml(result_node)
      Core::ParsedResponse(AI::ListServiceSpecificCredentialsResponse).new(response, result)
    end

    # Returns information about the signing certificates associated with the specified IAM user. If
    # none exists, the operation returns an empty list.
    #
    # Although each user is limited to a small number of signing certificates, you can still paginate
    # the results using the `MaxItems` and `Marker` parameters.
    #
    # If the `UserName` field is not specified, the user name is determined implicitly based on the
    # Amazon Web Services access key ID used to sign the request for this operation. This operation
    # works for access keys under the Amazon Web Services account. Consequently, you can use this
    # operation to manage Amazon Web Services account root user credentials even if the Amazon Web
    # Services account has no associated users.
    def list_signing_certificates(input : AI::ListSigningCertificatesRequest) : Core::ParsedResponse(AI::ListSigningCertificatesResponse)
      Log.info { "performing 'ListSigningCertificates' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListSigningCertificates")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListSigningCertificates", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListSigningCertificatesResult']").not_nil!
      result = AI::ListSigningCertificatesResponse.from_xml(result_node)
      Core::ParsedResponse(AI::ListSigningCertificatesResponse).new(response, result)
    end

    # Returns information about the SSH public keys associated with the specified IAM user. If none
    # exists, the operation returns an empty list.
    #
    # The SSH public keys returned by this operation are used only for authenticating the IAM user to
    # an CodeCommit repository. For more information about using SSH keys to authenticate to an
    # CodeCommit repository, see [Set up CodeCommit for SSH
    # connections](https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-credentials-ssh.html)
    # in the *CodeCommit User Guide*.
    #
    # Although each user is limited to a small number of keys, you can still paginate the results
    # using the `MaxItems` and `Marker` parameters.
    def list_ssh_public_keys(input : AI::ListSSHPublicKeysRequest) : Core::ParsedResponse(AI::ListSSHPublicKeysResponse)
      Log.info { "performing 'ListSSHPublicKeys' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListSSHPublicKeys")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListSSHPublicKeys", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListSSHPublicKeysResult']").not_nil!
      result = AI::ListSSHPublicKeysResponse.from_xml(result_node)
      Core::ParsedResponse(AI::ListSSHPublicKeysResponse).new(response, result)
    end

    # Lists the names of the inline policies embedded in the specified IAM user.
    #
    # An IAM user can also have managed policies attached to it. To list the managed policies that are
    # attached to a user, use
    # [ListAttachedUserPolicies](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListAttachedUserPolicies.html).
    # For more information about policies, see [Managed policies and inline
    # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html) in
    # the *IAM User Guide*.
    #
    # You can paginate the results using the `MaxItems` and `Marker` parameters. If there are no
    # inline policies embedded with the specified user, the operation returns an empty list.
    def list_user_policies(input : AI::ListUserPoliciesRequest) : Core::ParsedResponse(AI::ListUserPoliciesResponse)
      Log.info { "performing 'ListUserPolicies' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListUserPolicies")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListUserPolicies", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListUserPoliciesResult']").not_nil!
      result = AI::ListUserPoliciesResponse.from_xml(result_node)
      Core::ParsedResponse(AI::ListUserPoliciesResponse).new(response, result)
    end

    # Lists the IAM users that have the specified path prefix. If no path prefix is specified, the
    # operation returns all users in the Amazon Web Services account. If there are none, the operation
    # returns an empty list.
    #
    # IAM resource-listing operations return a subset of the available attributes for the resource.
    # This operation does not return the following attributes, even though they are an attribute of
    # the returned object:
    #
    # - PermissionsBoundary
    #
    # - Tags
    #
    # To view all of the information for a user, see
    # [GetUser](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetUser.html).
    #
    # You can paginate the results using the `MaxItems` and `Marker` parameters.
    def list_users(input : AI::ListUsersRequest) : Core::ParsedResponse(AI::ListUsersResponse)
      Log.info { "performing 'ListUsers' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListUsers")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListUsers", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListUsersResult']").not_nil!
      result = AI::ListUsersResponse.from_xml(result_node)
      Core::ParsedResponse(AI::ListUsersResponse).new(response, result)
    end

    # Lists the tags that are attached to the specified IAM user. The returned list of tags is sorted
    # by tag key. For more information about tagging, see [Tagging IAM
    # resources](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html) in the *IAM User
    # Guide*.
    def list_user_tags(input : AI::ListUserTagsRequest) : Core::ParsedResponse(AI::ListUserTagsResponse)
      Log.info { "performing 'ListUserTags' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListUserTags")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListUserTags", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListUserTagsResult']").not_nil!
      result = AI::ListUserTagsResponse.from_xml(result_node)
      Core::ParsedResponse(AI::ListUserTagsResponse).new(response, result)
    end

    # Lists the virtual MFA devices defined in the Amazon Web Services account by assignment status.
    # If you do not specify an assignment status, the operation returns a list of all virtual MFA
    # devices. Assignment status can be `Assigned`, `Unassigned`, or `Any`.
    #
    # IAM resource-listing operations return a subset of the available attributes for the resource.
    # For example, this operation does not return tags, even though they are an attribute of the
    # returned object. To view tag information for a virtual MFA device, see
    # [ListMFADeviceTags](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListMFADeviceTags.html).
    #
    # You can paginate the results using the `MaxItems` and `Marker` parameters.
    def list_virtual_mfa_devices(input : AI::ListVirtualMFADevicesRequest) : Core::ParsedResponse(AI::ListVirtualMFADevicesResponse)
      Log.info { "performing 'ListVirtualMFADevices' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListVirtualMFADevices")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListVirtualMFADevices", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListVirtualMFADevicesResult']").not_nil!
      result = AI::ListVirtualMFADevicesResponse.from_xml(result_node)
      Core::ParsedResponse(AI::ListVirtualMFADevicesResponse).new(response, result)
    end

    # Sets account-level properties for the caller's Amazon Web Services account. Account properties
    # are configuration settings that control account-wide IAM features such as Role Manager.
    #
    # Specify properties as key-value pairs in `Namespace/PropertyName` format. All properties in a
    # single request must belong to the same namespace. Use
    # [GetAccountProperties](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetAccountProperties.html)
    # to view the current properties.
    def put_account_properties(input : AI::PutAccountPropertiesRequest) : Core::ParsedResponse(AI::PutAccountPropertiesResponse)
      Log.info { "performing 'PutAccountProperties' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "PutAccountProperties")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("PutAccountProperties", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='PutAccountPropertiesResult']").not_nil!
      result = AI::PutAccountPropertiesResponse.from_xml(result_node)
      Core::ParsedResponse(AI::PutAccountPropertiesResponse).new(response, result)
    end

    # Adds or updates an inline policy document that is embedded in the specified IAM group.
    #
    # A user can also have managed policies attached to it. To attach a managed policy to a group, use
    # [ `AttachGroupPolicy`
    # ](https://docs.aws.amazon.com/IAM/latest/APIReference/API_AttachGroupPolicy.html). To create a
    # new managed policy, use [ `CreatePolicy`
    # ](https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreatePolicy.html). For information
    # about policies, see [Managed policies and inline
    # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html) in
    # the *IAM User Guide*.
    #
    # For information about the maximum number of inline policies that you can embed in a group, see
    # [IAM and STS quotas](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html)
    # in the *IAM User Guide*.
    #
    # Because policy documents can be large, you should use POST rather than GET when calling
    # `PutGroupPolicy`. For general information about using the Query API with IAM, see [Making query
    # requests](https://docs.aws.amazon.com/IAM/latest/UserGuide/IAM_UsingQueryAPI.html) in the *IAM
    # User Guide*.
    def put_group_policy(input : AI::PutGroupPolicyRequest) : Core::Response
      Log.info { "performing 'PutGroupPolicy' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "PutGroupPolicy")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("PutGroupPolicy", body)
      Core::Response.new(response)
    end

    # Adds or updates the policy that is specified as the IAM role's permissions boundary. You can use
    # an Amazon Web Services managed policy or a customer managed policy to set the boundary for a
    # role. Use the boundary to control the maximum permissions that the role can have. Setting a
    # permissions boundary is an advanced feature that can affect the permissions for the role.
    #
    # You cannot set the boundary for a service-linked role.
    #
    # Policies used as permissions boundaries do not provide permissions. You must also attach a
    # permissions policy to the role. To learn how the effective permissions for a role are evaluated,
    # see [IAM JSON policy evaluation
    # logic](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html)
    # in the IAM User Guide.
    def put_role_permissions_boundary(input : AI::PutRolePermissionsBoundaryRequest) : Core::Response
      Log.info { "performing 'PutRolePermissionsBoundary' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "PutRolePermissionsBoundary")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("PutRolePermissionsBoundary", body)
      Core::Response.new(response)
    end

    # Adds or updates an inline policy document that is embedded in the specified IAM role.
    #
    # When you embed an inline policy in a role, the inline policy is used as part of the role's
    # access (permissions) policy. The role's trust policy is created at the same time as the role,
    # using [ `CreateRole` ](https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateRole.html).
    # You can update a role's trust policy using [ `UpdateAssumeRolePolicy`
    # ](https://docs.aws.amazon.com/IAM/latest/APIReference/API_UpdateAssumeRolePolicy.html). For more
    # information about roles, see [IAM
    # roles](https://docs.aws.amazon.com/IAM/latest/UserGuide/roles-toplevel.html) in the *IAM User
    # Guide*.
    #
    # A role can also have a managed policy attached to it. To attach a managed policy to a role, use
    # [ `AttachRolePolicy`
    # ](https://docs.aws.amazon.com/IAM/latest/APIReference/API_AttachRolePolicy.html). To create a
    # new managed policy, use [ `CreatePolicy`
    # ](https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreatePolicy.html). For information
    # about policies, see [Managed policies and inline
    # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html) in
    # the *IAM User Guide*.
    #
    # For information about the maximum number of inline policies that you can embed with a role, see
    # [IAM and STS quotas](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html)
    # in the *IAM User Guide*.
    #
    # Because policy documents can be large, you should use POST rather than GET when calling
    # `PutRolePolicy`. For general information about using the Query API with IAM, see [Making query
    # requests](https://docs.aws.amazon.com/IAM/latest/UserGuide/IAM_UsingQueryAPI.html) in the *IAM
    # User Guide*.
    def put_role_policy(input : AI::PutRolePolicyRequest) : Core::Response
      Log.info { "performing 'PutRolePolicy' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "PutRolePolicy")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("PutRolePolicy", body)
      Core::Response.new(response)
    end

    # Adds or updates the policy that is specified as the IAM user's permissions boundary. You can use
    # an Amazon Web Services managed policy or a customer managed policy to set the boundary for a
    # user. Use the boundary to control the maximum permissions that the user can have. Setting a
    # permissions boundary is an advanced feature that can affect the permissions for the user.
    #
    # Policies that are used as permissions boundaries do not provide permissions. You must also
    # attach a permissions policy to the user. To learn how the effective permissions for a user are
    # evaluated, see [IAM JSON policy evaluation
    # logic](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html)
    # in the IAM User Guide.
    def put_user_permissions_boundary(input : AI::PutUserPermissionsBoundaryRequest) : Core::Response
      Log.info { "performing 'PutUserPermissionsBoundary' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "PutUserPermissionsBoundary")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("PutUserPermissionsBoundary", body)
      Core::Response.new(response)
    end

    # Adds or updates an inline policy document that is embedded in the specified IAM user.
    #
    # An IAM user can also have a managed policy attached to it. To attach a managed policy to a user,
    # use [ `AttachUserPolicy`
    # ](https://docs.aws.amazon.com/IAM/latest/APIReference/API_AttachUserPolicy.html). To create a
    # new managed policy, use [ `CreatePolicy`
    # ](https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreatePolicy.html). For information
    # about policies, see [Managed policies and inline
    # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html) in
    # the *IAM User Guide*.
    #
    # For information about the maximum number of inline policies that you can embed in a user, see
    # [IAM and STS quotas](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html)
    # in the *IAM User Guide*.
    #
    # Because policy documents can be large, you should use POST rather than GET when calling
    # `PutUserPolicy`. For general information about using the Query API with IAM, see [Making query
    # requests](https://docs.aws.amazon.com/IAM/latest/UserGuide/IAM_UsingQueryAPI.html) in the *IAM
    # User Guide*.
    def put_user_policy(input : AI::PutUserPolicyRequest) : Core::Response
      Log.info { "performing 'PutUserPolicy' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "PutUserPolicy")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("PutUserPolicy", body)
      Core::Response.new(response)
    end

    # Rejects a delegation request, denying the requested temporary access.
    #
    # Once a request is rejected, it cannot be accepted or updated later. Rejected requests expire
    # after 7 days.
    #
    # When rejecting a request, an optional explanation can be added using the `Notes` request
    # parameter.
    #
    # For more details, see [ Managing Permissions for Delegation
    # Requests](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies-temporary-delegation.html#temporary-delegation-managing-permissions).
    def reject_delegation_request(input : AI::RejectDelegationRequestRequest) : Core::Response
      Log.info { "performing 'RejectDelegationRequest' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "RejectDelegationRequest")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("RejectDelegationRequest", body)
      Core::Response.new(response)
    end

    # Removes the specified client ID (also known as audience) from the list of client IDs registered
    # for the specified IAM OpenID Connect (OIDC) provider resource object.
    #
    # This operation is idempotent; it does not fail or return an error if you try to remove a client
    # ID that does not exist.
    def remove_client_id_from_open_id_connect_provider(input : AI::RemoveClientIDFromOpenIDConnectProviderRequest) : Core::Response
      Log.info { "performing 'RemoveClientIDFromOpenIDConnectProvider' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "RemoveClientIDFromOpenIDConnectProvider")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("RemoveClientIDFromOpenIDConnectProvider", body)
      Core::Response.new(response)
    end

    # Removes the specified IAM role from the specified Amazon EC2 instance profile.
    #
    # Make sure that you do not have any Amazon EC2 instances running with the role you are about to
    # remove from the instance profile. Removing a role from an instance profile that is associated
    # with a running instance might break any applications running on the instance.
    #
    # For more information about roles, see [IAM
    # roles](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html) in the *IAM User Guide*.
    # For more information about instance profiles, see [Using instance
    # profiles](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_switch-role-ec2_instance-profiles.html)
    # in the *IAM User Guide*.
    def remove_role_from_instance_profile(input : AI::RemoveRoleFromInstanceProfileRequest) : Core::Response
      Log.info { "performing 'RemoveRoleFromInstanceProfile' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "RemoveRoleFromInstanceProfile")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("RemoveRoleFromInstanceProfile", body)
      Core::Response.new(response)
    end

    # Removes the specified user from the specified group.
    def remove_user_from_group(input : AI::RemoveUserFromGroupRequest) : Core::Response
      Log.info { "performing 'RemoveUserFromGroup' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "RemoveUserFromGroup")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("RemoveUserFromGroup", body)
      Core::Response.new(response)
    end

    # Resets the password for a service-specific credential. The new password is Amazon Web Services
    # generated and cryptographically strong. It cannot be configured by the user. Resetting the
    # password immediately invalidates the previous password associated with this user.
    def reset_service_specific_credential(input : AI::ResetServiceSpecificCredentialRequest) : Core::ParsedResponse(AI::ResetServiceSpecificCredentialResponse)
      Log.info { "performing 'ResetServiceSpecificCredential' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ResetServiceSpecificCredential")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ResetServiceSpecificCredential", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ResetServiceSpecificCredentialResult']").not_nil!
      result = AI::ResetServiceSpecificCredentialResponse.from_xml(result_node)
      Core::ParsedResponse(AI::ResetServiceSpecificCredentialResponse).new(response, result)
    end

    # Synchronizes the specified MFA device with its IAM resource object on the Amazon Web Services
    # servers.
    #
    # For more information about creating and working with virtual MFA devices, see [Using a virtual
    # MFA device](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_VirtualMFA.html) in the *IAM
    # User Guide*.
    def resync_mfa_device(input : AI::ResyncMFADeviceRequest) : Core::Response
      Log.info { "performing 'ResyncMFADevice' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ResyncMFADevice")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ResyncMFADevice", body)
      Core::Response.new(response)
    end

    # Sends the exchange token for an accepted delegation request.
    #
    # The exchange token is sent to the partner via an asynchronous notification channel, established
    # by the partner.
    #
    # The delegation request must be in the `ACCEPTED` state when calling this API. After the
    # `SendDelegationToken` API call is successful, the request transitions to a `FINALIZED` state and
    # cannot be rolled back. However, a user may reject an accepted request before the
    # `SendDelegationToken` API is called.
    #
    # For more details, see [ Managing Permissions for Delegation
    # Requests](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies-temporary-delegation.html#temporary-delegation-managing-permissions).
    def send_delegation_token(input : AI::SendDelegationTokenRequest) : Core::Response
      Log.info { "performing 'SendDelegationToken' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "SendDelegationToken")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("SendDelegationToken", body)
      Core::Response.new(response)
    end

    # Sets the specified version of the specified policy as the policy's default (operative) version.
    #
    # This operation affects all users, groups, and roles that the policy is attached to. To list the
    # users, groups, and roles that the policy is attached to, use
    # [ListEntitiesForPolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListEntitiesForPolicy.html).
    #
    # For information about managed policies, see [Managed policies and inline
    # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html) in
    # the *IAM User Guide*.
    def set_default_policy_version(input : AI::SetDefaultPolicyVersionRequest) : Core::Response
      Log.info { "performing 'SetDefaultPolicyVersion' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "SetDefaultPolicyVersion")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("SetDefaultPolicyVersion", body)
      Core::Response.new(response)
    end

    # Sets the specified version of the global endpoint token as the token version used for the Amazon
    # Web Services account.
    #
    # By default, Security Token Service (STS) is available as a global service, and all STS requests
    # go to a single endpoint at `https://sts.amazonaws.com`. Amazon Web Services recommends using
    # Regional STS endpoints to reduce latency, build in redundancy, and increase session token
    # availability. For information about Regional endpoints for STS, see [Security Token Service
    # endpoints and quotas](https://docs.aws.amazon.com/general/latest/gr/sts.html) in the *Amazon Web
    # Services General Reference*.
    #
    # If you make an STS call to the global endpoint, the resulting session tokens might be valid in
    # some Regions but not others. It depends on the version that is set in this operation. Version 1
    # tokens are valid only in Amazon Web Services Regions that are available by default. These tokens
    # do not work in manually enabled Regions, such as Asia Pacific (Hong Kong). Version 2 tokens are
    # valid in all Regions. However, version 2 tokens are longer and might affect systems where you
    # temporarily store tokens. For information, see [Activating and deactivating STS in an Amazon Web
    # Services
    # Region](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html)
    # in the *IAM User Guide*.
    #
    # To view the current session token version, see the `GlobalEndpointTokenVersion` entry in the
    # response of the
    # [GetAccountSummary](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetAccountSummary.html)
    # operation.
    def set_security_token_service_preferences(input : AI::SetSecurityTokenServicePreferencesRequest) : Core::Response
      Log.info { "performing 'SetSecurityTokenServicePreferences' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "SetSecurityTokenServicePreferences")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("SetSecurityTokenServicePreferences", body)
      Core::Response.new(response)
    end

    # Simulate how a set of IAM policies and optionally a resource-based policy works with a list of
    # API operations and Amazon Web Services resources to determine the policies' effective
    # permissions. The policies are provided as strings.
    #
    # The simulation does not perform the API operations; it only checks the authorization to
    # determine if the simulated policies allow or deny the operations. You can simulate resources
    # that don't exist in your account.
    #
    # If you want to simulate existing policies that are attached to an IAM user, group, or role, use
    # [SimulatePrincipalPolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_SimulatePrincipalPolicy.html)
    # instead.
    #
    # Context keys are variables that are maintained by Amazon Web Services and its services and which
    # provide details about the context of an API query request. You can use the `Condition` element
    # of an IAM policy to evaluate context keys. To get the list of context keys that the policies
    # require for correct simulation, use
    # [GetContextKeysForCustomPolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetContextKeysForCustomPolicy.html).
    #
    # If the output is long, you can use `MaxItems` and `Marker` parameters to paginate the results.
    #
    # The IAM policy simulator evaluates statements in identity-based policies, service control
    # policies (SCPs) including their condition keys and resource scoping, and the inputs that you
    # provide during simulation. The policy simulator results can differ from your live Amazon Web
    # Services environment. We recommend that you check your policies against your live Amazon Web
    # Services environment after testing using the policy simulator to confirm that you have the
    # desired results. For more information about using the policy simulator, see [Testing IAM
    # policies with the IAM policy simulator
    # ](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_testing-policies.html)in the
    # *IAM User Guide*.
    def simulate_custom_policy(input : AI::SimulateCustomPolicyRequest) : Core::ParsedResponse(AI::SimulatePolicyResponse)
      Log.info { "performing 'SimulateCustomPolicy' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "SimulateCustomPolicy")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("SimulateCustomPolicy", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='SimulateCustomPolicyResult']").not_nil!
      result = AI::SimulatePolicyResponse.from_xml(result_node)
      Core::ParsedResponse(AI::SimulatePolicyResponse).new(response, result)
    end

    # Simulate how a set of IAM policies attached to an IAM entity works with a list of API operations
    # and Amazon Web Services resources to determine the policies' effective permissions. The entity
    # can be an IAM user, group, or role. If you specify a user, then the simulation also includes all
    # of the policies that are attached to groups that the user belongs to. You can simulate resources
    # that don't exist in your account.
    #
    # You can optionally include a list of one or more additional policies specified as strings to
    # include in the simulation. If you want to simulate only policies specified as strings, use
    # [SimulateCustomPolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_SimulateCustomPolicy.html)
    # instead.
    #
    # You can also optionally include one resource-based policy to be evaluated with each of the
    # resources included in the simulation for IAM users only.
    #
    # The simulation does not perform the API operations; it only checks the authorization to
    # determine if the simulated policies allow or deny the operations.
    #
    # For cross-account simulations, `EvalDecisionDetails` returns the decision for each policy type
    # (identity-based policy, resource-based policy, and permissions boundary). This helps you
    # identify which policy type is responsible for an allow or deny decision when policies span
    # multiple accounts.
    #
    # **Note:** This operation discloses information about the permissions granted to other users. If
    # you do not want users to see other user's permissions, then consider allowing them to use
    # [SimulateCustomPolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_SimulateCustomPolicy.html)
    # instead.
    #
    # Context keys are variables maintained by Amazon Web Services and its services that provide
    # details about the context of an API query request. You can use the `Condition` element of an IAM
    # policy to evaluate context keys. To get the list of context keys that the policies require for
    # correct simulation, use
    # [GetContextKeysForPrincipalPolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetContextKeysForPrincipalPolicy.html).
    #
    # If the output is long, you can use the `MaxItems` and `Marker` parameters to paginate the
    # results.
    #
    # The IAM policy simulator evaluates statements in identity-based policies, service control
    # policies (SCPs) including their condition keys and resource scoping, and the inputs that you
    # provide during simulation. The policy simulator results can differ from your live Amazon Web
    # Services environment. We recommend that you check your policies against your live Amazon Web
    # Services environment after testing using the policy simulator to confirm that you have the
    # desired results. For more information about using the policy simulator, see [Testing IAM
    # policies with the IAM policy simulator
    # ](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_testing-policies.html)in the
    # *IAM User Guide*.
    def simulate_principal_policy(input : AI::SimulatePrincipalPolicyRequest) : Core::ParsedResponse(AI::SimulatePolicyResponse)
      Log.info { "performing 'SimulatePrincipalPolicy' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "SimulatePrincipalPolicy")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("SimulatePrincipalPolicy", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='SimulatePrincipalPolicyResult']").not_nil!
      result = AI::SimulatePolicyResponse.from_xml(result_node)
      Core::ParsedResponse(AI::SimulatePolicyResponse).new(response, result)
    end

    # Adds one or more tags to an IAM instance profile. If a tag with the same key name already
    # exists, then that tag is overwritten with the new value.
    #
    # Each tag consists of a key name and an associated value. By assigning tags to your resources,
    # you can do the following:
    #
    # - **Administrative grouping and discovery** - Attach tags to resources to aid in organization
    # and search. For example, you could search for all resources with the key name *Project* and the
    # value *MyImportantProject*. Or search for all resources with the key name *Cost Center* and the
    # value *41200*.
    #
    # - **Access control** - Include tags in IAM user-based and resource-based policies. You can use
    # tags to restrict access to only an IAM instance profile that has a specified tag attached. For
    # examples of policies that show how to use tags to control access, see [Control access using IAM
    # tags](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html) in the *IAM User
    # Guide*.
    #
    # - If any one of the tags is invalid or if you exceed the allowed maximum number of tags, then
    # the entire request fails and the resource is not created. For more information about tagging,
    # see [Tagging IAM resources](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html) in
    # the *IAM User Guide*.
    #
    # - Amazon Web Services always interprets the tag `Value` as a single string. If you need to store
    # an array, you can store comma-separated values in the string. However, you must interpret the
    # value in your code.
    def tag_instance_profile(input : AI::TagInstanceProfileRequest) : Core::Response
      Log.info { "performing 'TagInstanceProfile' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "TagInstanceProfile")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("TagInstanceProfile", body)
      Core::Response.new(response)
    end

    # Adds one or more tags to an IAM virtual multi-factor authentication (MFA) device. If a tag with
    # the same key name already exists, then that tag is overwritten with the new value.
    #
    # A tag consists of a key name and an associated value. By assigning tags to your resources, you
    # can do the following:
    #
    # - **Administrative grouping and discovery** - Attach tags to resources to aid in organization
    # and search. For example, you could search for all resources with the key name *Project* and the
    # value *MyImportantProject*. Or search for all resources with the key name *Cost Center* and the
    # value *41200*.
    #
    # - **Access control** - Include tags in IAM user-based and resource-based policies. You can use
    # tags to restrict access to only an IAM virtual MFA device that has a specified tag attached. For
    # examples of policies that show how to use tags to control access, see [Control access using IAM
    # tags](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html) in the *IAM User
    # Guide*.
    #
    # - If any one of the tags is invalid or if you exceed the allowed maximum number of tags, then
    # the entire request fails and the resource is not created. For more information about tagging,
    # see [Tagging IAM resources](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html) in
    # the *IAM User Guide*.
    #
    # - Amazon Web Services always interprets the tag `Value` as a single string. If you need to store
    # an array, you can store comma-separated values in the string. However, you must interpret the
    # value in your code.
    def tag_mfa_device(input : AI::TagMFADeviceRequest) : Core::Response
      Log.info { "performing 'TagMFADevice' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "TagMFADevice")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("TagMFADevice", body)
      Core::Response.new(response)
    end

    # Adds one or more tags to an OpenID Connect (OIDC)-compatible identity provider. For more
    # information about these providers, see [About web identity
    # federation](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_oidc.html). If a
    # tag with the same key name already exists, then that tag is overwritten with the new value.
    #
    # A tag consists of a key name and an associated value. By assigning tags to your resources, you
    # can do the following:
    #
    # - **Administrative grouping and discovery** - Attach tags to resources to aid in organization
    # and search. For example, you could search for all resources with the key name *Project* and the
    # value *MyImportantProject*. Or search for all resources with the key name *Cost Center* and the
    # value *41200*.
    #
    # - **Access control** - Include tags in IAM identity-based and resource-based policies. You can
    # use tags to restrict access to only an OIDC provider that has a specified tag attached. For
    # examples of policies that show how to use tags to control access, see [Control access using IAM
    # tags](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html) in the *IAM User
    # Guide*.
    #
    # - If any one of the tags is invalid or if you exceed the allowed maximum number of tags, then
    # the entire request fails and the resource is not created. For more information about tagging,
    # see [Tagging IAM resources](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html) in
    # the *IAM User Guide*.
    #
    # - Amazon Web Services always interprets the tag `Value` as a single string. If you need to store
    # an array, you can store comma-separated values in the string. However, you must interpret the
    # value in your code.
    def tag_open_id_connect_provider(input : AI::TagOpenIDConnectProviderRequest) : Core::Response
      Log.info { "performing 'TagOpenIDConnectProvider' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "TagOpenIDConnectProvider")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("TagOpenIDConnectProvider", body)
      Core::Response.new(response)
    end

    # Adds one or more tags to an IAM customer managed policy. If a tag with the same key name already
    # exists, then that tag is overwritten with the new value.
    #
    # A tag consists of a key name and an associated value. By assigning tags to your resources, you
    # can do the following:
    #
    # - **Administrative grouping and discovery** - Attach tags to resources to aid in organization
    # and search. For example, you could search for all resources with the key name *Project* and the
    # value *MyImportantProject*. Or search for all resources with the key name *Cost Center* and the
    # value *41200*.
    #
    # - **Access control** - Include tags in IAM user-based and resource-based policies. You can use
    # tags to restrict access to only an IAM customer managed policy that has a specified tag
    # attached. For examples of policies that show how to use tags to control access, see [Control
    # access using IAM tags](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html) in the
    # *IAM User Guide*.
    #
    # - If any one of the tags is invalid or if you exceed the allowed maximum number of tags, then
    # the entire request fails and the resource is not created. For more information about tagging,
    # see [Tagging IAM resources](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html) in
    # the *IAM User Guide*.
    #
    # - Amazon Web Services always interprets the tag `Value` as a single string. If you need to store
    # an array, you can store comma-separated values in the string. However, you must interpret the
    # value in your code.
    def tag_policy(input : AI::TagPolicyRequest) : Core::Response
      Log.info { "performing 'TagPolicy' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "TagPolicy")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("TagPolicy", body)
      Core::Response.new(response)
    end

    # Adds one or more tags to an IAM role. The role can be a regular role or a service-linked role.
    # If a tag with the same key name already exists, then that tag is overwritten with the new value.
    #
    # A tag consists of a key name and an associated value. By assigning tags to your resources, you
    # can do the following:
    #
    # - **Administrative grouping and discovery** - Attach tags to resources to aid in organization
    # and search. For example, you could search for all resources with the key name *Project* and the
    # value *MyImportantProject*. Or search for all resources with the key name *Cost Center* and the
    # value *41200*.
    #
    # - **Access control** - Include tags in IAM user-based and resource-based policies. You can use
    # tags to restrict access to only an IAM role that has a specified tag attached. You can also
    # restrict access to only those resources that have a certain tag attached. For examples of
    # policies that show how to use tags to control access, see [Control access using IAM
    # tags](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html) in the *IAM User
    # Guide*.
    #
    # - **Cost allocation** - Use tags to help track which individuals and teams are using which
    # Amazon Web Services resources.
    #
    # - If any one of the tags is invalid or if you exceed the allowed maximum number of tags, then
    # the entire request fails and the resource is not created. For more information about tagging,
    # see [Tagging IAM resources](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html) in
    # the *IAM User Guide*.
    #
    # - Amazon Web Services always interprets the tag `Value` as a single string. If you need to store
    # an array, you can store comma-separated values in the string. However, you must interpret the
    # value in your code.
    #
    # For more information about tagging, see [Tagging IAM
    # identities](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html) in the *IAM User
    # Guide*.
    def tag_role(input : AI::TagRoleRequest) : Core::Response
      Log.info { "performing 'TagRole' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "TagRole")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("TagRole", body)
      Core::Response.new(response)
    end

    # Adds one or more tags to a Security Assertion Markup Language (SAML) identity provider. For more
    # information about these providers, see [About SAML 2.0-based federation
    # ](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_saml.html). If a tag with
    # the same key name already exists, then that tag is overwritten with the new value.
    #
    # A tag consists of a key name and an associated value. By assigning tags to your resources, you
    # can do the following:
    #
    # - **Administrative grouping and discovery** - Attach tags to resources to aid in organization
    # and search. For example, you could search for all resources with the key name *Project* and the
    # value *MyImportantProject*. Or search for all resources with the key name *Cost Center* and the
    # value *41200*.
    #
    # - **Access control** - Include tags in IAM user-based and resource-based policies. You can use
    # tags to restrict access to only a SAML identity provider that has a specified tag attached. For
    # examples of policies that show how to use tags to control access, see [Control access using IAM
    # tags](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html) in the *IAM User
    # Guide*.
    #
    # - If any one of the tags is invalid or if you exceed the allowed maximum number of tags, then
    # the entire request fails and the resource is not created. For more information about tagging,
    # see [Tagging IAM resources](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html) in
    # the *IAM User Guide*.
    #
    # - Amazon Web Services always interprets the tag `Value` as a single string. If you need to store
    # an array, you can store comma-separated values in the string. However, you must interpret the
    # value in your code.
    def tag_saml_provider(input : AI::TagSAMLProviderRequest) : Core::Response
      Log.info { "performing 'TagSAMLProvider' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "TagSAMLProvider")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("TagSAMLProvider", body)
      Core::Response.new(response)
    end

    # Adds one or more tags to an IAM server certificate. If a tag with the same key name already
    # exists, then that tag is overwritten with the new value.
    #
    # For certificates in a Region supported by Certificate Manager (ACM), we recommend that you don't
    # use IAM server certificates. Instead, use ACM to provision, manage, and deploy your server
    # certificates. For more information about IAM server certificates, [Working with server
    # certificates](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs.html)
    # in the *IAM User Guide*.
    #
    # A tag consists of a key name and an associated value. By assigning tags to your resources, you
    # can do the following:
    #
    # - **Administrative grouping and discovery** - Attach tags to resources to aid in organization
    # and search. For example, you could search for all resources with the key name *Project* and the
    # value *MyImportantProject*. Or search for all resources with the key name *Cost Center* and the
    # value *41200*.
    #
    # - **Access control** - Include tags in IAM user-based and resource-based policies. You can use
    # tags to restrict access to only a server certificate that has a specified tag attached. For
    # examples of policies that show how to use tags to control access, see [Control access using IAM
    # tags](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html) in the *IAM User
    # Guide*.
    #
    # - **Cost allocation** - Use tags to help track which individuals and teams are using which
    # Amazon Web Services resources.
    #
    # - If any one of the tags is invalid or if you exceed the allowed maximum number of tags, then
    # the entire request fails and the resource is not created. For more information about tagging,
    # see [Tagging IAM resources](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html) in
    # the *IAM User Guide*.
    #
    # - Amazon Web Services always interprets the tag `Value` as a single string. If you need to store
    # an array, you can store comma-separated values in the string. However, you must interpret the
    # value in your code.
    def tag_server_certificate(input : AI::TagServerCertificateRequest) : Core::Response
      Log.info { "performing 'TagServerCertificate' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "TagServerCertificate")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("TagServerCertificate", body)
      Core::Response.new(response)
    end

    # Adds one or more tags to an IAM user. If a tag with the same key name already exists, then that
    # tag is overwritten with the new value.
    #
    # A tag consists of a key name and an associated value. By assigning tags to your resources, you
    # can do the following:
    #
    # - **Administrative grouping and discovery** - Attach tags to resources to aid in organization
    # and search. For example, you could search for all resources with the key name *Project* and the
    # value *MyImportantProject*. Or search for all resources with the key name *Cost Center* and the
    # value *41200*.
    #
    # - **Access control** - Include tags in IAM identity-based and resource-based policies. You can
    # use tags to restrict access to only an IAM requesting user that has a specified tag attached.
    # You can also restrict access to only those resources that have a certain tag attached. For
    # examples of policies that show how to use tags to control access, see [Control access using IAM
    # tags](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html) in the *IAM User
    # Guide*.
    #
    # - **Cost allocation** - Use tags to help track which individuals and teams are using which
    # Amazon Web Services resources.
    #
    # - If any one of the tags is invalid or if you exceed the allowed maximum number of tags, then
    # the entire request fails and the resource is not created. For more information about tagging,
    # see [Tagging IAM resources](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html) in
    # the *IAM User Guide*.
    #
    # - Amazon Web Services always interprets the tag `Value` as a single string. If you need to store
    # an array, you can store comma-separated values in the string. However, you must interpret the
    # value in your code.
    #
    # For more information about tagging, see [Tagging IAM
    # identities](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html) in the *IAM User
    # Guide*.
    def tag_user(input : AI::TagUserRequest) : Core::Response
      Log.info { "performing 'TagUser' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "TagUser")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("TagUser", body)
      Core::Response.new(response)
    end

    # Removes the specified tags from the IAM instance profile. For more information about tagging,
    # see [Tagging IAM resources](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html) in
    # the *IAM User Guide*.
    def untag_instance_profile(input : AI::UntagInstanceProfileRequest) : Core::Response
      Log.info { "performing 'UntagInstanceProfile' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UntagInstanceProfile")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UntagInstanceProfile", body)
      Core::Response.new(response)
    end

    # Removes the specified tags from the IAM virtual multi-factor authentication (MFA) device. For
    # more information about tagging, see [Tagging IAM
    # resources](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html) in the *IAM User
    # Guide*.
    def untag_mfa_device(input : AI::UntagMFADeviceRequest) : Core::Response
      Log.info { "performing 'UntagMFADevice' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UntagMFADevice")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UntagMFADevice", body)
      Core::Response.new(response)
    end

    # Removes the specified tags from the specified OpenID Connect (OIDC)-compatible identity provider
    # in IAM. For more information about OIDC providers, see [About web identity
    # federation](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_oidc.html). For
    # more information about tagging, see [Tagging IAM
    # resources](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html) in the *IAM User
    # Guide*.
    def untag_open_id_connect_provider(input : AI::UntagOpenIDConnectProviderRequest) : Core::Response
      Log.info { "performing 'UntagOpenIDConnectProvider' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UntagOpenIDConnectProvider")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UntagOpenIDConnectProvider", body)
      Core::Response.new(response)
    end

    # Removes the specified tags from the customer managed policy. For more information about tagging,
    # see [Tagging IAM resources](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html) in
    # the *IAM User Guide*.
    def untag_policy(input : AI::UntagPolicyRequest) : Core::Response
      Log.info { "performing 'UntagPolicy' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UntagPolicy")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UntagPolicy", body)
      Core::Response.new(response)
    end

    # Removes the specified tags from the role. For more information about tagging, see [Tagging IAM
    # resources](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html) in the *IAM User
    # Guide*.
    def untag_role(input : AI::UntagRoleRequest) : Core::Response
      Log.info { "performing 'UntagRole' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UntagRole")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UntagRole", body)
      Core::Response.new(response)
    end

    # Removes the specified tags from the specified Security Assertion Markup Language (SAML) identity
    # provider in IAM. For more information about these providers, see [About web identity
    # federation](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_oidc.html). For
    # more information about tagging, see [Tagging IAM
    # resources](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html) in the *IAM User
    # Guide*.
    def untag_saml_provider(input : AI::UntagSAMLProviderRequest) : Core::Response
      Log.info { "performing 'UntagSAMLProvider' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UntagSAMLProvider")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UntagSAMLProvider", body)
      Core::Response.new(response)
    end

    # Removes the specified tags from the IAM server certificate. For more information about tagging,
    # see [Tagging IAM resources](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html) in
    # the *IAM User Guide*.
    #
    # For certificates in a Region supported by Certificate Manager (ACM), we recommend that you don't
    # use IAM server certificates. Instead, use ACM to provision, manage, and deploy your server
    # certificates. For more information about IAM server certificates, [Working with server
    # certificates](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs.html)
    # in the *IAM User Guide*.
    def untag_server_certificate(input : AI::UntagServerCertificateRequest) : Core::Response
      Log.info { "performing 'UntagServerCertificate' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UntagServerCertificate")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UntagServerCertificate", body)
      Core::Response.new(response)
    end

    # Removes the specified tags from the user. For more information about tagging, see [Tagging IAM
    # resources](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html) in the *IAM User
    # Guide*.
    def untag_user(input : AI::UntagUserRequest) : Core::Response
      Log.info { "performing 'UntagUser' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UntagUser")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UntagUser", body)
      Core::Response.new(response)
    end

    # Changes the status of the specified access key from Active to Inactive, or vice versa. This
    # operation can be used to disable a user's key as part of a key rotation workflow.
    #
    # If the `UserName` is not specified, the user name is determined implicitly based on the Amazon
    # Web Services access key ID used to sign the request. If a temporary access key is used, then
    # `UserName` is required. If a long-term key is assigned to the user, then `UserName` is not
    # required. This operation works for access keys under the Amazon Web Services account.
    # Consequently, you can use this operation to manage Amazon Web Services account root user
    # credentials even if the Amazon Web Services account has no associated users.
    #
    # For information about rotating keys, see [Managing keys and
    # certificates](https://docs.aws.amazon.com/IAM/latest/UserGuide/ManagingCredentials.html) in the
    # *IAM User Guide*.
    def update_access_key(input : AI::UpdateAccessKeyRequest) : Core::Response
      Log.info { "performing 'UpdateAccessKey' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UpdateAccessKey")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UpdateAccessKey", body)
      Core::Response.new(response)
    end

    # Updates the password policy settings for the Amazon Web Services account.
    #
    # This operation does not support partial updates. No parameters are required, but if you do not
    # specify a parameter, that parameter's value reverts to its default value. See the **Request
    # Parameters** section for each parameter's default value. Also note that some parameters do not
    # allow the default parameter to be explicitly set. Instead, to invoke the default value, do not
    # include that parameter when you invoke the operation.
    #
    # For more information about using a password policy, see [Managing an IAM password
    # policy](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_ManagingPasswordPolicies.html) in
    # the *IAM User Guide*.
    def update_account_password_policy(input : AI::UpdateAccountPasswordPolicyRequest) : Core::Response
      Log.info { "performing 'UpdateAccountPasswordPolicy' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UpdateAccountPasswordPolicy")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UpdateAccountPasswordPolicy", body)
      Core::Response.new(response)
    end

    # Updates the policy that grants an IAM entity permission to assume a role. This is typically
    # referred to as the "role trust policy". For more information about roles, see [Using roles to
    # delegate permissions and federate
    # identities](https://docs.aws.amazon.com/IAM/latest/UserGuide/roles-toplevel.html).
    def update_assume_role_policy(input : AI::UpdateAssumeRolePolicyRequest) : Core::Response
      Log.info { "performing 'UpdateAssumeRolePolicy' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UpdateAssumeRolePolicy")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UpdateAssumeRolePolicy", body)
      Core::Response.new(response)
    end

    # Updates an existing delegation request with additional information. When the delegation request
    # is updated, it reaches the `PENDING_APPROVAL` state.
    #
    # Once a delegation request has an owner, that owner gets a default permission to update the
    # delegation request. For more details, see [ Managing Permissions for Delegation
    # Requests](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies-temporary-delegation.html#temporary-delegation-managing-permissions).
    def update_delegation_request(input : AI::UpdateDelegationRequestRequest) : Core::Response
      Log.info { "performing 'UpdateDelegationRequest' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UpdateDelegationRequest")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UpdateDelegationRequest", body)
      Core::Response.new(response)
    end

    # Updates the name and/or the path of the specified IAM group.
    #
    # You should understand the implications of changing a group's path or name. For more information,
    # see [Renaming users and
    # groups](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_WorkingWithGroupsAndUsers.html)
    # in the *IAM User Guide*.
    #
    # The person making the request (the principal), must have permission to change the role group
    # with the old name and the new name. For example, to change the group named `Managers` to `MGRs`,
    # the principal must have a policy that allows them to update both groups. If the principal has
    # permission to update the `Managers` group, but not the `MGRs` group, then the update fails. For
    # more information about permissions, see [Access
    # management](https://docs.aws.amazon.com/IAM/latest/UserGuide/access.html).
    def update_group(input : AI::UpdateGroupRequest) : Core::Response
      Log.info { "performing 'UpdateGroup' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UpdateGroup")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UpdateGroup", body)
      Core::Response.new(response)
    end

    # Changes the password for the specified IAM user. You can use the CLI, the Amazon Web Services
    # API, or the **Users** page in the IAM console to change the password for any IAM user. Use
    # [ChangePassword](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ChangePassword.html) to
    # change your own password in the **My Security Credentials** page in the Amazon Web Services
    # Management Console.
    #
    # For more information about modifying passwords, see [Managing
    # passwords](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_ManagingLogins.html) in the
    # *IAM User Guide*.
    def update_login_profile(input : AI::UpdateLoginProfileRequest) : Core::Response
      Log.info { "performing 'UpdateLoginProfile' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UpdateLoginProfile")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UpdateLoginProfile", body)
      Core::Response.new(response)
    end

    # Replaces the existing list of server certificate thumbprints associated with an OpenID Connect
    # (OIDC) provider resource object with a new list of thumbprints.
    #
    # The list that you pass with this operation completely replaces the existing list of thumbprints.
    # (The lists are not merged.)
    #
    # Typically, you need to update a thumbprint only when the identity provider certificate changes,
    # which occurs rarely. However, if the provider's certificate *does* change, any attempt to assume
    # an IAM role that specifies the OIDC provider as a principal fails until the certificate
    # thumbprint is updated.
    #
    # Amazon Web Services secures communication with OIDC identity providers (IdPs) using our library
    # of trusted root certificate authorities (CAs) to verify the JSON Web Key Set (JWKS) endpoint's
    # TLS certificate. If your OIDC IdP relies on a certificate that is not signed by one of these
    # trusted CAs, only then we secure communication using the thumbprints set in the IdP's
    # configuration.
    #
    # Trust for the OIDC provider is derived from the provider certificate and is validated by the
    # thumbprint. Therefore, it is best to limit access to the `UpdateOpenIDConnectProviderThumbprint`
    # operation to highly privileged users.
    def update_open_id_connect_provider_thumbprint(input : AI::UpdateOpenIDConnectProviderThumbprintRequest) : Core::Response
      Log.info { "performing 'UpdateOpenIDConnectProviderThumbprint' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UpdateOpenIDConnectProviderThumbprint")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UpdateOpenIDConnectProviderThumbprint", body)
      Core::Response.new(response)
    end

    # Updates the description or maximum session duration setting of a role.
    def update_role(input : AI::UpdateRoleRequest) : Core::ParsedResponse(AI::UpdateRoleResponse)
      Log.info { "performing 'UpdateRole' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UpdateRole")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UpdateRole", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='UpdateRoleResult']").not_nil!
      result = AI::UpdateRoleResponse.from_xml(result_node)
      Core::ParsedResponse(AI::UpdateRoleResponse).new(response, result)
    end

    # Use [UpdateRole](https://docs.aws.amazon.com/IAM/latest/APIReference/API_UpdateRole.html)
    # instead.
    #
    # Modifies only the description of a role. This operation performs the same function as the
    # `Description` parameter in the `UpdateRole` operation.
    def update_role_description(input : AI::UpdateRoleDescriptionRequest) : Core::ParsedResponse(AI::UpdateRoleDescriptionResponse)
      Log.info { "performing 'UpdateRoleDescription' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UpdateRoleDescription")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UpdateRoleDescription", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='UpdateRoleDescriptionResult']").not_nil!
      result = AI::UpdateRoleDescriptionResponse.from_xml(result_node)
      Core::ParsedResponse(AI::UpdateRoleDescriptionResponse).new(response, result)
    end

    # Updates the metadata document, SAML encryption settings, and private keys for an existing SAML
    # provider. To rotate private keys, add your new private key and then remove the old key in a
    # separate request.
    def update_saml_provider(input : AI::UpdateSAMLProviderRequest) : Core::ParsedResponse(AI::UpdateSAMLProviderResponse)
      Log.info { "performing 'UpdateSAMLProvider' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UpdateSAMLProvider")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UpdateSAMLProvider", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='UpdateSAMLProviderResult']").not_nil!
      result = AI::UpdateSAMLProviderResponse.from_xml(result_node)
      Core::ParsedResponse(AI::UpdateSAMLProviderResponse).new(response, result)
    end

    # Updates the name and/or the path of the specified server certificate stored in IAM.
    #
    # For more information about working with server certificates, see [Working with server
    # certificates](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs.html)
    # in the *IAM User Guide*. This topic also includes a list of Amazon Web Services services that
    # can use the server certificates that you manage with IAM.
    #
    # You should understand the implications of changing a server certificate's path or name. For more
    # information, see [Renaming a server
    # certificate](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs_manage.html#RenamingServerCerts)
    # in the *IAM User Guide*.
    #
    # The person making the request (the principal), must have permission to change the server
    # certificate with the old name and the new name. For example, to change the certificate named
    # `ProductionCert` to `ProdCert`, the principal must have a policy that allows them to update both
    # certificates. If the principal has permission to update the `ProductionCert` group, but not the
    # `ProdCert` certificate, then the update fails. For more information about permissions, see
    # [Access management](https://docs.aws.amazon.com/IAM/latest/UserGuide/access.html) in the *IAM
    # User Guide*.
    def update_server_certificate(input : AI::UpdateServerCertificateRequest) : Core::Response
      Log.info { "performing 'UpdateServerCertificate' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UpdateServerCertificate")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UpdateServerCertificate", body)
      Core::Response.new(response)
    end

    # Sets the status of a service-specific credential to `Active` or `Inactive`. Service-specific
    # credentials that are inactive cannot be used for authentication to the service. This operation
    # can be used to disable a user's service-specific credential as part of a credential rotation
    # work flow.
    def update_service_specific_credential(input : AI::UpdateServiceSpecificCredentialRequest) : Core::Response
      Log.info { "performing 'UpdateServiceSpecificCredential' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UpdateServiceSpecificCredential")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UpdateServiceSpecificCredential", body)
      Core::Response.new(response)
    end

    # Changes the status of the specified user signing certificate from active to disabled, or vice
    # versa. This operation can be used to disable an IAM user's signing certificate as part of a
    # certificate rotation work flow.
    #
    # If the `UserName` field is not specified, the user name is determined implicitly based on the
    # Amazon Web Services access key ID used to sign the request. This operation works for access keys
    # under the Amazon Web Services account. Consequently, you can use this operation to manage Amazon
    # Web Services account root user credentials even if the Amazon Web Services account has no
    # associated users.
    def update_signing_certificate(input : AI::UpdateSigningCertificateRequest) : Core::Response
      Log.info { "performing 'UpdateSigningCertificate' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UpdateSigningCertificate")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UpdateSigningCertificate", body)
      Core::Response.new(response)
    end

    # Sets the status of an IAM user's SSH public key to active or inactive. SSH public keys that are
    # inactive cannot be used for authentication. This operation can be used to disable a user's SSH
    # public key as part of a key rotation work flow.
    #
    # The SSH public key affected by this operation is used only for authenticating the associated IAM
    # user to an CodeCommit repository. For more information about using SSH keys to authenticate to
    # an CodeCommit repository, see [Set up CodeCommit for SSH
    # connections](https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-credentials-ssh.html)
    # in the *CodeCommit User Guide*.
    def update_ssh_public_key(input : AI::UpdateSSHPublicKeyRequest) : Core::Response
      Log.info { "performing 'UpdateSSHPublicKey' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UpdateSSHPublicKey")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UpdateSSHPublicKey", body)
      Core::Response.new(response)
    end

    # Updates the name and/or the path of the specified IAM user.
    #
    # You should understand the implications of changing an IAM user's path or name. For more
    # information, see [Renaming an IAM
    # user](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_manage.html#id_users_renaming)
    # and [Renaming an IAM
    # group](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_groups_manage_rename.html) in the
    # *IAM User Guide*.
    #
    # To change a user name, the requester must have appropriate permissions on both the source object
    # and the target object. For example, to change Bob to Robert, the entity making the request must
    # have permission on Bob and Robert, or must have permission on all (*). For more information
    # about permissions, see [Permissions and
    # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/PermissionsAndPolicies.html).
    def update_user(input : AI::UpdateUserRequest) : Core::Response
      Log.info { "performing 'UpdateUser' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UpdateUser")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UpdateUser", body)
      Core::Response.new(response)
    end

    # Uploads a server certificate entity for the Amazon Web Services account. The server certificate
    # entity includes a public key certificate, a private key, and an optional certificate chain,
    # which should all be PEM-encoded.
    #
    # We recommend that you use [Certificate Manager](https://docs.aws.amazon.com/acm/) to provision,
    # manage, and deploy your server certificates. With ACM you can request a certificate, deploy it
    # to Amazon Web Services resources, and let ACM handle certificate renewals for you. Certificates
    # provided by ACM are free. For more information about using ACM, see the [Certificate Manager
    # User Guide](https://docs.aws.amazon.com/acm/latest/userguide/).
    #
    # For more information about working with server certificates, see [Working with server
    # certificates](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs.html)
    # in the *IAM User Guide*. This topic includes a list of Amazon Web Services services that can use
    # the server certificates that you manage with IAM.
    #
    # For information about the number of server certificates you can upload, see [IAM and STS
    # quotas](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html) in the *IAM
    # User Guide*.
    #
    # Because the body of the public key certificate, private key, and the certificate chain can be
    # large, you should use POST rather than GET when calling `UploadServerCertificate`. For
    # information about setting up signatures and authorization through the API, see [Signing Amazon
    # Web Services API
    # requests](https://docs.aws.amazon.com/general/latest/gr/signing_aws_api_requests.html) in the
    # *Amazon Web Services General Reference*. For general information about using the Query API with
    # IAM, see [Calling the API by making HTTP query
    # requests](https://docs.aws.amazon.com/IAM/latest/UserGuide/programming.html) in the *IAM User
    # Guide*.
    def upload_server_certificate(input : AI::UploadServerCertificateRequest) : Core::ParsedResponse(AI::UploadServerCertificateResponse)
      Log.info { "performing 'UploadServerCertificate' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UploadServerCertificate")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UploadServerCertificate", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='UploadServerCertificateResult']").not_nil!
      result = AI::UploadServerCertificateResponse.from_xml(result_node)
      Core::ParsedResponse(AI::UploadServerCertificateResponse).new(response, result)
    end

    # Uploads an X.509 signing certificate and associates it with the specified IAM user. Some Amazon
    # Web Services services require you to use certificates to validate requests that are signed with
    # a corresponding private key. When you upload the certificate, its default status is `Active`.
    #
    # For information about when you would use an X.509 signing certificate, see [Managing server
    # certificates in
    # IAM](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs.html) in the
    # *IAM User Guide*.
    #
    # If the `UserName` is not specified, the IAM user name is determined implicitly based on the
    # Amazon Web Services access key ID used to sign the request. This operation works for access keys
    # under the Amazon Web Services account. Consequently, you can use this operation to manage Amazon
    # Web Services account root user credentials even if the Amazon Web Services account has no
    # associated users.
    #
    # Because the body of an X.509 certificate can be large, you should use POST rather than GET when
    # calling `UploadSigningCertificate`. For information about setting up signatures and
    # authorization through the API, see [Signing Amazon Web Services API
    # requests](https://docs.aws.amazon.com/general/latest/gr/signing_aws_api_requests.html) in the
    # *Amazon Web Services General Reference*. For general information about using the Query API with
    # IAM, see [Making query
    # requests](https://docs.aws.amazon.com/IAM/latest/UserGuide/IAM_UsingQueryAPI.html) in the *IAM
    # User Guide*.
    def upload_signing_certificate(input : AI::UploadSigningCertificateRequest) : Core::ParsedResponse(AI::UploadSigningCertificateResponse)
      Log.info { "performing 'UploadSigningCertificate' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UploadSigningCertificate")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UploadSigningCertificate", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='UploadSigningCertificateResult']").not_nil!
      result = AI::UploadSigningCertificateResponse.from_xml(result_node)
      Core::ParsedResponse(AI::UploadSigningCertificateResponse).new(response, result)
    end

    # Uploads an SSH public key and associates it with the specified IAM user.
    #
    # The SSH public key uploaded by this operation can be used only for authenticating the associated
    # IAM user to an CodeCommit repository. For more information about using SSH keys to authenticate
    # to an CodeCommit repository, see [Set up CodeCommit for SSH
    # connections](https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-credentials-ssh.html)
    # in the *CodeCommit User Guide*.
    def upload_ssh_public_key(input : AI::UploadSSHPublicKeyRequest) : Core::ParsedResponse(AI::UploadSSHPublicKeyResponse)
      Log.info { "performing 'UploadSSHPublicKey' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UploadSSHPublicKey")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UploadSSHPublicKey", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='UploadSSHPublicKeyResult']").not_nil!
      result = AI::UploadSSHPublicKeyResponse.from_xml(result_node)
      Core::ParsedResponse(AI::UploadSSHPublicKeyResponse).new(response, result)
    end
  end
end
