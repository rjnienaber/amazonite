module Amazonite::KmsV1
  class DescribeKeyRequest
    include JSON::Serializable

    @[JSON::Field(key: "KeyId")]
    property key_id : String

    @[JSON::Field(key: "GrantTokens")]
    property grant_tokens : Array(String) | Nil

    def initialize(
      @key_id : String,
      @grant_tokens : Array(String) | Nil = nil,
    )
    end
  end
end
