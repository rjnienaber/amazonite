module Amazonite::KmsV1
  class GenerateRandomResponse
    include JSON::Serializable

    @[JSON::Field(key: "Plaintext")]
    property plaintext : String | Nil

    @[JSON::Field(key: "CiphertextForRecipient")]
    property ciphertext_for_recipient : String | Nil

    def initialize(
      @plaintext : String | Nil = nil,
      @ciphertext_for_recipient : String | Nil = nil,
    )
    end
  end
end
