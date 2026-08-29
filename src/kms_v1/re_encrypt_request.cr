private alias AK = Amazonite::KmsV1
private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class ReEncryptRequest
    include JSON::Serializable

    @[JSON::Field(key: "CiphertextBlob", converter: Core::Base64Converter)]
    property ciphertext_blob : Bytes | Nil

    @[JSON::Field(key: "SourceEncryptionContext")]
    property source_encryption_context : Hash(String, String) | Nil

    @[JSON::Field(key: "SourceKeyId")]
    property source_key_id : String | Nil

    @[JSON::Field(key: "DestinationKeyId")]
    property destination_key_id : String

    @[JSON::Field(key: "DestinationEncryptionContext")]
    property destination_encryption_context : Hash(String, String) | Nil

    @[JSON::Field(key: "SourceEncryptionAlgorithm", converter: AK::EncryptionAlgorithmSpec)]
    property source_encryption_algorithm : EncryptionAlgorithmSpec | Nil

    @[JSON::Field(key: "DestinationEncryptionAlgorithm", converter: AK::EncryptionAlgorithmSpec)]
    property destination_encryption_algorithm : EncryptionAlgorithmSpec | Nil

    @[JSON::Field(key: "GrantTokens")]
    property grant_tokens : Array(String) | Nil

    @[JSON::Field(key: "DryRun")]
    property dry_run : Bool | Nil

    @[JSON::Field(key: "DryRunModifiers", converter: Core::ArrayConverter(AK::DryRunModifierType))]
    property dry_run_modifiers : Array(DryRunModifierType) | Nil

    def initialize(
      @destination_key_id : String,
      @ciphertext_blob : Bytes | Nil = nil,
      @source_encryption_context : Hash(String, String) | Nil = nil,
      @source_key_id : String | Nil = nil,
      @destination_encryption_context : Hash(String, String) | Nil = nil,
      @source_encryption_algorithm : EncryptionAlgorithmSpec | Nil = nil,
      @destination_encryption_algorithm : EncryptionAlgorithmSpec | Nil = nil,
      @grant_tokens : Array(String) | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @dry_run_modifiers : Array(DryRunModifierType) | Nil = nil,
    )
    end
  end
end
