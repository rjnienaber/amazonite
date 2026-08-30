module Amazonite::LambdaV1
  class ListEventSourceMappingsResponse
    include JSON::Serializable

    # A pagination token that's returned when the response doesn't contain all event source mappings.
    @[JSON::Field(key: "NextMarker")]
    property next_marker : String | Nil

    # A list of event source mappings.
    @[JSON::Field(key: "EventSourceMappings")]
    property event_source_mappings : Array(EventSourceMappingConfiguration) | Nil

    def initialize(
      @next_marker : String | Nil = nil,
      @event_source_mappings : Array(EventSourceMappingConfiguration) | Nil = nil,
    )
    end

    def_equals_and_hash(@next_marker, @event_source_mappings)
  end
end
