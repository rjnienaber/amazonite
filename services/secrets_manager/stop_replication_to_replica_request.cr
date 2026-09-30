private alias Core = Amazonite::Core

module Amazonite::SecretsManager
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

    def validate! : Nil
      if value = @secret_id
        raise Core::ValidationError.new("SecretId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("SecretId length must be <= 2048") if value.size > 2048
      end
    end

    def_equals_and_hash(@secret_id)
  end
end
