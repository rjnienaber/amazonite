module Amazonite::KmsV1
  class ListGrantsResponse
    include JSON::Serializable

    @[JSON::Field(key: "Grants")]
    property grants : Array(GrantListEntry) | Nil

    @[JSON::Field(key: "NextMarker")]
    property next_marker : String | Nil

    @[JSON::Field(key: "Truncated")]
    property truncated : Bool | Nil

    def initialize(
      @grants : Array(GrantListEntry) | Nil = nil,
      @next_marker : String | Nil = nil,
      @truncated : Bool | Nil = nil,
    )
    end
  end
end
