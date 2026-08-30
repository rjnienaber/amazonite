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
  end
end
