private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  # The response from the GetDurableExecutionHistory operation, containing the execution history and
  # events.
  class GetDurableExecutionHistoryResponse
    include JSON::Serializable

    # An array of execution history events, ordered chronologically unless `ReverseOrder` is set to
    # `true`. Each event represents a significant occurrence during the execution, such as step
    # completion or callback resolution.
    @[JSON::Field(key: "Events")]
    property events : Array(Event) = [] of Event

    # If present, indicates that more history events are available. Use this value as the `Marker`
    # parameter in a subsequent request to retrieve the next page of results.
    @[JSON::Field(key: "NextMarker")]
    property next_marker : String | Nil

    def initialize(
      @events : Array(Event),
      @next_marker : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @events
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@events, @next_marker)
  end
end
