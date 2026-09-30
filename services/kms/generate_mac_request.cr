private alias AK = Amazonite::Kms
private alias Core = Amazonite::Core

module Amazonite::Kms
  class GenerateMacRequest
    include JSON::Serializable

    # The message to be hashed. Specify a message of up to 4,096 bytes.
    #
    # `GenerateMac` and VerifyMac do not provide special handling for message digests. If you generate
    # an HMAC for a hash digest of a message, you must verify the HMAC of the same hash digest.
    @[JSON::Field(key: "Message", converter: Core::Base64Converter)]
    property message : Bytes

    # The HMAC KMS key to use in the operation. The MAC algorithm computes the HMAC for the message
    # and the key as described in [RFC 2104](https://datatracker.ietf.org/doc/html/rfc2104).
    #
    # To identify an HMAC KMS key, use the DescribeKey operation and see the `KeySpec` field in the
    # response.
    @[JSON::Field(key: "KeyId")]
    property key_id : String

    # The MAC algorithm used in the operation.
    #
    # The algorithm must be compatible with the HMAC KMS key that you specify. To find the MAC
    # algorithms that your HMAC KMS key supports, use the DescribeKey operation and see the
    # `MacAlgorithms` field in the `DescribeKey` response.
    @[JSON::Field(key: "MacAlgorithm", converter: AK::MacAlgorithmSpec)]
    property mac_algorithm : MacAlgorithmSpec

    # A list of grant tokens.
    #
    # Use a grant token when your permission to call this operation comes from a new grant that has
    # not yet achieved *eventual consistency*. For more information, see [Grant
    # token](https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token) and [Using
    # a grant token](https://docs.aws.amazon.com/kms/latest/developerguide/using-grant-token.html) in
    # the *Key Management Service Developer Guide*.
    @[JSON::Field(key: "GrantTokens")]
    property grant_tokens : Array(String) | Nil

    # Checks if your request will succeed. `DryRun` is an optional parameter.
    #
    # To learn more about how to use this parameter, see [Testing your
    # permissions](https://docs.aws.amazon.com/kms/latest/developerguide/testing-permissions.html) in
    # the *Key Management Service Developer Guide*.
    @[JSON::Field(key: "DryRun")]
    property dry_run : Bool | Nil

    def initialize(
      @message : Bytes,
      @key_id : String,
      @mac_algorithm : MacAlgorithmSpec,
      @grant_tokens : Array(String) | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @message
        raise Core::ValidationError.new("Message length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Message length must be <= 4096") if value.size > 4096
      end

      if value = @key_id
        raise Core::ValidationError.new("KeyId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("KeyId length must be <= 2048") if value.size > 2048
      end

      if value = @grant_tokens
        raise Core::ValidationError.new("GrantTokens must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("GrantTokens must have at most 10 item(s)") if value.size > 10
      end
    end

    def_equals_and_hash(@message, @key_id, @mac_algorithm, @grant_tokens, @dry_run)
  end
end
