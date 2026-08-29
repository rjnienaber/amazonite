private alias AK = Amazonite::KmsV1
private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class DecryptRequest
    include JSON::Serializable

    @[JSON::Field(key: "CiphertextBlob")]
    property ciphertext_blob : String | Nil

    @[JSON::Field(key: "EncryptionContext")]
    property encryption_context : Hash(String, String) | Nil

    @[JSON::Field(key: "GrantTokens")]
    property grant_tokens : Array(String) | Nil

    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    @[JSON::Field(key: "EncryptionAlgorithm", converter: AK::EncryptionAlgorithmSpec)]
    property encryption_algorithm : EncryptionAlgorithmSpec | Nil

    @[JSON::Field(key: "Recipient")]
    property recipient : RecipientInfo | Nil

    @[JSON::Field(key: "DryRun")]
    property dry_run : Bool | Nil

    @[JSON::Field(key: "DryRunModifiers", converter: Core::ArrayConverter(AK::DryRunModifierType))]
    property dry_run_modifiers : Array(DryRunModifierType) | Nil

    def initialize(
      @ciphertext_blob : String | Nil = nil,
      @encryption_context : Hash(String, String) | Nil = nil,
      @grant_tokens : Array(String) | Nil = nil,
      @key_id : String | Nil = nil,
      @encryption_algorithm : EncryptionAlgorithmSpec | Nil = nil,
      @recipient : RecipientInfo | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @dry_run_modifiers : Array(DryRunModifierType) | Nil = nil,
    )
    end
  end
end
