private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # The temporary security credentials, which include an access key ID, a secret access key, and a
  # security (or session) token.
  class Credentials
    include JSON::Serializable

    # The access key ID that identifies the temporary security credentials.
    @[JSON::Field(key: "AccessKeyId")]
    property access_key_id : String

    # The secret access key that can be used to sign requests.
    @[JSON::Field(key: "SecretAccessKey")]
    property secret_access_key : String

    # The token that users must pass to the service API to use the temporary credentials.
    @[JSON::Field(key: "SessionToken")]
    property session_token : String

    # The datetime on which the current credentials expire.
    @[JSON::Field(key: "ExpirationTime", converter: Core::AWSEpochConverter)]
    property expiration_time : Time

    def initialize(
      @access_key_id : String,
      @secret_access_key : String,
      @session_token : String,
      @expiration_time : Time,
    )
    end
  end
end
