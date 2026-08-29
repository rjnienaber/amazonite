private alias AK = Amazonite::KmsV1

module Amazonite::KmsV1
  class SignRequest
    include JSON::Serializable

    @[JSON::Field(key: "KeyId")]
    property key_id : String

    @[JSON::Field(key: "Message")]
    property message : String

    @[JSON::Field(key: "MessageType", converter: AK::MessageType)]
    property message_type : MessageType | Nil

    @[JSON::Field(key: "GrantTokens")]
    property grant_tokens : Array(String) | Nil

    @[JSON::Field(key: "SigningAlgorithm", converter: AK::SigningAlgorithmSpec)]
    property signing_algorithm : SigningAlgorithmSpec

    @[JSON::Field(key: "DryRun")]
    property dry_run : Bool | Nil

    def initialize(
      @key_id : String,
      @message : String,
      @signing_algorithm : SigningAlgorithmSpec,
      @message_type : MessageType | Nil = nil,
      @grant_tokens : Array(String) | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end
  end
end
