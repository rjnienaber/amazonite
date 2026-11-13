private alias Core = Amazonite::Core

module Amazonite::SecretsManager
  class StopReplicationToReplicaRequest
    include JSON::Serializable

    # The ARN or name of the replica secret.
    #
    # For a cross-region replica, the replica ARN is the same as the original primary secret ARN
    # except that the Region is changed to the replica Region. For a cross-account replica, this is
    # the ARN or name of the replica secret in your account.
    @[JSON::Field(key: "SecretId")]
    property secret_id : String

    def initialize(
      @secret_id : String,
    )
    end

    def validate! : Nil
      if value = @secret_id
        raise Core::ValidationError.new("SecretId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("SecretId length must be <= 2048") if value.size > 2048
      end
    end

    def_equals_and_hash(@secret_id)
  end
end
