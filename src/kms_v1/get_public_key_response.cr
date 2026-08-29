private alias AK = Amazonite::KmsV1
private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class GetPublicKeyResponse
    include JSON::Serializable

    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    @[JSON::Field(key: "PublicKey")]
    property public_key : String | Nil

    @[JSON::Field(key: "CustomerMasterKeySpec", converter: AK::CustomerMasterKeySpec)]
    property customer_master_key_spec : CustomerMasterKeySpec | Nil

    @[JSON::Field(key: "KeySpec", converter: AK::KeySpec)]
    property key_spec : KeySpec | Nil

    @[JSON::Field(key: "KeyUsage", converter: AK::KeyUsageType)]
    property key_usage : KeyUsageType | Nil

    @[JSON::Field(key: "EncryptionAlgorithms", converter: Core::ArrayConverter(AK::EncryptionAlgorithmSpec))]
    property encryption_algorithms : Array(EncryptionAlgorithmSpec) | Nil

    @[JSON::Field(key: "SigningAlgorithms", converter: Core::ArrayConverter(AK::SigningAlgorithmSpec))]
    property signing_algorithms : Array(SigningAlgorithmSpec) | Nil

    @[JSON::Field(key: "KeyAgreementAlgorithms", converter: Core::ArrayConverter(AK::KeyAgreementAlgorithmSpec))]
    property key_agreement_algorithms : Array(KeyAgreementAlgorithmSpec) | Nil

    def initialize(
      @key_id : String | Nil = nil,
      @public_key : String | Nil = nil,
      @customer_master_key_spec : CustomerMasterKeySpec | Nil = nil,
      @key_spec : KeySpec | Nil = nil,
      @key_usage : KeyUsageType | Nil = nil,
      @encryption_algorithms : Array(EncryptionAlgorithmSpec) | Nil = nil,
      @signing_algorithms : Array(SigningAlgorithmSpec) | Nil = nil,
      @key_agreement_algorithms : Array(KeyAgreementAlgorithmSpec) | Nil = nil,
    )
    end
  end
end
