private alias ASM = Amazonite::SecretsManager
private alias Core = Amazonite::Core

module Amazonite::SecretsManager
  # Contains information about the primary secret that a cross-account replica secret replicates
  # from, including its ARN and replication status. This information is only available for
  # cross-account replica secrets.
  class CrossAccountPrimaryType
    include JSON::Serializable

    # The ARN of the primary secret replicating into this replica secret.
    @[JSON::Field(key: "PrimarySecretARN")]
    property primary_secret_arn : String | Nil

    # The status of replication from the primary secret to this replica. The status can be:
    #
    # - `InSync`: Replication to the replica secret is complete.
    #
    # - `Failed`: Replication to the replica secret was unable to be completed.
    #
    # - `InProgress`: Replication to the replica secret has started but is not complete.
    #
    # - `Pending`: Replication has not yet started for the replica secret.
    #
    # - `Detached`: Replication to the replica secret was stopped by the primary.
    @[JSON::Field(key: "ReplicationStatus", converter: ASM::StatusType)]
    property replication_status : StatusType | Nil

    # A message that describes the replication status, if Secrets Manager has more information to
    # provide.
    @[JSON::Field(key: "StatusMessage")]
    property status_message : String | Nil

    def initialize(
      @primary_secret_arn : String | Nil = nil,
      @replication_status : StatusType | Nil = nil,
      @status_message : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @primary_secret_arn
        raise Core::ValidationError.new("PrimarySecretARN length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("PrimarySecretARN length must be <= 2048") if value.size > 2048
      end

      if value = @status_message
        raise Core::ValidationError.new("StatusMessage length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StatusMessage length must be <= 4096") if value.size > 4096
      end
    end

    def_equals_and_hash(@primary_secret_arn, @replication_status, @status_message)
  end
end
