private alias AK = Amazonite::KmsV1

module Amazonite::KmsV1
  class VerifyMacResponse
    include JSON::Serializable

    # The HMAC KMS key used in the verification.
    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    # A Boolean value that indicates whether the HMAC was verified. A value of `True` indicates that
    # the HMAC (`Mac`) was generated with the specified `Message`, HMAC KMS key (`KeyID`) and
    # `MacAlgorithm.`.
    #
    # If the HMAC is not verified, the `VerifyMac` operation fails with a `KMSInvalidMacException`
    # exception. This exception indicates that one or more of the inputs changed since the HMAC was
    # computed.
    @[JSON::Field(key: "MacValid")]
    property mac_valid : Bool | Nil

    # The MAC algorithm used in the verification.
    @[JSON::Field(key: "MacAlgorithm", converter: AK::MacAlgorithmSpec)]
    property mac_algorithm : MacAlgorithmSpec | Nil

    def initialize(
      @key_id : String | Nil = nil,
      @mac_valid : Bool | Nil = nil,
      @mac_algorithm : MacAlgorithmSpec | Nil = nil,
    )
    end

    def_equals_and_hash(@key_id, @mac_valid, @mac_algorithm)
  end
end
