private alias Core = Amazonite::Core

module Amazonite::SecretsManager
  class DisassociateCrossAccountReplicaRequest
    include JSON::Serializable

    # The ARN or name of the primary secret in your account.
    #
    # For an ARN, we recommend that you specify a complete ARN rather than a partial ARN. See [Finding
    # a secret from a partial
    # ARN](https://docs.aws.amazon.com/secretsmanager/latest/userguide/troubleshoot.html#ARN_secretnamehyphen).
    @[JSON::Field(key: "SecretId")]
    property secret_id : String

    # The ARN of the cross-account replica secret to unlink from the primary secret.
    @[JSON::Field(key: "CrossAccountReplicaARN")]
    property cross_account_replica_arn : String

    def initialize(
      @secret_id : String,
      @cross_account_replica_arn : String,
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
    end

    def_equals_and_hash(@secret_id, @cross_account_replica_arn)
  end
end
