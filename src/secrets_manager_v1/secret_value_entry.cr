private alias Core = Amazonite::Core

module Amazonite::SecretsManagerV1
  # A structure that contains the secret value and other details for a secret.
  class SecretValueEntry
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the secret.
    @[JSON::Field(key: "ARN")]
    property arn : String | Nil

    # The friendly name of the secret.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The unique version identifier of this version of the secret.
    @[JSON::Field(key: "VersionId")]
    property version_id : String | Nil

    # The decrypted secret value, if the secret value was originally provided as binary data in the
    # form of a byte array. The parameter represents the binary data as a
    # [base64-encoded](https://tools.ietf.org/html/rfc4648#section-4) string.
    @[JSON::Field(key: "SecretBinary", converter: Core::Base64Converter)]
    property secret_binary : Bytes | Nil

    # The decrypted secret value, if the secret value was originally provided as a string or through
    # the Secrets Manager console.
    @[JSON::Field(key: "SecretString")]
    property secret_string : String | Nil

    # A list of all of the staging labels currently attached to this version of the secret.
    @[JSON::Field(key: "VersionStages")]
    property version_stages : Array(String) | Nil

    # The date the secret was created.
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
