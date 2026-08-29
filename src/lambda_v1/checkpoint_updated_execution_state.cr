module Amazonite::LambdaV1
  class CheckpointUpdatedExecutionState
    include JSON::Serializable

    @[JSON::Field(key: "Operations")]
    property operations : Array(Operation) | Nil

    @[JSON::Field(key: "NextMarker")]
    property next_marker : String | Nil

    def initialize(
      @operations : Array(Operation) | Nil = nil,
      @next_marker : String | Nil = nil,
    )
    end
  end
end
