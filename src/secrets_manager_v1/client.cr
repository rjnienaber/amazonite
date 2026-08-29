private alias ASM = Amazonite::SecretsManagerV1
private alias Core = Amazonite::Core

module Amazonite::SecretsManagerV1
  class Client < Core::Client
    Log               = ::Log.for("amazonite.secrets_manager_v1.client")
    EXCEPTION_FACTORY = ExceptionFactory.new

    def initialize(config = Core::Config.new)
      super("secretsmanager", "secretsmanager", "1.1", EXCEPTION_FACTORY, config)
    end

    def batch_get_secret_value(input : ASM::BatchGetSecretValueRequest) : Core::ParsedResponse(ASM::BatchGetSecretValueResponse)
      Log.info { "performing 'BatchGetSecretValue' operation" }
      response = post("BatchGetSecretValue", "/", input.to_json)
      Core::ParsedResponse(ASM::BatchGetSecretValueResponse).new(response)
    end

    def cancel_rotate_secret(input : ASM::CancelRotateSecretRequest) : Core::ParsedResponse(ASM::CancelRotateSecretResponse)
      Log.info { "performing 'CancelRotateSecret' operation" }
      response = post("CancelRotateSecret", "/", input.to_json)
      Core::ParsedResponse(ASM::CancelRotateSecretResponse).new(response)
    end

    def create_secret(input : ASM::CreateSecretRequest) : Core::ParsedResponse(ASM::CreateSecretResponse)
      Log.info { "performing 'CreateSecret' operation" }
      response = post("CreateSecret", "/", input.to_json)
      Core::ParsedResponse(ASM::CreateSecretResponse).new(response)
    end

    def delete_resource_policy(input : ASM::DeleteResourcePolicyRequest) : Core::ParsedResponse(ASM::DeleteResourcePolicyResponse)
      Log.info { "performing 'DeleteResourcePolicy' operation" }
      response = post("DeleteResourcePolicy", "/", input.to_json)
      Core::ParsedResponse(ASM::DeleteResourcePolicyResponse).new(response)
    end

    def delete_secret(input : ASM::DeleteSecretRequest) : Core::ParsedResponse(ASM::DeleteSecretResponse)
      Log.info { "performing 'DeleteSecret' operation" }
      response = post("DeleteSecret", "/", input.to_json)
      Core::ParsedResponse(ASM::DeleteSecretResponse).new(response)
    end

    def describe_secret(input : ASM::DescribeSecretRequest) : Core::ParsedResponse(ASM::DescribeSecretResponse)
      Log.info { "performing 'DescribeSecret' operation" }
      response = post("DescribeSecret", "/", input.to_json)
      Core::ParsedResponse(ASM::DescribeSecretResponse).new(response)
    end

    def get_random_password(input : ASM::GetRandomPasswordRequest) : Core::ParsedResponse(ASM::GetRandomPasswordResponse)
      Log.info { "performing 'GetRandomPassword' operation" }
      response = post("GetRandomPassword", "/", input.to_json)
      Core::ParsedResponse(ASM::GetRandomPasswordResponse).new(response)
    end

    def get_resource_policy(input : ASM::GetResourcePolicyRequest) : Core::ParsedResponse(ASM::GetResourcePolicyResponse)
      Log.info { "performing 'GetResourcePolicy' operation" }
      response = post("GetResourcePolicy", "/", input.to_json)
      Core::ParsedResponse(ASM::GetResourcePolicyResponse).new(response)
    end

    def get_secret_value(input : ASM::GetSecretValueRequest) : Core::ParsedResponse(ASM::GetSecretValueResponse)
      Log.info { "performing 'GetSecretValue' operation" }
      response = post("GetSecretValue", "/", input.to_json)
      Core::ParsedResponse(ASM::GetSecretValueResponse).new(response)
    end

    def list_secrets(input : ASM::ListSecretsRequest) : Core::ParsedResponse(ASM::ListSecretsResponse)
      Log.info { "performing 'ListSecrets' operation" }
      response = post("ListSecrets", "/", input.to_json)
      Core::ParsedResponse(ASM::ListSecretsResponse).new(response)
    end

    def list_secret_version_ids(input : ASM::ListSecretVersionIdsRequest) : Core::ParsedResponse(ASM::ListSecretVersionIdsResponse)
      Log.info { "performing 'ListSecretVersionIds' operation" }
      response = post("ListSecretVersionIds", "/", input.to_json)
      Core::ParsedResponse(ASM::ListSecretVersionIdsResponse).new(response)
    end

    def put_resource_policy(input : ASM::PutResourcePolicyRequest) : Core::ParsedResponse(ASM::PutResourcePolicyResponse)
      Log.info { "performing 'PutResourcePolicy' operation" }
      response = post("PutResourcePolicy", "/", input.to_json)
      Core::ParsedResponse(ASM::PutResourcePolicyResponse).new(response)
    end

    def put_secret_value(input : ASM::PutSecretValueRequest) : Core::ParsedResponse(ASM::PutSecretValueResponse)
      Log.info { "performing 'PutSecretValue' operation" }
      response = post("PutSecretValue", "/", input.to_json)
      Core::ParsedResponse(ASM::PutSecretValueResponse).new(response)
    end

    def remove_regions_from_replication(input : ASM::RemoveRegionsFromReplicationRequest) : Core::ParsedResponse(ASM::RemoveRegionsFromReplicationResponse)
      Log.info { "performing 'RemoveRegionsFromReplication' operation" }
      response = post("RemoveRegionsFromReplication", "/", input.to_json)
      Core::ParsedResponse(ASM::RemoveRegionsFromReplicationResponse).new(response)
    end

    def replicate_secret_to_regions(input : ASM::ReplicateSecretToRegionsRequest) : Core::ParsedResponse(ASM::ReplicateSecretToRegionsResponse)
      Log.info { "performing 'ReplicateSecretToRegions' operation" }
      response = post("ReplicateSecretToRegions", "/", input.to_json)
      Core::ParsedResponse(ASM::ReplicateSecretToRegionsResponse).new(response)
    end

    def restore_secret(input : ASM::RestoreSecretRequest) : Core::ParsedResponse(ASM::RestoreSecretResponse)
      Log.info { "performing 'RestoreSecret' operation" }
      response = post("RestoreSecret", "/", input.to_json)
      Core::ParsedResponse(ASM::RestoreSecretResponse).new(response)
    end

    def rotate_secret(input : ASM::RotateSecretRequest) : Core::ParsedResponse(ASM::RotateSecretResponse)
      Log.info { "performing 'RotateSecret' operation" }
      response = post("RotateSecret", "/", input.to_json)
      Core::ParsedResponse(ASM::RotateSecretResponse).new(response)
    end

    def stop_replication_to_replica(input : ASM::StopReplicationToReplicaRequest) : Core::ParsedResponse(ASM::StopReplicationToReplicaResponse)
      Log.info { "performing 'StopReplicationToReplica' operation" }
      response = post("StopReplicationToReplica", "/", input.to_json)
      Core::ParsedResponse(ASM::StopReplicationToReplicaResponse).new(response)
    end

    def tag_resource(input : ASM::TagResourceRequest) : Core::Response
      Log.info { "performing 'TagResource' operation" }
      response = post("TagResource", "/", input.to_json)
      Core::Response.new(response)
    end

    def untag_resource(input : ASM::UntagResourceRequest) : Core::Response
      Log.info { "performing 'UntagResource' operation" }
      response = post("UntagResource", "/", input.to_json)
      Core::Response.new(response)
    end

    def update_secret(input : ASM::UpdateSecretRequest) : Core::ParsedResponse(ASM::UpdateSecretResponse)
      Log.info { "performing 'UpdateSecret' operation" }
      response = post("UpdateSecret", "/", input.to_json)
      Core::ParsedResponse(ASM::UpdateSecretResponse).new(response)
    end

    def update_secret_version_stage(input : ASM::UpdateSecretVersionStageRequest) : Core::ParsedResponse(ASM::UpdateSecretVersionStageResponse)
      Log.info { "performing 'UpdateSecretVersionStage' operation" }
      response = post("UpdateSecretVersionStage", "/", input.to_json)
      Core::ParsedResponse(ASM::UpdateSecretVersionStageResponse).new(response)
    end

    def validate_resource_policy(input : ASM::ValidateResourcePolicyRequest) : Core::ParsedResponse(ASM::ValidateResourcePolicyResponse)
      Log.info { "performing 'ValidateResourcePolicy' operation" }
      response = post("ValidateResourcePolicy", "/", input.to_json)
      Core::ParsedResponse(ASM::ValidateResourcePolicyResponse).new(response)
    end
  end
end
