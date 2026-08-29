private alias AK = Amazonite::KmsV1
private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class RecipientInfo
    include JSON::Serializable

    @[JSON::Field(key: "KeyEncryptionAlgorithm", converter: AK::KeyEncryptionMechanism)]
    property key_encryption_algorithm : KeyEncryptionMechanism | Nil

    @[JSON::Field(key: "AttestationDocument", converter: Core::Base64Converter)]
    property attestation_document : Bytes | Nil

    def initialize(
      @key_encryption_algorithm : KeyEncryptionMechanism | Nil = nil,
      @attestation_document : Bytes | Nil = nil,
    )
    end
  end
end
