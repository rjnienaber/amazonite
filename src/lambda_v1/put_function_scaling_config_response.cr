private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  class PutFunctionScalingConfigResponse
    include JSON::Serializable

    # The current state of the function after applying the scaling configuration.
    @[JSON::Field(key: "FunctionState", converter: AL::State)]
    property function_state : State | Nil

    def initialize(
      @function_state : State | Nil = nil,
    )
    end
  end
end
