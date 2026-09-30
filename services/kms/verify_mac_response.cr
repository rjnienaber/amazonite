private alias AK = Amazonite::Kms
private alias Core = Amazonite::Core

module Amazonite::Kms
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

    def validate! : Nil
      if value = @key_id
        raise Core::ValidationError.new("KeyId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("KeyId length must be <= 2048") if value.size > 2048
      end
    end

    def_equals_and_hash(@key_id, @mac_valid, @mac_algorithm)
  end
end
