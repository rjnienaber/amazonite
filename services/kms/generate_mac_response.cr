private alias AK = Amazonite::Kms
private alias Core = Amazonite::Core

module Amazonite::Kms
  class GenerateMacResponse
    include JSON::Serializable

    # The hash-based message authentication code (HMAC) that was generated for the specified message,
    # HMAC KMS key, and MAC algorithm.
    #
    # This is the standard, raw HMAC defined in [RFC
    # 2104](https://datatracker.ietf.org/doc/html/rfc2104).
    @[JSON::Field(key: "Mac", converter: Core::Base64Converter)]
    property mac : Bytes | Nil

    # The MAC algorithm that was used to generate the HMAC.
    @[JSON::Field(key: "MacAlgorithm", converter: AK::MacAlgorithmSpec)]
    property mac_algorithm : MacAlgorithmSpec | Nil

    # The HMAC KMS key used in the operation.
    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    def initialize(
      @mac : Bytes | Nil = nil,
      @mac_algorithm : MacAlgorithmSpec | Nil = nil,
      @key_id : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @mac
        raise Core::ValidationError.new("Mac length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Mac length must be <= 6144") if value.size > 6144
      end

      if value = @key_id
        raise Core::ValidationError.new("KeyId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("KeyId length must be <= 2048") if value.size > 2048
      end
    end

    def_equals_and_hash(@mac, @mac_algorithm, @key_id)
  end
end
