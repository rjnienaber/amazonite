module Amazonite::EventBridgeV1
  class TestEventPatternResponse
    include JSON::Serializable

    # Indicates whether the event matches the event pattern.
    @[JSON::Field(key: "Result")]
    property result : Bool | Nil

    def initialize(
      @result : Bool | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@result)
  end
end
