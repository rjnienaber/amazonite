private alias AK = Amazonite::KmsV1

module Amazonite::KmsV1
  class GenerateDataKeyPairRequest
    include JSON::Serializable

    @[JSON::Field(key: "EncryptionContext")]
    property encryption_context : Hash(String, String) | Nil

    @[JSON::Field(key: "KeyId")]
    property key_id : String

    @[JSON::Field(key: "KeyPairSpec", converter: AK::DataKeyPairSpec)]
    property key_pair_spec : DataKeyPairSpec

    @[JSON::Field(key: "GrantTokens")]
    property grant_tokens : Array(String) | Nil

    @[JSON::Field(key: "Recipient")]
    property recipient : RecipientInfo | Nil

    @[JSON::Field(key: "DryRun")]
    property dry_run : Bool | Nil

    def initialize(
      @key_id : String,
      @key_pair_spec : DataKeyPairSpec,
      @encryption_context : Hash(String, String) | Nil = nil,
      @grant_tokens : Array(String) | Nil = nil,
      @recipient : RecipientInfo | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end
  end
end
