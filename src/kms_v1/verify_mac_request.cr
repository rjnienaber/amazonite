private alias AK = Amazonite::KmsV1
private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class VerifyMacRequest
    include JSON::Serializable

    @[JSON::Field(key: "Message", converter: Core::Base64Converter)]
    property message : Bytes

    @[JSON::Field(key: "KeyId")]
    property key_id : String

    @[JSON::Field(key: "MacAlgorithm", converter: AK::MacAlgorithmSpec)]
    property mac_algorithm : MacAlgorithmSpec

    @[JSON::Field(key: "Mac", converter: Core::Base64Converter)]
    property mac : Bytes

    @[JSON::Field(key: "GrantTokens")]
    property grant_tokens : Array(String) | Nil

    @[JSON::Field(key: "DryRun")]
    property dry_run : Bool | Nil

    def initialize(
      @message : Bytes,
      @key_id : String,
      @mac_algorithm : MacAlgorithmSpec,
      @mac : Bytes,
      @grant_tokens : Array(String) | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end
  end
end
