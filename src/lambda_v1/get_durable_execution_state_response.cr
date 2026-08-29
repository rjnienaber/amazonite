module Amazonite::LambdaV1
  class GetDurableExecutionStateResponse
    include JSON::Serializable

    @[JSON::Field(key: "Operations")]
    property operations : Array(Operation) = [] of Operation

    @[JSON::Field(key: "NextMarker")]
    property next_marker : String | Nil

    def initialize(
      @operations : Array(Operation),
      @next_marker : String | Nil = nil,
    )
    end
  end
end
