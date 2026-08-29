module Amazonite::KmsV1
  class RetireGrantRequest
    include JSON::Serializable

    @[JSON::Field(key: "GrantToken")]
    property grant_token : String | Nil

    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    @[JSON::Field(key: "GrantId")]
    property grant_id : String | Nil

    @[JSON::Field(key: "DryRun")]
    property dry_run : Bool | Nil

    def initialize(
      @grant_token : String | Nil = nil,
      @key_id : String | Nil = nil,
      @grant_id : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end
  end
end
