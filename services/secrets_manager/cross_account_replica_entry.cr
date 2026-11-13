private alias ASM = Amazonite::SecretsManager
private alias Core = Amazonite::Core

module Amazonite::SecretsManager
  # Information about a cross-account replica secret. This information is only available for
  # cross-account primary secrets.
  class CrossAccountReplicaEntry
    include JSON::Serializable

    # The ARN of the replica secret.
    @[JSON::Field(key: "ReplicaSecretARN")]
    property replica_secret_arn : String | Nil

    # The ARN of the IAM role that Secrets Manager assumes to replicate to this replica, if one was
    # specified when the replica was associated.
    @[JSON::Field(key: "ReplicationRoleARN")]
    property replication_role_arn : String | Nil

    # The status of replication from this primary secret. The status can be:
    #
    # - `InSync`: Replication from the primary secret is complete.
    #
    # - `Failed`: Replication from the primary secret was unable to be completed.
    #
    # - `InProgress`: Replication from the primary secret has started but is not complete.
    #
    # - `Detached`: Replication from the primary secret was stopped by the replica.
    @[JSON::Field(key: "ReplicationStatus", converter: ASM::StatusType)]
    property replication_status : StatusType | Nil

    # A message that describes the replication status, if Secrets Manager has more information to
    # provide.
    @[JSON::Field(key: "StatusMessage")]
    property status_message : String | Nil

    def initialize(
      @replica_secret_arn : String | Nil = nil,
      @replication_role_arn : String | Nil = nil,
      @replication_status : StatusType | Nil = nil,
      @status_message : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @replica_secret_arn
        raise Core::ValidationError.new("ReplicaSecretARN length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("ReplicaSecretARN length must be <= 2048") if value.size > 2048
      end

      if value = @replication_role_arn
        raise Core::ValidationError.new("ReplicationRoleARN length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("ReplicationRoleARN length must be <= 2048") if value.size > 2048
      end

      if value = @status_message
        raise Core::ValidationError.new("StatusMessage length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StatusMessage length must be <= 4096") if value.size > 4096
      end
    end

    def_equals_and_hash(@replica_secret_arn, @replication_role_arn, @replication_status, @status_message)
  end
end
