module Amazonite::LambdaV1
  class GetDurableExecutionHistoryResponse
    include JSON::Serializable

    @[JSON::Field(key: "Events")]
    property events : Array(Event) = [] of Event

    @[JSON::Field(key: "NextMarker")]
    property next_marker : String | Nil

    def initialize(
      @events : Array(Event),
      @next_marker : String | Nil = nil,
    )
    end
  end
end
