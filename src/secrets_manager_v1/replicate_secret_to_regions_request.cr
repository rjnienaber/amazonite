module Amazonite::SecretsManagerV1
  class ReplicateSecretToRegionsRequest
    include JSON::Serializable

    # The ARN or name of the secret to replicate.
    @[JSON::Field(key: "SecretId")]
    property secret_id : String

    # A list of Regions in which to replicate the secret.
    @[JSON::Field(key: "AddReplicaRegions")]
    property add_replica_regions : Array(ReplicaRegionType) = [] of ReplicaRegionType

    # Specifies whether to overwrite a secret with the same name in the destination Region. By
    # default, secrets aren't overwritten.
    @[JSON::Field(key: "ForceOverwriteReplicaSecret")]
    property force_overwrite_replica_secret : Bool | Nil

    def initialize(
      @secret_id : String,
      @add_replica_regions : Array(ReplicaRegionType),
      @force_overwrite_replica_secret : Bool | Nil = nil,
    )
    end

    def_equals_and_hash(@secret_id, @add_replica_regions, @force_overwrite_replica_secret)
  end
end
