module Amazonite::SecretsManagerV1
  class DeleteSecretRequest
    include JSON::Serializable

    @[JSON::Field(key: "SecretId")]
    property secret_id : String

    @[JSON::Field(key: "RecoveryWindowInDays")]
    property recovery_window_in_days : Int64 | Nil

    @[JSON::Field(key: "ForceDeleteWithoutRecovery")]
    property force_delete_without_recovery : Bool | Nil

    def initialize(
      @secret_id : String,
      @recovery_window_in_days : Int64 | Nil = nil,
      @force_delete_without_recovery : Bool | Nil = nil,
    )
    end
  end
end
