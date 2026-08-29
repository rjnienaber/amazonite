module Amazonite::SecretsManagerV1
  class RemoveRegionsFromReplicationRequest
    include JSON::Serializable

    @[JSON::Field(key: "SecretId")]
    property secret_id : String

    @[JSON::Field(key: "RemoveReplicaRegions")]
    property remove_replica_regions : Array(String) = [] of String

    def initialize(
      @secret_id : String,
      @remove_replica_regions : Array(String),
    )
    end
  end
end
