module Amazonite::LambdaV1
  class ContextDetails
    include JSON::Serializable

    @[JSON::Field(key: "ReplayChildren")]
    property replay_children : Bool | Nil

    @[JSON::Field(key: "Result")]
    property result : String | Nil

    @[JSON::Field(key: "Error")]
    property error : ErrorObject | Nil

    def initialize(
      @replay_children : Bool | Nil = nil,
      @result : String | Nil = nil,
      @error : ErrorObject | Nil = nil,
    )
    end
  end
end
