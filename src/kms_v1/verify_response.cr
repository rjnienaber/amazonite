private alias AK = Amazonite::KmsV1

module Amazonite::KmsV1
  class VerifyResponse
    include JSON::Serializable

    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    @[JSON::Field(key: "SignatureValid")]
    property signature_valid : Bool | Nil

    @[JSON::Field(key: "SigningAlgorithm", converter: AK::SigningAlgorithmSpec)]
    property signing_algorithm : SigningAlgorithmSpec | Nil

    def initialize(
      @key_id : String | Nil = nil,
      @signature_valid : Bool | Nil = nil,
      @signing_algorithm : SigningAlgorithmSpec | Nil = nil,
    )
    end
  end
end
