private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  # Details about a durable execution context.
  class ContextDetails
    include JSON::Serializable

    # Whether the state data of child operations of this completed context should be included in the
    # invoke payload and `GetDurableExecutionState` response.
    @[JSON::Field(key: "ReplayChildren")]
    property replay_children : Bool | Nil

    # The response payload from the context.
    @[JSON::Field(key: "Result")]
    property result : String | Nil

    # Details about the context failure.
    @[JSON::Field(key: "Error")]
    property error : ErrorObject | Nil

    def initialize(
      @replay_children : Bool | Nil = nil,
      @result : String | Nil = nil,
      @error : ErrorObject | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @result
        raise Core::ValidationError.new("Result length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Result length must be <= 6291456") if value.size > 6291456
      end

      if value = @error
        value.validate!
      end
    end

    def_equals_and_hash(@replay_children, @result, @error)
  end
end
