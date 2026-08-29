module Amazonite::KmsV1
  class ListKeyPoliciesResponse
    include JSON::Serializable

    @[JSON::Field(key: "PolicyNames")]
    property policy_names : Array(String) | Nil

    @[JSON::Field(key: "NextMarker")]
    property next_marker : String | Nil

    @[JSON::Field(key: "Truncated")]
    property truncated : Bool | Nil

    def initialize(
      @policy_names : Array(String) | Nil = nil,
      @next_marker : String | Nil = nil,
      @truncated : Bool | Nil = nil,
    )
    end
  end
end
