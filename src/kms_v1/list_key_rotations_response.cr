module Amazonite::KmsV1
  class ListKeyRotationsResponse
    include JSON::Serializable

    # A list of completed key material rotations. When the optional input parameter
    # `IncludeKeyMaterial` is specified with a value of `ALL_KEY_MATERIAL`, this list includes the
    # first key material and any imported key material pending rotation.
    @[JSON::Field(key: "Rotations")]
    property rotations : Array(RotationsListEntry) | Nil

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
      @rotations : Array(RotationsListEntry) | Nil = nil,
      @next_marker : String | Nil = nil,
      @truncated : Bool | Nil = nil,
    )
    end
  end
end
