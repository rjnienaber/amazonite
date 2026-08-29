module Amazonite::LambdaV1
  class ListEventSourceMappingsResponse
    include JSON::Serializable

    @[JSON::Field(key: "NextMarker")]
    property next_marker : String | Nil

    @[JSON::Field(key: "EventSourceMappings")]
    property event_source_mappings : Array(EventSourceMappingConfiguration) | Nil

    def initialize(
      @next_marker : String | Nil = nil,
      @event_source_mappings : Array(EventSourceMappingConfiguration) | Nil = nil,
    )
    end
  end
end
