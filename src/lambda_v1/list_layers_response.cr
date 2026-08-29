module Amazonite::LambdaV1
  class ListLayersResponse
    include JSON::Serializable

    @[JSON::Field(key: "NextMarker")]
    property next_marker : String | Nil

    @[JSON::Field(key: "Layers")]
    property layers : Array(LayersListItem) | Nil

    def initialize(
      @next_marker : String | Nil = nil,
      @layers : Array(LayersListItem) | Nil = nil,
    )
    end
  end
end
