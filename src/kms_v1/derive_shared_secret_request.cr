private alias AK = Amazonite::KmsV1

module Amazonite::KmsV1
  class DeriveSharedSecretRequest
    include JSON::Serializable

    @[JSON::Field(key: "KeyId")]
    property key_id : String

    @[JSON::Field(key: "KeyAgreementAlgorithm", converter: AK::KeyAgreementAlgorithmSpec)]
    property key_agreement_algorithm : KeyAgreementAlgorithmSpec

    @[JSON::Field(key: "PublicKey")]
    property public_key : String

    @[JSON::Field(key: "GrantTokens")]
    property grant_tokens : Array(String) | Nil

    @[JSON::Field(key: "DryRun")]
    property dry_run : Bool | Nil

    @[JSON::Field(key: "Recipient")]
    property recipient : RecipientInfo | Nil

    def initialize(
      @key_id : String,
      @key_agreement_algorithm : KeyAgreementAlgorithmSpec,
      @public_key : String,
      @grant_tokens : Array(String) | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @recipient : RecipientInfo | Nil = nil,
    )
    end
  end
end
