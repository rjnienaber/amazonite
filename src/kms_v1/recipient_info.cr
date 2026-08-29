private alias AK = Amazonite::KmsV1

module Amazonite::KmsV1
  class RecipientInfo
    include JSON::Serializable

    @[JSON::Field(key: "KeyEncryptionAlgorithm", converter: AK::KeyEncryptionMechanism)]
    property key_encryption_algorithm : KeyEncryptionMechanism | Nil

    @[JSON::Field(key: "AttestationDocument")]
    property attestation_document : String | Nil

    def initialize(
      @key_encryption_algorithm : KeyEncryptionMechanism | Nil = nil,
      @attestation_document : String | Nil = nil,
    )
    end
  end
end
