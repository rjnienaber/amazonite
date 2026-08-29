private alias AK = Amazonite::KmsV1
private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class EncryptRequest
    include JSON::Serializable

    @[JSON::Field(key: "KeyId")]
    property key_id : String

    @[JSON::Field(key: "Plaintext", converter: Core::Base64Converter)]
    property plaintext : Bytes

    @[JSON::Field(key: "EncryptionContext")]
    property encryption_context : Hash(String, String) | Nil

    @[JSON::Field(key: "GrantTokens")]
    property grant_tokens : Array(String) | Nil

    @[JSON::Field(key: "EncryptionAlgorithm", converter: AK::EncryptionAlgorithmSpec)]
    property encryption_algorithm : EncryptionAlgorithmSpec | Nil

    @[JSON::Field(key: "DryRun")]
    property dry_run : Bool | Nil

    def initialize(
      @key_id : String,
      @plaintext : Bytes,
      @encryption_context : Hash(String, String) | Nil = nil,
      @grant_tokens : Array(String) | Nil = nil,
      @encryption_algorithm : EncryptionAlgorithmSpec | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end
  end
end
