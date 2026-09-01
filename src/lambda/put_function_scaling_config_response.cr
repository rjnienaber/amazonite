private alias AL = Amazonite::Lambda

module Amazonite::Lambda
  class PutFunctionScalingConfigResponse
    include JSON::Serializable

    # The current state of the function after applying the scaling configuration.
    @[JSON::Field(key: "FunctionState", converter: AL::State)]
    property function_state : State | Nil

    def initialize(
      @function_state : State | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@function_state)
  end
end
