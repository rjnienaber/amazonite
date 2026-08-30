private alias Core = Amazonite::Core

module Amazonite::SecretsManagerV1
  class DeleteSecretRequest
    include JSON::Serializable

    # The ARN or name of the secret to delete.
    #
    # For an ARN, we recommend that you specify a complete ARN rather than a partial ARN. See [Finding
    # a secret from a partial
    # ARN](https://docs.aws.amazon.com/secretsmanager/latest/userguide/troubleshoot.html#ARN_secretnamehyphen).
    @[JSON::Field(key: "SecretId")]
    property secret_id : String

    # The number of days from 7 to 30 that Secrets Manager waits before permanently deleting the
    # secret. You can't use both this parameter and `ForceDeleteWithoutRecovery` in the same call. If
    # you don't use either, then by default Secrets Manager uses a 30 day recovery window.
    @[JSON::Field(key: "RecoveryWindowInDays")]
    property recovery_window_in_days : Int64 | Nil

    # Specifies whether to delete the secret without any recovery window. You can't use both this
    # parameter and `RecoveryWindowInDays` in the same call. If you don't use either, then by default
    # Secrets Manager uses a 30 day recovery window.
    #
    # Secrets Manager performs the actual deletion with an asynchronous background process, so there
    # might be a short delay before the secret is permanently deleted. If you delete a secret and then
    # immediately create a secret with the same name, use appropriate back off and retry logic.
    #
    # If you forcibly delete an already deleted or nonexistent secret, the operation does not return
    # `ResourceNotFoundException`.
    #
    # Use this parameter with caution. This parameter causes the operation to skip the normal recovery
    # window before the permanent deletion that Secrets Manager would normally impose with the
    # `RecoveryWindowInDays` parameter. If you delete a secret with the `ForceDeleteWithoutRecovery`
    # parameter, then you have no opportunity to recover the secret. You lose the secret permanently.
    @[JSON::Field(key: "ForceDeleteWithoutRecovery")]
    property force_delete_without_recovery : Bool | Nil

    def initialize(
      @secret_id : String,
      @recovery_window_in_days : Int64 | Nil = nil,
      @force_delete_without_recovery : Bool | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @secret_id
        raise Core::ValidationError.new("SecretId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("SecretId length must be <= 2048") if value.size > 2048
      end
    end

    def_equals_and_hash(@secret_id, @recovery_window_in_days, @force_delete_without_recovery)
  end
end
