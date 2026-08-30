module Amazonite::LambdaV1
  class ListLayersResponse
    include JSON::Serializable

    # A pagination token returned when the response doesn't contain all layers.
    @[JSON::Field(key: "NextMarker")]
    property next_marker : String | Nil

    # A list of function layers.
    @[JSON::Field(key: "Layers")]
    property layers : Array(LayersListItem) | Nil

    def initialize(
      @next_marker : String | Nil = nil,
      @layers : Array(LayersListItem) | Nil = nil,
    )
    end

    def_equals_and_hash(@next_marker, @layers)
  end
end
