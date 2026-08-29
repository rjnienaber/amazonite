module Amazonite::LambdaV1
  class ListLayerVersionsResponse
    include JSON::Serializable

    @[JSON::Field(key: "NextMarker")]
    property next_marker : String | Nil

    @[JSON::Field(key: "LayerVersions")]
    property layer_versions : Array(LayerVersionsListItem) | Nil

    def initialize(
      @next_marker : String | Nil = nil,
      @layer_versions : Array(LayerVersionsListItem) | Nil = nil,
    )
    end
  end
end
