private alias AK = Amazonite::KmsV1
private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class SignResponse
    include JSON::Serializable

    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    @[JSON::Field(key: "Signature", converter: Core::Base64Converter)]
    property signature : Bytes | Nil

    @[JSON::Field(key: "SigningAlgorithm", converter: AK::SigningAlgorithmSpec)]
    property signing_algorithm : SigningAlgorithmSpec | Nil

    def initialize(
      @key_id : String | Nil = nil,
      @signature : Bytes | Nil = nil,
      @signing_algorithm : SigningAlgorithmSpec | Nil = nil,
    )
    end
  end
end
