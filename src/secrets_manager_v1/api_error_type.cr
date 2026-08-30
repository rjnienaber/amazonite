module Amazonite::SecretsManagerV1
  # The error Secrets Manager encountered while retrieving an individual secret as part of
  # BatchGetSecretValue.
  class APIErrorType
    include JSON::Serializable

    # The ARN or name of the secret.
    @[JSON::Field(key: "SecretId")]
    property secret_id : String | Nil

    # The error Secrets Manager encountered while retrieving an individual secret as part of
    # BatchGetSecretValue, for example `ResourceNotFoundException`,`InvalidParameterException`,
    # `InvalidRequestException`, `DecryptionFailure`, or `AccessDeniedException`.
    @[JSON::Field(key: "ErrorCode")]
    property error_code : String | Nil

    # A message describing the error.
    @[JSON::Field(key: "Message")]
    property message : String | Nil

    def initialize(
      @secret_id : String | Nil = nil,
      @error_code : String | Nil = nil,
      @message : String | Nil = nil,
    )
    end

    def_equals_and_hash(@secret_id, @error_code, @message)
  end
end
