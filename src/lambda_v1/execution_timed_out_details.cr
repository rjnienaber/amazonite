module Amazonite::LambdaV1
  class ExecutionTimedOutDetails
    include JSON::Serializable

    @[JSON::Field(key: "Error")]
    property error : EventError | Nil

    def initialize(
      @error : EventError | Nil = nil,
    )
    end
  end
end
