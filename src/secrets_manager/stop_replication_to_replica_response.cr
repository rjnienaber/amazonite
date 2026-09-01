private alias Core = Amazonite::Core

module Amazonite::SecretsManager
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

    def validate! : Nil
      if value = @arn
        raise Core::ValidationError.new("ARN length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("ARN length must be <= 2048") if value.size > 2048
      end
    end

    def_equals_and_hash(@arn)
  end
end
