private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  # Information about a function version that uses a specific capacity provider, including its ARN
  # and current state.
  class FunctionVersionsByCapacityProviderListItem
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the function version.
    @[JSON::Field(key: "FunctionArn")]
    property function_arn : String

    # The current state of the function version.
    @[JSON::Field(key: "State", converter: AL::State)]
    property state : State

    def initialize(
      @function_arn : String,
      @state : State,
    )
    end

    def_equals_and_hash(@function_arn, @state)
  end
end
