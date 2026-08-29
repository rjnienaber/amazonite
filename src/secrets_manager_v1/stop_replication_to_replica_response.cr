module Amazonite::SecretsManagerV1
  class StopReplicationToReplicaResponse
    include JSON::Serializable

    # The ARN of the promoted secret. The ARN is the same as the original primary secret except the
    # Region is changed.
    @[JSON::Field(key: "ARN")]
    property arn : String | Nil

    def initialize(
      @arn : String | Nil = nil,
    )
    end
  end
end
