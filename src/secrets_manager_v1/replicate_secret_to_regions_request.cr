module Amazonite::SecretsManagerV1
  class ReplicateSecretToRegionsRequest
    include JSON::Serializable

    @[JSON::Field(key: "SecretId")]
    property secret_id : String

    @[JSON::Field(key: "AddReplicaRegions")]
    property add_replica_regions : Array(ReplicaRegionType) = [] of ReplicaRegionType

    @[JSON::Field(key: "ForceOverwriteReplicaSecret")]
    property force_overwrite_replica_secret : Bool | Nil

    def initialize(
      @secret_id : String,
      @add_replica_regions : Array(ReplicaRegionType),
      @force_overwrite_replica_secret : Bool | Nil = nil,
    )
    end
  end
end
