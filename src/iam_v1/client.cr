private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  class Client < Core::Client
    Log               = ::Log.for("amazonite.iam_v1.client")
    EXCEPTION_FACTORY = ExceptionFactory.new

    def initialize(config = Core::Config.new)
      super("AWSIdentityManagementV20100508", "iam", "1.0", EXCEPTION_FACTORY, config)
    end

    def accept_delegation_request(input : AI::AcceptDelegationRequestRequest) : Core::Response
      Log.info { "performing 'AcceptDelegationRequest' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "AcceptDelegationRequest")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("AcceptDelegationRequest", body)
      Core::Response.new(response)
    end

    def acquire_role(input : AI::AcquireRoleRequest) : Core::ParsedResponse(AI::AcquireRoleResponse)
      Log.info { "performing 'AcquireRole' operation" }
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

    def add_client_id_to_open_id_connect_provider(input : AI::AddClientIDToOpenIDConnectProviderRequest) : Core::Response
      Log.info { "performing 'AddClientIDToOpenIDConnectProvider' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "AddClientIDToOpenIDConnectProvider")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("AddClientIDToOpenIDConnectProvider", body)
      Core::Response.new(response)
    end

    def add_role_to_instance_profile(input : AI::AddRoleToInstanceProfileRequest) : Core::Response
      Log.info { "performing 'AddRoleToInstanceProfile' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "AddRoleToInstanceProfile")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("AddRoleToInstanceProfile", body)
      Core::Response.new(response)
    end

    def add_user_to_group(input : AI::AddUserToGroupRequest) : Core::Response
      Log.info { "performing 'AddUserToGroup' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "AddUserToGroup")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("AddUserToGroup", body)
      Core::Response.new(response)
    end

    def associate_delegation_request(input : AI::AssociateDelegationRequestRequest) : Core::Response
      Log.info { "performing 'AssociateDelegationRequest' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "AssociateDelegationRequest")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("AssociateDelegationRequest", body)
      Core::Response.new(response)
    end

    def attach_group_policy(input : AI::AttachGroupPolicyRequest) : Core::Response
      Log.info { "performing 'AttachGroupPolicy' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "AttachGroupPolicy")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("AttachGroupPolicy", body)
      Core::Response.new(response)
    end

    def attach_role_policy(input : AI::AttachRolePolicyRequest) : Core::Response
      Log.info { "performing 'AttachRolePolicy' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "AttachRolePolicy")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("AttachRolePolicy", body)
      Core::Response.new(response)
    end

    def attach_user_policy(input : AI::AttachUserPolicyRequest) : Core::Response
      Log.info { "performing 'AttachUserPolicy' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "AttachUserPolicy")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("AttachUserPolicy", body)
      Core::Response.new(response)
    end

    def change_password(input : AI::ChangePasswordRequest) : Core::Response
      Log.info { "performing 'ChangePassword' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ChangePassword")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ChangePassword", body)
      Core::Response.new(response)
    end

    def create_access_key(input : AI::CreateAccessKeyRequest) : Core::ParsedResponse(AI::CreateAccessKeyResponse)
      Log.info { "performing 'CreateAccessKey' operation" }
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

    def create_account_alias(input : AI::CreateAccountAliasRequest) : Core::Response
      Log.info { "performing 'CreateAccountAlias' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "CreateAccountAlias")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("CreateAccountAlias", body)
      Core::Response.new(response)
    end

    def create_delegation_request(input : AI::CreateDelegationRequestRequest) : Core::ParsedResponse(AI::CreateDelegationRequestResponse)
      Log.info { "performing 'CreateDelegationRequest' operation" }
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

    def create_group(input : AI::CreateGroupRequest) : Core::ParsedResponse(AI::CreateGroupResponse)
      Log.info { "performing 'CreateGroup' operation" }
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

    def create_instance_profile(input : AI::CreateInstanceProfileRequest) : Core::ParsedResponse(AI::CreateInstanceProfileResponse)
      Log.info { "performing 'CreateInstanceProfile' operation" }
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

    def create_login_profile(input : AI::CreateLoginProfileRequest) : Core::ParsedResponse(AI::CreateLoginProfileResponse)
      Log.info { "performing 'CreateLoginProfile' operation" }
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

    def create_open_id_connect_provider(input : AI::CreateOpenIDConnectProviderRequest) : Core::ParsedResponse(AI::CreateOpenIDConnectProviderResponse)
      Log.info { "performing 'CreateOpenIDConnectProvider' operation" }
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

    def create_policy(input : AI::CreatePolicyRequest) : Core::ParsedResponse(AI::CreatePolicyResponse)
      Log.info { "performing 'CreatePolicy' operation" }
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

    def create_policy_version(input : AI::CreatePolicyVersionRequest) : Core::ParsedResponse(AI::CreatePolicyVersionResponse)
      Log.info { "performing 'CreatePolicyVersion' operation" }
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

    def create_role(input : AI::CreateRoleRequest) : Core::ParsedResponse(AI::CreateRoleResponse)
      Log.info { "performing 'CreateRole' operation" }
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

    def create_saml_provider(input : AI::CreateSAMLProviderRequest) : Core::ParsedResponse(AI::CreateSAMLProviderResponse)
      Log.info { "performing 'CreateSAMLProvider' operation" }
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

    def create_service_linked_role(input : AI::CreateServiceLinkedRoleRequest) : Core::ParsedResponse(AI::CreateServiceLinkedRoleResponse)
      Log.info { "performing 'CreateServiceLinkedRole' operation" }
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

    def create_service_specific_credential(input : AI::CreateServiceSpecificCredentialRequest) : Core::ParsedResponse(AI::CreateServiceSpecificCredentialResponse)
      Log.info { "performing 'CreateServiceSpecificCredential' operation" }
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

    def create_user(input : AI::CreateUserRequest) : Core::ParsedResponse(AI::CreateUserResponse)
      Log.info { "performing 'CreateUser' operation" }
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

    def create_virtual_mfa_device(input : AI::CreateVirtualMFADeviceRequest) : Core::ParsedResponse(AI::CreateVirtualMFADeviceResponse)
      Log.info { "performing 'CreateVirtualMFADevice' operation" }
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

    def deactivate_mfa_device(input : AI::DeactivateMFADeviceRequest) : Core::Response
      Log.info { "performing 'DeactivateMFADevice' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeactivateMFADevice")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeactivateMFADevice", body)
      Core::Response.new(response)
    end

    def delete_access_key(input : AI::DeleteAccessKeyRequest) : Core::Response
      Log.info { "performing 'DeleteAccessKey' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeleteAccessKey")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeleteAccessKey", body)
      Core::Response.new(response)
    end

    def delete_account_alias(input : AI::DeleteAccountAliasRequest) : Core::Response
      Log.info { "performing 'DeleteAccountAlias' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeleteAccountAlias")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeleteAccountAlias", body)
      Core::Response.new(response)
    end

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

    def delete_group(input : AI::DeleteGroupRequest) : Core::Response
      Log.info { "performing 'DeleteGroup' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeleteGroup")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeleteGroup", body)
      Core::Response.new(response)
    end

    def delete_group_policy(input : AI::DeleteGroupPolicyRequest) : Core::Response
      Log.info { "performing 'DeleteGroupPolicy' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeleteGroupPolicy")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeleteGroupPolicy", body)
      Core::Response.new(response)
    end

    def delete_instance_profile(input : AI::DeleteInstanceProfileRequest) : Core::Response
      Log.info { "performing 'DeleteInstanceProfile' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeleteInstanceProfile")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeleteInstanceProfile", body)
      Core::Response.new(response)
    end

    def delete_login_profile(input : AI::DeleteLoginProfileRequest) : Core::Response
      Log.info { "performing 'DeleteLoginProfile' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeleteLoginProfile")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeleteLoginProfile", body)
      Core::Response.new(response)
    end

    def delete_open_id_connect_provider(input : AI::DeleteOpenIDConnectProviderRequest) : Core::Response
      Log.info { "performing 'DeleteOpenIDConnectProvider' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeleteOpenIDConnectProvider")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeleteOpenIDConnectProvider", body)
      Core::Response.new(response)
    end

    def delete_policy(input : AI::DeletePolicyRequest) : Core::Response
      Log.info { "performing 'DeletePolicy' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeletePolicy")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeletePolicy", body)
      Core::Response.new(response)
    end

    def delete_policy_version(input : AI::DeletePolicyVersionRequest) : Core::Response
      Log.info { "performing 'DeletePolicyVersion' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeletePolicyVersion")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeletePolicyVersion", body)
      Core::Response.new(response)
    end

    def delete_role(input : AI::DeleteRoleRequest) : Core::Response
      Log.info { "performing 'DeleteRole' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeleteRole")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeleteRole", body)
      Core::Response.new(response)
    end

    def delete_role_permissions_boundary(input : AI::DeleteRolePermissionsBoundaryRequest) : Core::Response
      Log.info { "performing 'DeleteRolePermissionsBoundary' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeleteRolePermissionsBoundary")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeleteRolePermissionsBoundary", body)
      Core::Response.new(response)
    end

    def delete_role_policy(input : AI::DeleteRolePolicyRequest) : Core::Response
      Log.info { "performing 'DeleteRolePolicy' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeleteRolePolicy")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeleteRolePolicy", body)
      Core::Response.new(response)
    end

    def delete_saml_provider(input : AI::DeleteSAMLProviderRequest) : Core::Response
      Log.info { "performing 'DeleteSAMLProvider' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeleteSAMLProvider")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeleteSAMLProvider", body)
      Core::Response.new(response)
    end

    def delete_server_certificate(input : AI::DeleteServerCertificateRequest) : Core::Response
      Log.info { "performing 'DeleteServerCertificate' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeleteServerCertificate")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeleteServerCertificate", body)
      Core::Response.new(response)
    end

    def delete_service_linked_role(input : AI::DeleteServiceLinkedRoleRequest) : Core::ParsedResponse(AI::DeleteServiceLinkedRoleResponse)
      Log.info { "performing 'DeleteServiceLinkedRole' operation" }
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

    def delete_service_specific_credential(input : AI::DeleteServiceSpecificCredentialRequest) : Core::Response
      Log.info { "performing 'DeleteServiceSpecificCredential' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeleteServiceSpecificCredential")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeleteServiceSpecificCredential", body)
      Core::Response.new(response)
    end

    def delete_signing_certificate(input : AI::DeleteSigningCertificateRequest) : Core::Response
      Log.info { "performing 'DeleteSigningCertificate' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeleteSigningCertificate")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeleteSigningCertificate", body)
      Core::Response.new(response)
    end

    def delete_ssh_public_key(input : AI::DeleteSSHPublicKeyRequest) : Core::Response
      Log.info { "performing 'DeleteSSHPublicKey' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeleteSSHPublicKey")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeleteSSHPublicKey", body)
      Core::Response.new(response)
    end

    def delete_user(input : AI::DeleteUserRequest) : Core::Response
      Log.info { "performing 'DeleteUser' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeleteUser")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeleteUser", body)
      Core::Response.new(response)
    end

    def delete_user_permissions_boundary(input : AI::DeleteUserPermissionsBoundaryRequest) : Core::Response
      Log.info { "performing 'DeleteUserPermissionsBoundary' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeleteUserPermissionsBoundary")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeleteUserPermissionsBoundary", body)
      Core::Response.new(response)
    end

    def delete_user_policy(input : AI::DeleteUserPolicyRequest) : Core::Response
      Log.info { "performing 'DeleteUserPolicy' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeleteUserPolicy")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeleteUserPolicy", body)
      Core::Response.new(response)
    end

    def delete_virtual_mfa_device(input : AI::DeleteVirtualMFADeviceRequest) : Core::Response
      Log.info { "performing 'DeleteVirtualMFADevice' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeleteVirtualMFADevice")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeleteVirtualMFADevice", body)
      Core::Response.new(response)
    end

    def detach_group_policy(input : AI::DetachGroupPolicyRequest) : Core::Response
      Log.info { "performing 'DetachGroupPolicy' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DetachGroupPolicy")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DetachGroupPolicy", body)
      Core::Response.new(response)
    end

    def detach_role_policy(input : AI::DetachRolePolicyRequest) : Core::Response
      Log.info { "performing 'DetachRolePolicy' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DetachRolePolicy")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DetachRolePolicy", body)
      Core::Response.new(response)
    end

    def detach_user_policy(input : AI::DetachUserPolicyRequest) : Core::Response
      Log.info { "performing 'DetachUserPolicy' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DetachUserPolicy")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DetachUserPolicy", body)
      Core::Response.new(response)
    end

    def disable_organizations_root_credentials_management(input : AI::DisableOrganizationsRootCredentialsManagementRequest) : Core::ParsedResponse(AI::DisableOrganizationsRootCredentialsManagementResponse)
      Log.info { "performing 'DisableOrganizationsRootCredentialsManagement' operation" }
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

    def disable_organizations_root_sessions(input : AI::DisableOrganizationsRootSessionsRequest) : Core::ParsedResponse(AI::DisableOrganizationsRootSessionsResponse)
      Log.info { "performing 'DisableOrganizationsRootSessions' operation" }
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

    def enable_mfa_device(input : AI::EnableMFADeviceRequest) : Core::Response
      Log.info { "performing 'EnableMFADevice' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "EnableMFADevice")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("EnableMFADevice", body)
      Core::Response.new(response)
    end

    def enable_organizations_root_credentials_management(input : AI::EnableOrganizationsRootCredentialsManagementRequest) : Core::ParsedResponse(AI::EnableOrganizationsRootCredentialsManagementResponse)
      Log.info { "performing 'EnableOrganizationsRootCredentialsManagement' operation" }
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

    def enable_organizations_root_sessions(input : AI::EnableOrganizationsRootSessionsRequest) : Core::ParsedResponse(AI::EnableOrganizationsRootSessionsResponse)
      Log.info { "performing 'EnableOrganizationsRootSessions' operation" }
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

    def generate_organizations_access_report(input : AI::GenerateOrganizationsAccessReportRequest) : Core::ParsedResponse(AI::GenerateOrganizationsAccessReportResponse)
      Log.info { "performing 'GenerateOrganizationsAccessReport' operation" }
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

    def generate_service_last_accessed_details(input : AI::GenerateServiceLastAccessedDetailsRequest) : Core::ParsedResponse(AI::GenerateServiceLastAccessedDetailsResponse)
      Log.info { "performing 'GenerateServiceLastAccessedDetails' operation" }
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

    def get_access_key_last_used(input : AI::GetAccessKeyLastUsedRequest) : Core::ParsedResponse(AI::GetAccessKeyLastUsedResponse)
      Log.info { "performing 'GetAccessKeyLastUsed' operation" }
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

    def get_account_authorization_details(input : AI::GetAccountAuthorizationDetailsRequest) : Core::ParsedResponse(AI::GetAccountAuthorizationDetailsResponse)
      Log.info { "performing 'GetAccountAuthorizationDetails' operation" }
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

    def get_account_properties(input : AI::GetAccountPropertiesRequest) : Core::ParsedResponse(AI::GetAccountPropertiesResponse)
      Log.info { "performing 'GetAccountProperties' operation" }
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

    def get_context_keys_for_custom_policy(input : AI::GetContextKeysForCustomPolicyRequest) : Core::ParsedResponse(AI::GetContextKeysForPolicyResponse)
      Log.info { "performing 'GetContextKeysForCustomPolicy' operation" }
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

    def get_context_keys_for_principal_policy(input : AI::GetContextKeysForPrincipalPolicyRequest) : Core::ParsedResponse(AI::GetContextKeysForPolicyResponse)
      Log.info { "performing 'GetContextKeysForPrincipalPolicy' operation" }
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

    def get_delegation_request(input : AI::GetDelegationRequestRequest) : Core::ParsedResponse(AI::GetDelegationRequestResponse)
      Log.info { "performing 'GetDelegationRequest' operation" }
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

    def get_group(input : AI::GetGroupRequest) : Core::ParsedResponse(AI::GetGroupResponse)
      Log.info { "performing 'GetGroup' operation" }
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

    def get_group_policy(input : AI::GetGroupPolicyRequest) : Core::ParsedResponse(AI::GetGroupPolicyResponse)
      Log.info { "performing 'GetGroupPolicy' operation" }
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

    def get_human_readable_summary(input : AI::GetHumanReadableSummaryRequest) : Core::ParsedResponse(AI::GetHumanReadableSummaryResponse)
      Log.info { "performing 'GetHumanReadableSummary' operation" }
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

    def get_instance_profile(input : AI::GetInstanceProfileRequest) : Core::ParsedResponse(AI::GetInstanceProfileResponse)
      Log.info { "performing 'GetInstanceProfile' operation" }
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

    def get_login_profile(input : AI::GetLoginProfileRequest) : Core::ParsedResponse(AI::GetLoginProfileResponse)
      Log.info { "performing 'GetLoginProfile' operation" }
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

    def get_mfa_device(input : AI::GetMFADeviceRequest) : Core::ParsedResponse(AI::GetMFADeviceResponse)
      Log.info { "performing 'GetMFADevice' operation" }
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

    def get_open_id_connect_provider(input : AI::GetOpenIDConnectProviderRequest) : Core::ParsedResponse(AI::GetOpenIDConnectProviderResponse)
      Log.info { "performing 'GetOpenIDConnectProvider' operation" }
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

    def get_organizations_access_report(input : AI::GetOrganizationsAccessReportRequest) : Core::ParsedResponse(AI::GetOrganizationsAccessReportResponse)
      Log.info { "performing 'GetOrganizationsAccessReport' operation" }
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

    def get_policy(input : AI::GetPolicyRequest) : Core::ParsedResponse(AI::GetPolicyResponse)
      Log.info { "performing 'GetPolicy' operation" }
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

    def get_policy_version(input : AI::GetPolicyVersionRequest) : Core::ParsedResponse(AI::GetPolicyVersionResponse)
      Log.info { "performing 'GetPolicyVersion' operation" }
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

    def get_role(input : AI::GetRoleRequest) : Core::ParsedResponse(AI::GetRoleResponse)
      Log.info { "performing 'GetRole' operation" }
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

    def get_role_policy(input : AI::GetRolePolicyRequest) : Core::ParsedResponse(AI::GetRolePolicyResponse)
      Log.info { "performing 'GetRolePolicy' operation" }
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

    def get_role_template_version(input : AI::GetRoleTemplateVersionRequest) : Core::ParsedResponse(AI::GetRoleTemplateVersionResponse)
      Log.info { "performing 'GetRoleTemplateVersion' operation" }
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

    def get_saml_provider(input : AI::GetSAMLProviderRequest) : Core::ParsedResponse(AI::GetSAMLProviderResponse)
      Log.info { "performing 'GetSAMLProvider' operation" }
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

    def get_server_certificate(input : AI::GetServerCertificateRequest) : Core::ParsedResponse(AI::GetServerCertificateResponse)
      Log.info { "performing 'GetServerCertificate' operation" }
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

    def get_service_last_accessed_details(input : AI::GetServiceLastAccessedDetailsRequest) : Core::ParsedResponse(AI::GetServiceLastAccessedDetailsResponse)
      Log.info { "performing 'GetServiceLastAccessedDetails' operation" }
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

    def get_service_last_accessed_details_with_entities(input : AI::GetServiceLastAccessedDetailsWithEntitiesRequest) : Core::ParsedResponse(AI::GetServiceLastAccessedDetailsWithEntitiesResponse)
      Log.info { "performing 'GetServiceLastAccessedDetailsWithEntities' operation" }
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

    def get_service_linked_role_deletion_status(input : AI::GetServiceLinkedRoleDeletionStatusRequest) : Core::ParsedResponse(AI::GetServiceLinkedRoleDeletionStatusResponse)
      Log.info { "performing 'GetServiceLinkedRoleDeletionStatus' operation" }
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

    def get_ssh_public_key(input : AI::GetSSHPublicKeyRequest) : Core::ParsedResponse(AI::GetSSHPublicKeyResponse)
      Log.info { "performing 'GetSSHPublicKey' operation" }
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

    def get_user(input : AI::GetUserRequest) : Core::ParsedResponse(AI::GetUserResponse)
      Log.info { "performing 'GetUser' operation" }
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

    def get_user_policy(input : AI::GetUserPolicyRequest) : Core::ParsedResponse(AI::GetUserPolicyResponse)
      Log.info { "performing 'GetUserPolicy' operation" }
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

    def list_access_keys(input : AI::ListAccessKeysRequest) : Core::ParsedResponse(AI::ListAccessKeysResponse)
      Log.info { "performing 'ListAccessKeys' operation" }
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

    def list_account_aliases(input : AI::ListAccountAliasesRequest) : Core::ParsedResponse(AI::ListAccountAliasesResponse)
      Log.info { "performing 'ListAccountAliases' operation" }
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

    def list_attached_group_policies(input : AI::ListAttachedGroupPoliciesRequest) : Core::ParsedResponse(AI::ListAttachedGroupPoliciesResponse)
      Log.info { "performing 'ListAttachedGroupPolicies' operation" }
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

    def list_attached_role_policies(input : AI::ListAttachedRolePoliciesRequest) : Core::ParsedResponse(AI::ListAttachedRolePoliciesResponse)
      Log.info { "performing 'ListAttachedRolePolicies' operation" }
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

    def list_attached_user_policies(input : AI::ListAttachedUserPoliciesRequest) : Core::ParsedResponse(AI::ListAttachedUserPoliciesResponse)
      Log.info { "performing 'ListAttachedUserPolicies' operation" }
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

    def list_delegation_requests(input : AI::ListDelegationRequestsRequest) : Core::ParsedResponse(AI::ListDelegationRequestsResponse)
      Log.info { "performing 'ListDelegationRequests' operation" }
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

    def list_entities_for_policy(input : AI::ListEntitiesForPolicyRequest) : Core::ParsedResponse(AI::ListEntitiesForPolicyResponse)
      Log.info { "performing 'ListEntitiesForPolicy' operation" }
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

    def list_group_policies(input : AI::ListGroupPoliciesRequest) : Core::ParsedResponse(AI::ListGroupPoliciesResponse)
      Log.info { "performing 'ListGroupPolicies' operation" }
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

    def list_groups(input : AI::ListGroupsRequest) : Core::ParsedResponse(AI::ListGroupsResponse)
      Log.info { "performing 'ListGroups' operation" }
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

    def list_groups_for_user(input : AI::ListGroupsForUserRequest) : Core::ParsedResponse(AI::ListGroupsForUserResponse)
      Log.info { "performing 'ListGroupsForUser' operation" }
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

    def list_instance_profiles(input : AI::ListInstanceProfilesRequest) : Core::ParsedResponse(AI::ListInstanceProfilesResponse)
      Log.info { "performing 'ListInstanceProfiles' operation" }
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

    def list_instance_profiles_for_role(input : AI::ListInstanceProfilesForRoleRequest) : Core::ParsedResponse(AI::ListInstanceProfilesForRoleResponse)
      Log.info { "performing 'ListInstanceProfilesForRole' operation" }
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

    def list_instance_profile_tags(input : AI::ListInstanceProfileTagsRequest) : Core::ParsedResponse(AI::ListInstanceProfileTagsResponse)
      Log.info { "performing 'ListInstanceProfileTags' operation" }
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

    def list_mfa_devices(input : AI::ListMFADevicesRequest) : Core::ParsedResponse(AI::ListMFADevicesResponse)
      Log.info { "performing 'ListMFADevices' operation" }
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

    def list_mfa_device_tags(input : AI::ListMFADeviceTagsRequest) : Core::ParsedResponse(AI::ListMFADeviceTagsResponse)
      Log.info { "performing 'ListMFADeviceTags' operation" }
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

    def list_open_id_connect_providers(input : AI::ListOpenIDConnectProvidersRequest) : Core::ParsedResponse(AI::ListOpenIDConnectProvidersResponse)
      Log.info { "performing 'ListOpenIDConnectProviders' operation" }
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

    def list_open_id_connect_provider_tags(input : AI::ListOpenIDConnectProviderTagsRequest) : Core::ParsedResponse(AI::ListOpenIDConnectProviderTagsResponse)
      Log.info { "performing 'ListOpenIDConnectProviderTags' operation" }
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

    def list_organizations_features(input : AI::ListOrganizationsFeaturesRequest) : Core::ParsedResponse(AI::ListOrganizationsFeaturesResponse)
      Log.info { "performing 'ListOrganizationsFeatures' operation" }
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

    def list_policies(input : AI::ListPoliciesRequest) : Core::ParsedResponse(AI::ListPoliciesResponse)
      Log.info { "performing 'ListPolicies' operation" }
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

    def list_policies_granting_service_access(input : AI::ListPoliciesGrantingServiceAccessRequest) : Core::ParsedResponse(AI::ListPoliciesGrantingServiceAccessResponse)
      Log.info { "performing 'ListPoliciesGrantingServiceAccess' operation" }
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

    def list_policy_tags(input : AI::ListPolicyTagsRequest) : Core::ParsedResponse(AI::ListPolicyTagsResponse)
      Log.info { "performing 'ListPolicyTags' operation" }
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

    def list_policy_versions(input : AI::ListPolicyVersionsRequest) : Core::ParsedResponse(AI::ListPolicyVersionsResponse)
      Log.info { "performing 'ListPolicyVersions' operation" }
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

    def list_role_policies(input : AI::ListRolePoliciesRequest) : Core::ParsedResponse(AI::ListRolePoliciesResponse)
      Log.info { "performing 'ListRolePolicies' operation" }
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

    def list_roles(input : AI::ListRolesRequest) : Core::ParsedResponse(AI::ListRolesResponse)
      Log.info { "performing 'ListRoles' operation" }
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

    def list_role_tags(input : AI::ListRoleTagsRequest) : Core::ParsedResponse(AI::ListRoleTagsResponse)
      Log.info { "performing 'ListRoleTags' operation" }
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

    def list_saml_providers(input : AI::ListSAMLProvidersRequest) : Core::ParsedResponse(AI::ListSAMLProvidersResponse)
      Log.info { "performing 'ListSAMLProviders' operation" }
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

    def list_saml_provider_tags(input : AI::ListSAMLProviderTagsRequest) : Core::ParsedResponse(AI::ListSAMLProviderTagsResponse)
      Log.info { "performing 'ListSAMLProviderTags' operation" }
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

    def list_server_certificates(input : AI::ListServerCertificatesRequest) : Core::ParsedResponse(AI::ListServerCertificatesResponse)
      Log.info { "performing 'ListServerCertificates' operation" }
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

    def list_server_certificate_tags(input : AI::ListServerCertificateTagsRequest) : Core::ParsedResponse(AI::ListServerCertificateTagsResponse)
      Log.info { "performing 'ListServerCertificateTags' operation" }
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

    def list_service_specific_credentials(input : AI::ListServiceSpecificCredentialsRequest) : Core::ParsedResponse(AI::ListServiceSpecificCredentialsResponse)
      Log.info { "performing 'ListServiceSpecificCredentials' operation" }
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

    def list_signing_certificates(input : AI::ListSigningCertificatesRequest) : Core::ParsedResponse(AI::ListSigningCertificatesResponse)
      Log.info { "performing 'ListSigningCertificates' operation" }
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

    def list_ssh_public_keys(input : AI::ListSSHPublicKeysRequest) : Core::ParsedResponse(AI::ListSSHPublicKeysResponse)
      Log.info { "performing 'ListSSHPublicKeys' operation" }
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

    def list_user_policies(input : AI::ListUserPoliciesRequest) : Core::ParsedResponse(AI::ListUserPoliciesResponse)
      Log.info { "performing 'ListUserPolicies' operation" }
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

    def list_users(input : AI::ListUsersRequest) : Core::ParsedResponse(AI::ListUsersResponse)
      Log.info { "performing 'ListUsers' operation" }
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

    def list_user_tags(input : AI::ListUserTagsRequest) : Core::ParsedResponse(AI::ListUserTagsResponse)
      Log.info { "performing 'ListUserTags' operation" }
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

    def list_virtual_mfa_devices(input : AI::ListVirtualMFADevicesRequest) : Core::ParsedResponse(AI::ListVirtualMFADevicesResponse)
      Log.info { "performing 'ListVirtualMFADevices' operation" }
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

    def put_account_properties(input : AI::PutAccountPropertiesRequest) : Core::ParsedResponse(AI::PutAccountPropertiesResponse)
      Log.info { "performing 'PutAccountProperties' operation" }
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

    def put_group_policy(input : AI::PutGroupPolicyRequest) : Core::Response
      Log.info { "performing 'PutGroupPolicy' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "PutGroupPolicy")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("PutGroupPolicy", body)
      Core::Response.new(response)
    end

    def put_role_permissions_boundary(input : AI::PutRolePermissionsBoundaryRequest) : Core::Response
      Log.info { "performing 'PutRolePermissionsBoundary' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "PutRolePermissionsBoundary")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("PutRolePermissionsBoundary", body)
      Core::Response.new(response)
    end

    def put_role_policy(input : AI::PutRolePolicyRequest) : Core::Response
      Log.info { "performing 'PutRolePolicy' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "PutRolePolicy")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("PutRolePolicy", body)
      Core::Response.new(response)
    end

    def put_user_permissions_boundary(input : AI::PutUserPermissionsBoundaryRequest) : Core::Response
      Log.info { "performing 'PutUserPermissionsBoundary' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "PutUserPermissionsBoundary")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("PutUserPermissionsBoundary", body)
      Core::Response.new(response)
    end

    def put_user_policy(input : AI::PutUserPolicyRequest) : Core::Response
      Log.info { "performing 'PutUserPolicy' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "PutUserPolicy")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("PutUserPolicy", body)
      Core::Response.new(response)
    end

    def reject_delegation_request(input : AI::RejectDelegationRequestRequest) : Core::Response
      Log.info { "performing 'RejectDelegationRequest' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "RejectDelegationRequest")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("RejectDelegationRequest", body)
      Core::Response.new(response)
    end

    def remove_client_id_from_open_id_connect_provider(input : AI::RemoveClientIDFromOpenIDConnectProviderRequest) : Core::Response
      Log.info { "performing 'RemoveClientIDFromOpenIDConnectProvider' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "RemoveClientIDFromOpenIDConnectProvider")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("RemoveClientIDFromOpenIDConnectProvider", body)
      Core::Response.new(response)
    end

    def remove_role_from_instance_profile(input : AI::RemoveRoleFromInstanceProfileRequest) : Core::Response
      Log.info { "performing 'RemoveRoleFromInstanceProfile' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "RemoveRoleFromInstanceProfile")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("RemoveRoleFromInstanceProfile", body)
      Core::Response.new(response)
    end

    def remove_user_from_group(input : AI::RemoveUserFromGroupRequest) : Core::Response
      Log.info { "performing 'RemoveUserFromGroup' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "RemoveUserFromGroup")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("RemoveUserFromGroup", body)
      Core::Response.new(response)
    end

    def reset_service_specific_credential(input : AI::ResetServiceSpecificCredentialRequest) : Core::ParsedResponse(AI::ResetServiceSpecificCredentialResponse)
      Log.info { "performing 'ResetServiceSpecificCredential' operation" }
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

    def resync_mfa_device(input : AI::ResyncMFADeviceRequest) : Core::Response
      Log.info { "performing 'ResyncMFADevice' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ResyncMFADevice")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ResyncMFADevice", body)
      Core::Response.new(response)
    end

    def send_delegation_token(input : AI::SendDelegationTokenRequest) : Core::Response
      Log.info { "performing 'SendDelegationToken' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "SendDelegationToken")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("SendDelegationToken", body)
      Core::Response.new(response)
    end

    def set_default_policy_version(input : AI::SetDefaultPolicyVersionRequest) : Core::Response
      Log.info { "performing 'SetDefaultPolicyVersion' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "SetDefaultPolicyVersion")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("SetDefaultPolicyVersion", body)
      Core::Response.new(response)
    end

    def set_security_token_service_preferences(input : AI::SetSecurityTokenServicePreferencesRequest) : Core::Response
      Log.info { "performing 'SetSecurityTokenServicePreferences' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "SetSecurityTokenServicePreferences")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("SetSecurityTokenServicePreferences", body)
      Core::Response.new(response)
    end

    def simulate_custom_policy(input : AI::SimulateCustomPolicyRequest) : Core::ParsedResponse(AI::SimulatePolicyResponse)
      Log.info { "performing 'SimulateCustomPolicy' operation" }
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

    def simulate_principal_policy(input : AI::SimulatePrincipalPolicyRequest) : Core::ParsedResponse(AI::SimulatePolicyResponse)
      Log.info { "performing 'SimulatePrincipalPolicy' operation" }
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

    def tag_instance_profile(input : AI::TagInstanceProfileRequest) : Core::Response
      Log.info { "performing 'TagInstanceProfile' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "TagInstanceProfile")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("TagInstanceProfile", body)
      Core::Response.new(response)
    end

    def tag_mfa_device(input : AI::TagMFADeviceRequest) : Core::Response
      Log.info { "performing 'TagMFADevice' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "TagMFADevice")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("TagMFADevice", body)
      Core::Response.new(response)
    end

    def tag_open_id_connect_provider(input : AI::TagOpenIDConnectProviderRequest) : Core::Response
      Log.info { "performing 'TagOpenIDConnectProvider' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "TagOpenIDConnectProvider")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("TagOpenIDConnectProvider", body)
      Core::Response.new(response)
    end

    def tag_policy(input : AI::TagPolicyRequest) : Core::Response
      Log.info { "performing 'TagPolicy' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "TagPolicy")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("TagPolicy", body)
      Core::Response.new(response)
    end

    def tag_role(input : AI::TagRoleRequest) : Core::Response
      Log.info { "performing 'TagRole' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "TagRole")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("TagRole", body)
      Core::Response.new(response)
    end

    def tag_saml_provider(input : AI::TagSAMLProviderRequest) : Core::Response
      Log.info { "performing 'TagSAMLProvider' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "TagSAMLProvider")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("TagSAMLProvider", body)
      Core::Response.new(response)
    end

    def tag_server_certificate(input : AI::TagServerCertificateRequest) : Core::Response
      Log.info { "performing 'TagServerCertificate' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "TagServerCertificate")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("TagServerCertificate", body)
      Core::Response.new(response)
    end

    def tag_user(input : AI::TagUserRequest) : Core::Response
      Log.info { "performing 'TagUser' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "TagUser")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("TagUser", body)
      Core::Response.new(response)
    end

    def untag_instance_profile(input : AI::UntagInstanceProfileRequest) : Core::Response
      Log.info { "performing 'UntagInstanceProfile' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UntagInstanceProfile")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UntagInstanceProfile", body)
      Core::Response.new(response)
    end

    def untag_mfa_device(input : AI::UntagMFADeviceRequest) : Core::Response
      Log.info { "performing 'UntagMFADevice' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UntagMFADevice")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UntagMFADevice", body)
      Core::Response.new(response)
    end

    def untag_open_id_connect_provider(input : AI::UntagOpenIDConnectProviderRequest) : Core::Response
      Log.info { "performing 'UntagOpenIDConnectProvider' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UntagOpenIDConnectProvider")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UntagOpenIDConnectProvider", body)
      Core::Response.new(response)
    end

    def untag_policy(input : AI::UntagPolicyRequest) : Core::Response
      Log.info { "performing 'UntagPolicy' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UntagPolicy")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UntagPolicy", body)
      Core::Response.new(response)
    end

    def untag_role(input : AI::UntagRoleRequest) : Core::Response
      Log.info { "performing 'UntagRole' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UntagRole")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UntagRole", body)
      Core::Response.new(response)
    end

    def untag_saml_provider(input : AI::UntagSAMLProviderRequest) : Core::Response
      Log.info { "performing 'UntagSAMLProvider' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UntagSAMLProvider")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UntagSAMLProvider", body)
      Core::Response.new(response)
    end

    def untag_server_certificate(input : AI::UntagServerCertificateRequest) : Core::Response
      Log.info { "performing 'UntagServerCertificate' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UntagServerCertificate")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UntagServerCertificate", body)
      Core::Response.new(response)
    end

    def untag_user(input : AI::UntagUserRequest) : Core::Response
      Log.info { "performing 'UntagUser' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UntagUser")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UntagUser", body)
      Core::Response.new(response)
    end

    def update_access_key(input : AI::UpdateAccessKeyRequest) : Core::Response
      Log.info { "performing 'UpdateAccessKey' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UpdateAccessKey")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UpdateAccessKey", body)
      Core::Response.new(response)
    end

    def update_account_password_policy(input : AI::UpdateAccountPasswordPolicyRequest) : Core::Response
      Log.info { "performing 'UpdateAccountPasswordPolicy' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UpdateAccountPasswordPolicy")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UpdateAccountPasswordPolicy", body)
      Core::Response.new(response)
    end

    def update_assume_role_policy(input : AI::UpdateAssumeRolePolicyRequest) : Core::Response
      Log.info { "performing 'UpdateAssumeRolePolicy' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UpdateAssumeRolePolicy")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UpdateAssumeRolePolicy", body)
      Core::Response.new(response)
    end

    def update_delegation_request(input : AI::UpdateDelegationRequestRequest) : Core::Response
      Log.info { "performing 'UpdateDelegationRequest' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UpdateDelegationRequest")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UpdateDelegationRequest", body)
      Core::Response.new(response)
    end

    def update_group(input : AI::UpdateGroupRequest) : Core::Response
      Log.info { "performing 'UpdateGroup' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UpdateGroup")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UpdateGroup", body)
      Core::Response.new(response)
    end

    def update_login_profile(input : AI::UpdateLoginProfileRequest) : Core::Response
      Log.info { "performing 'UpdateLoginProfile' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UpdateLoginProfile")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UpdateLoginProfile", body)
      Core::Response.new(response)
    end

    def update_open_id_connect_provider_thumbprint(input : AI::UpdateOpenIDConnectProviderThumbprintRequest) : Core::Response
      Log.info { "performing 'UpdateOpenIDConnectProviderThumbprint' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UpdateOpenIDConnectProviderThumbprint")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UpdateOpenIDConnectProviderThumbprint", body)
      Core::Response.new(response)
    end

    def update_role(input : AI::UpdateRoleRequest) : Core::ParsedResponse(AI::UpdateRoleResponse)
      Log.info { "performing 'UpdateRole' operation" }
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

    def update_role_description(input : AI::UpdateRoleDescriptionRequest) : Core::ParsedResponse(AI::UpdateRoleDescriptionResponse)
      Log.info { "performing 'UpdateRoleDescription' operation" }
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

    def update_saml_provider(input : AI::UpdateSAMLProviderRequest) : Core::ParsedResponse(AI::UpdateSAMLProviderResponse)
      Log.info { "performing 'UpdateSAMLProvider' operation" }
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

    def update_server_certificate(input : AI::UpdateServerCertificateRequest) : Core::Response
      Log.info { "performing 'UpdateServerCertificate' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UpdateServerCertificate")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UpdateServerCertificate", body)
      Core::Response.new(response)
    end

    def update_service_specific_credential(input : AI::UpdateServiceSpecificCredentialRequest) : Core::Response
      Log.info { "performing 'UpdateServiceSpecificCredential' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UpdateServiceSpecificCredential")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UpdateServiceSpecificCredential", body)
      Core::Response.new(response)
    end

    def update_signing_certificate(input : AI::UpdateSigningCertificateRequest) : Core::Response
      Log.info { "performing 'UpdateSigningCertificate' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UpdateSigningCertificate")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UpdateSigningCertificate", body)
      Core::Response.new(response)
    end

    def update_ssh_public_key(input : AI::UpdateSSHPublicKeyRequest) : Core::Response
      Log.info { "performing 'UpdateSSHPublicKey' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UpdateSSHPublicKey")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UpdateSSHPublicKey", body)
      Core::Response.new(response)
    end

    def update_user(input : AI::UpdateUserRequest) : Core::Response
      Log.info { "performing 'UpdateUser' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UpdateUser")
        form.add("Version", "2010-05-08")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UpdateUser", body)
      Core::Response.new(response)
    end

    def upload_server_certificate(input : AI::UploadServerCertificateRequest) : Core::ParsedResponse(AI::UploadServerCertificateResponse)
      Log.info { "performing 'UploadServerCertificate' operation" }
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

    def upload_signing_certificate(input : AI::UploadSigningCertificateRequest) : Core::ParsedResponse(AI::UploadSigningCertificateResponse)
      Log.info { "performing 'UploadSigningCertificate' operation" }
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

    def upload_ssh_public_key(input : AI::UploadSSHPublicKeyRequest) : Core::ParsedResponse(AI::UploadSSHPublicKeyResponse)
      Log.info { "performing 'UploadSSHPublicKey' operation" }
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
