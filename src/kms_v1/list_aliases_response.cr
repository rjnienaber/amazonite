module Amazonite::KmsV1
  class ListAliasesResponse
    include JSON::Serializable

    @[JSON::Field(key: "Aliases")]
    property aliases : Array(AliasListEntry) | Nil

    @[JSON::Field(key: "NextMarker")]
    property next_marker : String | Nil

    @[JSON::Field(key: "Truncated")]
    property truncated : Bool | Nil

    def initialize(
      @aliases : Array(AliasListEntry) | Nil = nil,
      @next_marker : String | Nil = nil,
      @truncated : Bool | Nil = nil,
    )
    end
  end
end
