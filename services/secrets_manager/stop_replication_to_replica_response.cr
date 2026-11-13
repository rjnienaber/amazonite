private alias Core = Amazonite::Core

module Amazonite::SecretsManager
  class StopReplicationToReplicaResponse
    include JSON::Serializable

    # The ARN of the promoted secret. For a cross-region replica, this ARN is the same as the original
    # primary secret's ARN except that the Region is changed. For a cross-account replica, this is the
    # ARN of the promoted secret in your account.
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
