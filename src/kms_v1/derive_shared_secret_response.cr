private alias AK = Amazonite::KmsV1

module Amazonite::KmsV1
  class DeriveSharedSecretResponse
    include JSON::Serializable

    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    @[JSON::Field(key: "SharedSecret")]
    property shared_secret : String | Nil

    @[JSON::Field(key: "CiphertextForRecipient")]
    property ciphertext_for_recipient : String | Nil

    @[JSON::Field(key: "KeyAgreementAlgorithm", converter: AK::KeyAgreementAlgorithmSpec)]
    property key_agreement_algorithm : KeyAgreementAlgorithmSpec | Nil

    @[JSON::Field(key: "KeyOrigin", converter: AK::OriginType)]
    property key_origin : OriginType | Nil

    def initialize(
      @key_id : String | Nil = nil,
      @shared_secret : String | Nil = nil,
      @ciphertext_for_recipient : String | Nil = nil,
      @key_agreement_algorithm : KeyAgreementAlgorithmSpec | Nil = nil,
      @key_origin : OriginType | Nil = nil,
    )
    end
  end
end
