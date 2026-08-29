private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class GenerateRandomResponse
    include JSON::Serializable

    @[JSON::Field(key: "Plaintext", converter: Core::Base64Converter)]
    property plaintext : Bytes | Nil

    @[JSON::Field(key: "CiphertextForRecipient", converter: Core::Base64Converter)]
    property ciphertext_for_recipient : Bytes | Nil

    def initialize(
      @plaintext : Bytes | Nil = nil,
      @ciphertext_for_recipient : Bytes | Nil = nil,
    )
    end
  end
end
