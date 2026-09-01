private alias Core = Amazonite::Core

module Amazonite::SecretsManager
  class RemoveRegionsFromReplicationRequest
    include JSON::Serializable

    # The ARN or name of the secret.
    @[JSON::Field(key: "SecretId")]
    property secret_id : String

    # The Regions of the replicas to remove.
    @[JSON::Field(key: "RemoveReplicaRegions")]
    property remove_replica_regions : Array(String) = [] of String

    def initialize(
      @secret_id : String,
      @remove_replica_regions : Array(String),
    )
    end

    def validate! : Nil
      if value = @secret_id
        raise Core::ValidationError.new("SecretId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("SecretId length must be <= 2048") if value.size > 2048
      end

      if value = @remove_replica_regions
        raise Core::ValidationError.new("RemoveReplicaRegions must have at least 1 item(s)") if value.size < 1
      end
    end

    def_equals_and_hash(@secret_id, @remove_replica_regions)
  end
end
