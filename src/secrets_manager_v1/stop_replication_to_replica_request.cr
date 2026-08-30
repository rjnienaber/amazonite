module Amazonite::SecretsManagerV1
  class StopReplicationToReplicaRequest
    include JSON::Serializable

    # The name of the secret or the replica ARN. The replica ARN is the same as the original primary
    # secret ARN expect the Region is changed to the replica Region.
    @[JSON::Field(key: "SecretId")]
    property secret_id : String

    def initialize(
      @secret_id : String,
    )
    end

    def_equals_and_hash(@secret_id)
  end
end
