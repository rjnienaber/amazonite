private alias AK = Amazonite::KmsV1

module Amazonite::KmsV1
  class SignResponse
    include JSON::Serializable

    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    @[JSON::Field(key: "Signature")]
    property signature : String | Nil

    @[JSON::Field(key: "SigningAlgorithm", converter: AK::SigningAlgorithmSpec)]
    property signing_algorithm : SigningAlgorithmSpec | Nil

    def initialize(
      @key_id : String | Nil = nil,
      @signature : String | Nil = nil,
      @signing_algorithm : SigningAlgorithmSpec | Nil = nil,
    )
    end
  end
end
