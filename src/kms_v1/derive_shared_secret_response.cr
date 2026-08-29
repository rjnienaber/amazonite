private alias AK = Amazonite::KmsV1
private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class DeriveSharedSecretResponse
    include JSON::Serializable

    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    @[JSON::Field(key: "SharedSecret", converter: Core::Base64Converter)]
    property shared_secret : Bytes | Nil

    @[JSON::Field(key: "CiphertextForRecipient", converter: Core::Base64Converter)]
    property ciphertext_for_recipient : Bytes | Nil

    @[JSON::Field(key: "KeyAgreementAlgorithm", converter: AK::KeyAgreementAlgorithmSpec)]
    property key_agreement_algorithm : KeyAgreementAlgorithmSpec | Nil

    @[JSON::Field(key: "KeyOrigin", converter: AK::OriginType)]
    property key_origin : OriginType | Nil

    def initialize(
      @key_id : String | Nil = nil,
      @shared_secret : Bytes | Nil = nil,
      @ciphertext_for_recipient : Bytes | Nil = nil,
      @key_agreement_algorithm : KeyAgreementAlgorithmSpec | Nil = nil,
      @key_origin : OriginType | Nil = nil,
    )
    end
  end
end
