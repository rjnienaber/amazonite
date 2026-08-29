module Amazonite::LambdaV1
  class EventError
    include JSON::Serializable

    @[JSON::Field(key: "Payload")]
    property payload : ErrorObject | Nil

    @[JSON::Field(key: "Truncated")]
    property truncated : Bool | Nil

    def initialize(
      @payload : ErrorObject | Nil = nil,
      @truncated : Bool | Nil = nil,
    )
    end
  end
end
