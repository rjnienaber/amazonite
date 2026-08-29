private alias Core = Amazonite::Core

module Amazonite::SecretsManagerV1
  class UpdateSecretRequest
    include JSON::Serializable

    @[JSON::Field(key: "SecretId")]
    property secret_id : String

    @[JSON::Field(key: "ClientRequestToken")]
    property client_request_token : String | Nil

    @[JSON::Field(key: "Description")]
    property description : String | Nil

    @[JSON::Field(key: "KmsKeyId")]
    property kms_key_id : String | Nil

    @[JSON::Field(key: "SecretBinary", converter: Core::Base64Converter)]
    property secret_binary : Bytes | Nil

    @[JSON::Field(key: "SecretString")]
    property secret_string : String | Nil

    @[JSON::Field(key: "Type")]
    property type : String | Nil

    def initialize(
      @secret_id : String,
      @client_request_token : String | Nil = nil,
      @description : String | Nil = nil,
      @kms_key_id : String | Nil = nil,
      @secret_binary : Bytes | Nil = nil,
      @secret_string : String | Nil = nil,
      @type : String | Nil = nil,
    )
    end
  end
end
