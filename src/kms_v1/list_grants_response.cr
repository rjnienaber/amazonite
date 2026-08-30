module Amazonite::KmsV1
  class ListGrantsResponse
    include JSON::Serializable

    # A list of grants.
    @[JSON::Field(key: "Grants")]
    property grants : Array(GrantListEntry) | Nil

    # When `Truncated` is true, this element is present and contains the value to use for the `Marker`
    # parameter in a subsequent request.
    @[JSON::Field(key: "NextMarker")]
    property next_marker : String | Nil

    # A flag that indicates whether there are more items in the list. When this value is true, the
    # list in this response is truncated. To get more items, pass the value of the `NextMarker`
    # element in this response to the `Marker` parameter in a subsequent request.
    @[JSON::Field(key: "Truncated")]
    property truncated : Bool | Nil

    def initialize(
      @grants : Array(GrantListEntry) | Nil = nil,
      @next_marker : String | Nil = nil,
      @truncated : Bool | Nil = nil,
    )
    end

    def_equals_and_hash(@grants, @next_marker, @truncated)
  end
end
