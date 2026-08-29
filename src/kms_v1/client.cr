private alias AK = Amazonite::KmsV1
private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class Client < Core::Client
    Log               = ::Log.for("amazonite.kms_v1.client")
    EXCEPTION_FACTORY = ExceptionFactory.new

    def initialize(config = Core::Config.new)
      super("TrentService", "kms", "1.1", EXCEPTION_FACTORY, config)
    end

    def cancel_key_deletion(input : AK::CancelKeyDeletionRequest) : Core::ParsedResponse(AK::CancelKeyDeletionResponse)
      Log.info { "performing 'CancelKeyDeletion' operation" }
      response = post("CancelKeyDeletion", "/", input.to_json)
      Core::ParsedResponse(AK::CancelKeyDeletionResponse).new(response)
    end

    def connect_custom_key_store(input : AK::ConnectCustomKeyStoreRequest) : Core::ParsedResponse(AK::ConnectCustomKeyStoreResponse)
      Log.info { "performing 'ConnectCustomKeyStore' operation" }
      response = post("ConnectCustomKeyStore", "/", input.to_json)
      Core::ParsedResponse(AK::ConnectCustomKeyStoreResponse).new(response)
    end

    def create_alias(input : AK::CreateAliasRequest) : Core::Response
      Log.info { "performing 'CreateAlias' operation" }
      response = post("CreateAlias", "/", input.to_json)
      Core::Response.new(response)
    end

    def create_custom_key_store(input : AK::CreateCustomKeyStoreRequest) : Core::ParsedResponse(AK::CreateCustomKeyStoreResponse)
      Log.info { "performing 'CreateCustomKeyStore' operation" }
      response = post("CreateCustomKeyStore", "/", input.to_json)
      Core::ParsedResponse(AK::CreateCustomKeyStoreResponse).new(response)
    end

    def create_grant(input : AK::CreateGrantRequest) : Core::ParsedResponse(AK::CreateGrantResponse)
      Log.info { "performing 'CreateGrant' operation" }
      response = post("CreateGrant", "/", input.to_json)
      Core::ParsedResponse(AK::CreateGrantResponse).new(response)
    end

    def create_key(input : AK::CreateKeyRequest) : Core::ParsedResponse(AK::CreateKeyResponse)
      Log.info { "performing 'CreateKey' operation" }
      response = post("CreateKey", "/", input.to_json)
      Core::ParsedResponse(AK::CreateKeyResponse).new(response)
    end

    def decrypt(input : AK::DecryptRequest) : Core::ParsedResponse(AK::DecryptResponse)
      Log.info { "performing 'Decrypt' operation" }
      response = post("Decrypt", "/", input.to_json)
      Core::ParsedResponse(AK::DecryptResponse).new(response)
    end

    def delete_alias(input : AK::DeleteAliasRequest) : Core::Response
      Log.info { "performing 'DeleteAlias' operation" }
      response = post("DeleteAlias", "/", input.to_json)
      Core::Response.new(response)
    end

    def delete_custom_key_store(input : AK::DeleteCustomKeyStoreRequest) : Core::ParsedResponse(AK::DeleteCustomKeyStoreResponse)
      Log.info { "performing 'DeleteCustomKeyStore' operation" }
      response = post("DeleteCustomKeyStore", "/", input.to_json)
      Core::ParsedResponse(AK::DeleteCustomKeyStoreResponse).new(response)
    end

    def delete_imported_key_material(input : AK::DeleteImportedKeyMaterialRequest) : Core::ParsedResponse(AK::DeleteImportedKeyMaterialResponse)
      Log.info { "performing 'DeleteImportedKeyMaterial' operation" }
      response = post("DeleteImportedKeyMaterial", "/", input.to_json)
      Core::ParsedResponse(AK::DeleteImportedKeyMaterialResponse).new(response)
    end

    def derive_shared_secret(input : AK::DeriveSharedSecretRequest) : Core::ParsedResponse(AK::DeriveSharedSecretResponse)
      Log.info { "performing 'DeriveSharedSecret' operation" }
      response = post("DeriveSharedSecret", "/", input.to_json)
      Core::ParsedResponse(AK::DeriveSharedSecretResponse).new(response)
    end

    def describe_custom_key_stores(input : AK::DescribeCustomKeyStoresRequest) : Core::ParsedResponse(AK::DescribeCustomKeyStoresResponse)
      Log.info { "performing 'DescribeCustomKeyStores' operation" }
      response = post("DescribeCustomKeyStores", "/", input.to_json)
      Core::ParsedResponse(AK::DescribeCustomKeyStoresResponse).new(response)
    end

    def describe_key(input : AK::DescribeKeyRequest) : Core::ParsedResponse(AK::DescribeKeyResponse)
      Log.info { "performing 'DescribeKey' operation" }
      response = post("DescribeKey", "/", input.to_json)
      Core::ParsedResponse(AK::DescribeKeyResponse).new(response)
    end

    def disable_key(input : AK::DisableKeyRequest) : Core::Response
      Log.info { "performing 'DisableKey' operation" }
      response = post("DisableKey", "/", input.to_json)
      Core::Response.new(response)
    end

    def disable_key_rotation(input : AK::DisableKeyRotationRequest) : Core::Response
      Log.info { "performing 'DisableKeyRotation' operation" }
      response = post("DisableKeyRotation", "/", input.to_json)
      Core::Response.new(response)
    end

    def disconnect_custom_key_store(input : AK::DisconnectCustomKeyStoreRequest) : Core::ParsedResponse(AK::DisconnectCustomKeyStoreResponse)
      Log.info { "performing 'DisconnectCustomKeyStore' operation" }
      response = post("DisconnectCustomKeyStore", "/", input.to_json)
      Core::ParsedResponse(AK::DisconnectCustomKeyStoreResponse).new(response)
    end

    def enable_key(input : AK::EnableKeyRequest) : Core::Response
      Log.info { "performing 'EnableKey' operation" }
      response = post("EnableKey", "/", input.to_json)
      Core::Response.new(response)
    end

    def enable_key_rotation(input : AK::EnableKeyRotationRequest) : Core::Response
      Log.info { "performing 'EnableKeyRotation' operation" }
      response = post("EnableKeyRotation", "/", input.to_json)
      Core::Response.new(response)
    end

    def encrypt(input : AK::EncryptRequest) : Core::ParsedResponse(AK::EncryptResponse)
      Log.info { "performing 'Encrypt' operation" }
      response = post("Encrypt", "/", input.to_json)
      Core::ParsedResponse(AK::EncryptResponse).new(response)
    end

    def generate_data_key(input : AK::GenerateDataKeyRequest) : Core::ParsedResponse(AK::GenerateDataKeyResponse)
      Log.info { "performing 'GenerateDataKey' operation" }
      response = post("GenerateDataKey", "/", input.to_json)
      Core::ParsedResponse(AK::GenerateDataKeyResponse).new(response)
    end

    def generate_data_key_pair(input : AK::GenerateDataKeyPairRequest) : Core::ParsedResponse(AK::GenerateDataKeyPairResponse)
      Log.info { "performing 'GenerateDataKeyPair' operation" }
      response = post("GenerateDataKeyPair", "/", input.to_json)
      Core::ParsedResponse(AK::GenerateDataKeyPairResponse).new(response)
    end

    def generate_data_key_pair_without_plaintext(input : AK::GenerateDataKeyPairWithoutPlaintextRequest) : Core::ParsedResponse(AK::GenerateDataKeyPairWithoutPlaintextResponse)
      Log.info { "performing 'GenerateDataKeyPairWithoutPlaintext' operation" }
      response = post("GenerateDataKeyPairWithoutPlaintext", "/", input.to_json)
      Core::ParsedResponse(AK::GenerateDataKeyPairWithoutPlaintextResponse).new(response)
    end

    def generate_data_key_without_plaintext(input : AK::GenerateDataKeyWithoutPlaintextRequest) : Core::ParsedResponse(AK::GenerateDataKeyWithoutPlaintextResponse)
      Log.info { "performing 'GenerateDataKeyWithoutPlaintext' operation" }
      response = post("GenerateDataKeyWithoutPlaintext", "/", input.to_json)
      Core::ParsedResponse(AK::GenerateDataKeyWithoutPlaintextResponse).new(response)
    end

    def generate_mac(input : AK::GenerateMacRequest) : Core::ParsedResponse(AK::GenerateMacResponse)
      Log.info { "performing 'GenerateMac' operation" }
      response = post("GenerateMac", "/", input.to_json)
      Core::ParsedResponse(AK::GenerateMacResponse).new(response)
    end

    def generate_random(input : AK::GenerateRandomRequest) : Core::ParsedResponse(AK::GenerateRandomResponse)
      Log.info { "performing 'GenerateRandom' operation" }
      response = post("GenerateRandom", "/", input.to_json)
      Core::ParsedResponse(AK::GenerateRandomResponse).new(response)
    end

    def get_key_last_usage(input : AK::GetKeyLastUsageRequest) : Core::ParsedResponse(AK::GetKeyLastUsageResponse)
      Log.info { "performing 'GetKeyLastUsage' operation" }
      response = post("GetKeyLastUsage", "/", input.to_json)
      Core::ParsedResponse(AK::GetKeyLastUsageResponse).new(response)
    end

    def get_key_policy(input : AK::GetKeyPolicyRequest) : Core::ParsedResponse(AK::GetKeyPolicyResponse)
      Log.info { "performing 'GetKeyPolicy' operation" }
      response = post("GetKeyPolicy", "/", input.to_json)
      Core::ParsedResponse(AK::GetKeyPolicyResponse).new(response)
    end

    def get_key_rotation_status(input : AK::GetKeyRotationStatusRequest) : Core::ParsedResponse(AK::GetKeyRotationStatusResponse)
      Log.info { "performing 'GetKeyRotationStatus' operation" }
      response = post("GetKeyRotationStatus", "/", input.to_json)
      Core::ParsedResponse(AK::GetKeyRotationStatusResponse).new(response)
    end

    def get_parameters_for_import(input : AK::GetParametersForImportRequest) : Core::ParsedResponse(AK::GetParametersForImportResponse)
      Log.info { "performing 'GetParametersForImport' operation" }
      response = post("GetParametersForImport", "/", input.to_json)
      Core::ParsedResponse(AK::GetParametersForImportResponse).new(response)
    end

    def get_public_key(input : AK::GetPublicKeyRequest) : Core::ParsedResponse(AK::GetPublicKeyResponse)
      Log.info { "performing 'GetPublicKey' operation" }
      response = post("GetPublicKey", "/", input.to_json)
      Core::ParsedResponse(AK::GetPublicKeyResponse).new(response)
    end

    def import_key_material(input : AK::ImportKeyMaterialRequest) : Core::ParsedResponse(AK::ImportKeyMaterialResponse)
      Log.info { "performing 'ImportKeyMaterial' operation" }
      response = post("ImportKeyMaterial", "/", input.to_json)
      Core::ParsedResponse(AK::ImportKeyMaterialResponse).new(response)
    end

    def list_aliases(input : AK::ListAliasesRequest) : Core::ParsedResponse(AK::ListAliasesResponse)
      Log.info { "performing 'ListAliases' operation" }
      response = post("ListAliases", "/", input.to_json)
      Core::ParsedResponse(AK::ListAliasesResponse).new(response)
    end

    def list_grants(input : AK::ListGrantsRequest) : Core::ParsedResponse(AK::ListGrantsResponse)
      Log.info { "performing 'ListGrants' operation" }
      response = post("ListGrants", "/", input.to_json)
      Core::ParsedResponse(AK::ListGrantsResponse).new(response)
    end

    def list_key_policies(input : AK::ListKeyPoliciesRequest) : Core::ParsedResponse(AK::ListKeyPoliciesResponse)
      Log.info { "performing 'ListKeyPolicies' operation" }
      response = post("ListKeyPolicies", "/", input.to_json)
      Core::ParsedResponse(AK::ListKeyPoliciesResponse).new(response)
    end

    def list_key_rotations(input : AK::ListKeyRotationsRequest) : Core::ParsedResponse(AK::ListKeyRotationsResponse)
      Log.info { "performing 'ListKeyRotations' operation" }
      response = post("ListKeyRotations", "/", input.to_json)
      Core::ParsedResponse(AK::ListKeyRotationsResponse).new(response)
    end

    def list_keys(input : AK::ListKeysRequest) : Core::ParsedResponse(AK::ListKeysResponse)
      Log.info { "performing 'ListKeys' operation" }
      response = post("ListKeys", "/", input.to_json)
      Core::ParsedResponse(AK::ListKeysResponse).new(response)
    end

    def list_resource_tags(input : AK::ListResourceTagsRequest) : Core::ParsedResponse(AK::ListResourceTagsResponse)
      Log.info { "performing 'ListResourceTags' operation" }
      response = post("ListResourceTags", "/", input.to_json)
      Core::ParsedResponse(AK::ListResourceTagsResponse).new(response)
    end

    def list_retirable_grants(input : AK::ListRetirableGrantsRequest) : Core::ParsedResponse(AK::ListGrantsResponse)
      Log.info { "performing 'ListRetirableGrants' operation" }
      response = post("ListRetirableGrants", "/", input.to_json)
      Core::ParsedResponse(AK::ListGrantsResponse).new(response)
    end

    def put_key_policy(input : AK::PutKeyPolicyRequest) : Core::Response
      Log.info { "performing 'PutKeyPolicy' operation" }
      response = post("PutKeyPolicy", "/", input.to_json)
      Core::Response.new(response)
    end

    def re_encrypt(input : AK::ReEncryptRequest) : Core::ParsedResponse(AK::ReEncryptResponse)
      Log.info { "performing 'ReEncrypt' operation" }
      response = post("ReEncrypt", "/", input.to_json)
      Core::ParsedResponse(AK::ReEncryptResponse).new(response)
    end

    def replicate_key(input : AK::ReplicateKeyRequest) : Core::ParsedResponse(AK::ReplicateKeyResponse)
      Log.info { "performing 'ReplicateKey' operation" }
      response = post("ReplicateKey", "/", input.to_json)
      Core::ParsedResponse(AK::ReplicateKeyResponse).new(response)
    end

    def retire_grant(input : AK::RetireGrantRequest) : Core::Response
      Log.info { "performing 'RetireGrant' operation" }
      response = post("RetireGrant", "/", input.to_json)
      Core::Response.new(response)
    end

    def revoke_grant(input : AK::RevokeGrantRequest) : Core::Response
      Log.info { "performing 'RevokeGrant' operation" }
      response = post("RevokeGrant", "/", input.to_json)
      Core::Response.new(response)
    end

    def rotate_key_on_demand(input : AK::RotateKeyOnDemandRequest) : Core::ParsedResponse(AK::RotateKeyOnDemandResponse)
      Log.info { "performing 'RotateKeyOnDemand' operation" }
      response = post("RotateKeyOnDemand", "/", input.to_json)
      Core::ParsedResponse(AK::RotateKeyOnDemandResponse).new(response)
    end

    def schedule_key_deletion(input : AK::ScheduleKeyDeletionRequest) : Core::ParsedResponse(AK::ScheduleKeyDeletionResponse)
      Log.info { "performing 'ScheduleKeyDeletion' operation" }
      response = post("ScheduleKeyDeletion", "/", input.to_json)
      Core::ParsedResponse(AK::ScheduleKeyDeletionResponse).new(response)
    end

    def sign(input : AK::SignRequest) : Core::ParsedResponse(AK::SignResponse)
      Log.info { "performing 'Sign' operation" }
      response = post("Sign", "/", input.to_json)
      Core::ParsedResponse(AK::SignResponse).new(response)
    end

    def tag_resource(input : AK::TagResourceRequest) : Core::Response
      Log.info { "performing 'TagResource' operation" }
      response = post("TagResource", "/", input.to_json)
      Core::Response.new(response)
    end

    def untag_resource(input : AK::UntagResourceRequest) : Core::Response
      Log.info { "performing 'UntagResource' operation" }
      response = post("UntagResource", "/", input.to_json)
      Core::Response.new(response)
    end

    def update_alias(input : AK::UpdateAliasRequest) : Core::Response
      Log.info { "performing 'UpdateAlias' operation" }
      response = post("UpdateAlias", "/", input.to_json)
      Core::Response.new(response)
    end

    def update_custom_key_store(input : AK::UpdateCustomKeyStoreRequest) : Core::ParsedResponse(AK::UpdateCustomKeyStoreResponse)
      Log.info { "performing 'UpdateCustomKeyStore' operation" }
      response = post("UpdateCustomKeyStore", "/", input.to_json)
      Core::ParsedResponse(AK::UpdateCustomKeyStoreResponse).new(response)
    end

    def update_key_description(input : AK::UpdateKeyDescriptionRequest) : Core::Response
      Log.info { "performing 'UpdateKeyDescription' operation" }
      response = post("UpdateKeyDescription", "/", input.to_json)
      Core::Response.new(response)
    end

    def update_primary_region(input : AK::UpdatePrimaryRegionRequest) : Core::Response
      Log.info { "performing 'UpdatePrimaryRegion' operation" }
      response = post("UpdatePrimaryRegion", "/", input.to_json)
      Core::Response.new(response)
    end

    def verify(input : AK::VerifyRequest) : Core::ParsedResponse(AK::VerifyResponse)
      Log.info { "performing 'Verify' operation" }
      response = post("Verify", "/", input.to_json)
      Core::ParsedResponse(AK::VerifyResponse).new(response)
    end

    def verify_mac(input : AK::VerifyMacRequest) : Core::ParsedResponse(AK::VerifyMacResponse)
      Log.info { "performing 'VerifyMac' operation" }
      response = post("VerifyMac", "/", input.to_json)
      Core::ParsedResponse(AK::VerifyMacResponse).new(response)
    end
  end
end
