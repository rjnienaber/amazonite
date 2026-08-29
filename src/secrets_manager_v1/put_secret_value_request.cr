private alias Core = Amazonite::Core

module Amazonite::SecretsManagerV1
  class PutSecretValueRequest
    include JSON::Serializable

    @[JSON::Field(key: "SecretId")]
    property secret_id : String

    @[JSON::Field(key: "ClientRequestToken")]
    property client_request_token : String | Nil

    @[JSON::Field(key: "SecretBinary", converter: Core::Base64Converter)]
    property secret_binary : Bytes | Nil

    @[JSON::Field(key: "SecretString")]
    property secret_string : String | Nil

    @[JSON::Field(key: "VersionStages")]
    property version_stages : Array(String) | Nil

    @[JSON::Field(key: "RotationToken")]
    property rotation_token : String | Nil

    def initialize(
      @secret_id : String,
      @client_request_token : String | Nil = nil,
      @secret_binary : Bytes | Nil = nil,
      @secret_string : String | Nil = nil,
      @version_stages : Array(String) | Nil = nil,
      @rotation_token : String | Nil = nil,
    )
    end
  end
end
