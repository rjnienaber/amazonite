module Amazonite::KmsV1
  class ListKeyRotationsResponse
    include JSON::Serializable

    @[JSON::Field(key: "Rotations")]
    property rotations : Array(RotationsListEntry) | Nil

    @[JSON::Field(key: "NextMarker")]
    property next_marker : String | Nil

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
