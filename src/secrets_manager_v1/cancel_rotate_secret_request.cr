module Amazonite::SecretsManagerV1
  class CancelRotateSecretRequest
    include JSON::Serializable

    @[JSON::Field(key: "SecretId")]
    property secret_id : String

    def initialize(
      @secret_id : String,
    )
    end
  end
end
