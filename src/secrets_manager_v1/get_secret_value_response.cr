private alias Core = Amazonite::Core

module Amazonite::SecretsManagerV1
  class GetSecretValueResponse
    include JSON::Serializable

    @[JSON::Field(key: "ARN")]
    property arn : String | Nil

    @[JSON::Field(key: "Name")]
    property name : String | Nil

    @[JSON::Field(key: "VersionId")]
    property version_id : String | Nil

    @[JSON::Field(key: "SecretBinary", converter: Core::Base64Converter)]
    property secret_binary : Bytes | Nil

    @[JSON::Field(key: "SecretString")]
    property secret_string : String | Nil

    @[JSON::Field(key: "VersionStages")]
    property version_stages : Array(String) | Nil

    @[JSON::Field(key: "CreatedDate", converter: Core::AWSEpochConverter)]
    property created_date : Time | Nil

    def initialize(
      @arn : String | Nil = nil,
      @name : String | Nil = nil,
      @version_id : String | Nil = nil,
      @secret_binary : Bytes | Nil = nil,
      @secret_string : String | Nil = nil,
      @version_stages : Array(String) | Nil = nil,
      @created_date : Time | Nil = nil,
    )
    end
  end
end
