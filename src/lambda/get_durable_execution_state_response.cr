private alias Core = Amazonite::Core

module Amazonite::Lambda
  # The response from the GetDurableExecutionState operation, containing the current execution state
  # for replay.
  class GetDurableExecutionStateResponse
    include JSON::Serializable

    # An array of operations that represent the current state of the durable execution. Operations are
    # ordered by their start sequence number in ascending order and include information needed for
    # replay processing.
    @[JSON::Field(key: "Operations")]
    property operations : Array(Operation) = [] of Operation

    # If present, indicates that more operations are available. Use this value as the `Marker`
    # parameter in a subsequent request to retrieve the next page of results.
    @[JSON::Field(key: "NextMarker")]
    property next_marker : String | Nil

    def initialize(
      @operations : Array(Operation),
      @next_marker : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @operations
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@operations, @next_marker)
  end
end
