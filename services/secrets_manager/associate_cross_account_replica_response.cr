private alias ASM = Amazonite::SecretsManager
private alias Core = Amazonite::Core

module Amazonite::SecretsManager
  class AssociateCrossAccountReplicaResponse
    include JSON::Serializable

    # The ARN of the primary secret.
    @[JSON::Field(key: "ARN")]
    property arn : String | Nil

    # The ARN of the replica secret in the other account.
    @[JSON::Field(key: "CrossAccountReplicaARN")]
    property cross_account_replica_arn : String | Nil

    # The status of replication to the replica secret. Possible values:
    #
    # - `InSync`, which indicates that replication to the replica completed successfully and the
    # replica is up to date.
    #
    # - `Failed`, which indicates that replication to the replica did not succeed.
    #
    # - `InProgress`, which indicates that Secrets Manager is replicating to the replica.
    #
    # - `Pending`, which indicates that replication has not yet started.
    #
    # - `Detached`, which indicates that primary secret is no longer linked to the replica secret.
    @[JSON::Field(key: "ReplicationStatus", converter: ASM::StatusType)]
    property replication_status : StatusType | Nil

    def initialize(
      @arn : String | Nil = nil,
      @cross_account_replica_arn : String | Nil = nil,
      @replication_status : StatusType | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @arn
        raise Core::ValidationError.new("ARN length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("ARN length must be <= 2048") if value.size > 2048
      end

      if value = @cross_account_replica_arn
        raise Core::ValidationError.new("CrossAccountReplicaARN length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("CrossAccountReplicaARN length must be <= 2048") if value.size > 2048
      end
    end

    def_equals_and_hash(@arn, @cross_account_replica_arn, @replication_status)
  end
end
