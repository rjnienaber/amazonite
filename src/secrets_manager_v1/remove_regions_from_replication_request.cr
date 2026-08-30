module Amazonite::SecretsManagerV1
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

    def_equals_and_hash(@secret_id, @remove_replica_regions)
  end
end
