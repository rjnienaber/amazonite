private alias AK = Amazonite::KmsV1

module Amazonite::KmsV1
  class VerifyMacRequest
    include JSON::Serializable

    @[JSON::Field(key: "Message")]
    property message : String

    @[JSON::Field(key: "KeyId")]
    property key_id : String

    @[JSON::Field(key: "MacAlgorithm", converter: AK::MacAlgorithmSpec)]
    property mac_algorithm : MacAlgorithmSpec

    @[JSON::Field(key: "Mac")]
    property mac : String

    @[JSON::Field(key: "GrantTokens")]
    property grant_tokens : Array(String) | Nil

    @[JSON::Field(key: "DryRun")]
    property dry_run : Bool | Nil

    def initialize(
      @message : String,
      @key_id : String,
      @mac_algorithm : MacAlgorithmSpec,
      @mac : String,
      @grant_tokens : Array(String) | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end
  end
end
