module Amazonite::LambdaV1
  class EventResult
    include JSON::Serializable

    @[JSON::Field(key: "Payload")]
    property payload : String | Nil

    @[JSON::Field(key: "Truncated")]
    property truncated : Bool | Nil

    def initialize(
      @payload : String | Nil = nil,
      @truncated : Bool | Nil = nil,
    )
    end
  end
end
