module Amazonite::SecretsManagerV1
  class StopReplicationToReplicaResponse
    include JSON::Serializable

    @[JSON::Field(key: "ARN")]
    property arn : String | Nil

    def initialize(
      @arn : String | Nil = nil,
    )
    end
  end
end
