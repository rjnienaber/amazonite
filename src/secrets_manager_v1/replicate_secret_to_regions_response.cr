private alias Core = Amazonite::Core

module Amazonite::SecretsManagerV1
  class ReplicateSecretToRegionsResponse
    include JSON::Serializable

    # The ARN of the primary secret.
    @[JSON::Field(key: "ARN")]
    property arn : String | Nil

    # The status of replication.
    @[JSON::Field(key: "ReplicationStatus")]
    property replication_status : Array(ReplicationStatusType) | Nil

    def initialize(
      @arn : String | Nil = nil,
      @replication_status : Array(ReplicationStatusType) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @arn
        raise Core::ValidationError.new("ARN length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("ARN length must be <= 2048") if value.size > 2048
      end

      if value = @replication_status
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@arn, @replication_status)
  end
end
