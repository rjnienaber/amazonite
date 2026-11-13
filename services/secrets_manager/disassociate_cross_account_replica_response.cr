private alias Core = Amazonite::Core

module Amazonite::SecretsManager
  class DisassociateCrossAccountReplicaResponse
    include JSON::Serializable

    # The ARN of the primary secret.
    @[JSON::Field(key: "ARN")]
    property arn : String | Nil

    # The ARN of the replica secret that was unlinked from the primary secret.
    @[JSON::Field(key: "CrossAccountReplicaARN")]
    property cross_account_replica_arn : String | Nil

    def initialize(
      @arn : String | Nil = nil,
      @cross_account_replica_arn : String | Nil = nil,
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

    def_equals_and_hash(@arn, @cross_account_replica_arn)
  end
end
