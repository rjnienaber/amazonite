private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  class FunctionVersionsByCapacityProviderListItem
    include JSON::Serializable

    @[JSON::Field(key: "FunctionArn")]
    property function_arn : String

    @[JSON::Field(key: "State", converter: AL::State)]
    property state : State

    def initialize(
      @function_arn : String,
      @state : State,
    )
    end
  end
end
