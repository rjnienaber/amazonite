private alias ASM = Amazonite::SecretsManager
private alias Core = Amazonite::Core

module Amazonite::SecretsManager
  class AssociateCrossAccountReplicaRequest
    include JSON::Serializable

    # The ARN or name of the primary secret in your account to replicate.
    #
    # For an ARN, we recommend that you specify a complete ARN rather than a partial ARN. See [Finding
    # a secret from a partial
    # ARN](https://docs.aws.amazon.com/secretsmanager/latest/userguide/troubleshoot.html#ARN_secretnamehyphen).
    @[JSON::Field(key: "SecretId")]
    property secret_id : String

    # The ARN of the replica secret in the other Amazon Web Services account. The replica secret must
    # be in the same Region and partition as the primary secret. Additionally, the replica account
    # owner must have created the replica secret as a cross-account replica of the primary secret. For
    # more information see CreateSecret.
    @[JSON::Field(key: "CrossAccountReplicaARN")]
    property cross_account_replica_arn : String

    # Whether the replica account must belong to the same Amazon Web Services organization as the
    # primary account:
    #
    # - `SameOrg`, which requires the replica account to be in the same organization as the primary
    # account. This is the default.
    #
    # - `NoRestriction`, which allows the replica account to be in any organization.
    @[JSON::Field(key: "ReplicaRestriction", converter: ASM::ReplicaRestrictionType)]
    property replica_restriction : ReplicaRestrictionType | Nil

    # The ARN of an IAM role in the primary account that Secrets Manager assumes to perform
    # replication. If you don't include this field, Secrets Manager replicates using the credentials
    # of caller who updates the primary secret. For more information, see [ Cross-account replication
    # permissions](https://docs.aws.amazon.com/secretsmanager/latest/userguide/cross-account-replicate-permissions.html).
    @[JSON::Field(key: "ReplicationRoleARN")]
    property replication_role_arn : String | Nil

    def initialize(
      @secret_id : String,
      @cross_account_replica_arn : String,
      @replica_restriction : ReplicaRestrictionType | Nil = nil,
      @replication_role_arn : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @secret_id
        raise Core::ValidationError.new("SecretId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("SecretId length must be <= 2048") if value.size > 2048
      end

      if value = @cross_account_replica_arn
        raise Core::ValidationError.new("CrossAccountReplicaARN length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("CrossAccountReplicaARN length must be <= 2048") if value.size > 2048
      end

      if value = @replication_role_arn
        raise Core::ValidationError.new("ReplicationRoleARN length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("ReplicationRoleARN length must be <= 2048") if value.size > 2048
      end
    end

    def_equals_and_hash(@secret_id, @cross_account_replica_arn, @replica_restriction, @replication_role_arn)
  end
end
