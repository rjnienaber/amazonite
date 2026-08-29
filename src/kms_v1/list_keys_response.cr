module Amazonite::KmsV1
  class ListKeysResponse
    include JSON::Serializable

    @[JSON::Field(key: "Keys")]
    property keys : Array(KeyListEntry) | Nil

    @[JSON::Field(key: "NextMarker")]
    property next_marker : String | Nil

    @[JSON::Field(key: "Truncated")]
    property truncated : Bool | Nil

    def initialize(
      @keys : Array(KeyListEntry) | Nil = nil,
      @next_marker : String | Nil = nil,
      @truncated : Bool | Nil = nil,
    )
    end
  end
end
