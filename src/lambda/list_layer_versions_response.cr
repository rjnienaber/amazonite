private alias Core = Amazonite::Core

module Amazonite::Lambda
  class ListLayerVersionsResponse
    include JSON::Serializable

    # A pagination token returned when the response doesn't contain all versions.
    @[JSON::Field(key: "NextMarker")]
    property next_marker : String | Nil

    # A list of versions.
    @[JSON::Field(key: "LayerVersions")]
    property layer_versions : Array(LayerVersionsListItem) | Nil

    def initialize(
      @next_marker : String | Nil = nil,
      @layer_versions : Array(LayerVersionsListItem) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @layer_versions
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@next_marker, @layer_versions)
  end
end
