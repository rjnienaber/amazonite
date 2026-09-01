private alias Core = Amazonite::Core

module Amazonite::SecretsManager
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

    def validate! : Nil
      if value = @secret_id
        raise Core::ValidationError.new("SecretId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("SecretId length must be <= 2048") if value.size > 2048
      end

      if value = @add_replica_regions
        raise Core::ValidationError.new("AddReplicaRegions must have at least 1 item(s)") if value.size < 1
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@secret_id, @add_replica_regions, @force_overwrite_replica_secret)
  end
end
