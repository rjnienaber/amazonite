module Amazonite::KmsV1
  class DescribeCustomKeyStoresResponse
    include JSON::Serializable

    @[JSON::Field(key: "CustomKeyStores")]
    property custom_key_stores : Array(CustomKeyStoresListEntry) | Nil

    @[JSON::Field(key: "NextMarker")]
    property next_marker : String | Nil

    @[JSON::Field(key: "Truncated")]
    property truncated : Bool | Nil

    def initialize(
      @custom_key_stores : Array(CustomKeyStoresListEntry) | Nil = nil,
      @next_marker : String | Nil = nil,
      @truncated : Bool | Nil = nil,
    )
    end
  end
end
