module Amazonite::LambdaV1
  # Contains operations that have been updated since the last checkpoint, such as completed
  # asynchronous work like timers or callbacks.
  class CheckpointUpdatedExecutionState
    include JSON::Serializable

    # A list of operations that have been updated since the last checkpoint.
    @[JSON::Field(key: "Operations")]
    property operations : Array(Operation) | Nil

    # Indicates that more results are available. Use this value in a subsequent call to retrieve the
    # next page of results.
    @[JSON::Field(key: "NextMarker")]
    property next_marker : String | Nil

    def initialize(
      @operations : Array(Operation) | Nil = nil,
      @next_marker : String | Nil = nil,
    )
    end
  end
end
