private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class Credentials
    include JSON::Serializable

    @[JSON::Field(key: "AccessKeyId")]
    property access_key_id : String

    @[JSON::Field(key: "SecretAccessKey")]
    property secret_access_key : String

    @[JSON::Field(key: "SessionToken")]
    property session_token : String

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
