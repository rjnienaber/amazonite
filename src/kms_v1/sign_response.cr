private alias AK = Amazonite::KmsV1
private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class SignResponse
    include JSON::Serializable

    # The Amazon Resource Name ([key
    # ARN](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN)) of the
    # asymmetric KMS key that was used to sign the message.
    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    # The cryptographic signature that was generated for the message.
    #
    # - When used with the supported RSA signing algorithms, the encoding of this value is defined by
    # [PKCS #1 in RFC 8017](https://tools.ietf.org/html/rfc8017).
    #
    # - When used with the `ECDSA_SHA_256`, `ECDSA_SHA_384`, or `ECDSA_SHA_512` signing algorithms,
    # this value is a DER-encoded object as defined by ANSI X9.62–2005 and [RFC 3279 Section
    # 2.2.3](https://tools.ietf.org/html/rfc3279#section-2.2.3). This is the most commonly used
    # signature format and is appropriate for most uses.
    #
    # When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded.
    # Otherwise, it is not Base64-encoded.
    @[JSON::Field(key: "Signature", converter: Core::Base64Converter)]
    property signature : Bytes | Nil

    # The signing algorithm that was used to sign the message.
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
