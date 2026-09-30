private alias AL = Amazonite::Lambda
private alias Core = Amazonite::Core

module Amazonite::Lambda
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

    def validate! : Nil
      if value = @function_arn
        raise Core::ValidationError.new("FunctionArn length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("FunctionArn length must be <= 10000") if value.size > 10000
        raise Core::ValidationError.new("FunctionArn does not match the required pattern") unless value.matches?(Regex.new("^arn:(aws[a-zA-Z-]*)?:lambda:(eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:\\d{12}:function:[a-zA-Z0-9-_\\.]+(:(\\$LATEST(\\.PUBLISHED)?|[a-zA-Z0-9-_]+))?$"))
      end
    end

    def_equals_and_hash(@function_arn, @state)
  end
end
