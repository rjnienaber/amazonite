module Amazonite::KmsV1
  class RevokeGrantRequest
    include JSON::Serializable

    @[JSON::Field(key: "KeyId")]
    property key_id : String

    @[JSON::Field(key: "GrantId")]
    property grant_id : String

    @[JSON::Field(key: "DryRun")]
    property dry_run : Bool | Nil

    def initialize(
      @key_id : String,
      @grant_id : String,
      @dry_run : Bool | Nil = nil,
    )
    end
  end
end
