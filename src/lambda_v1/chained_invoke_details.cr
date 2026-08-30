module Amazonite::LambdaV1
  # Contains details about a chained function invocation in a durable execution, including the
  # target function and invocation parameters.
  class ChainedInvokeDetails
    include JSON::Serializable

    # The response payload from the chained invocation.
    @[JSON::Field(key: "Result")]
    property result : String | Nil

    # Details about the chained invocation failure.
    @[JSON::Field(key: "Error")]
    property error : ErrorObject | Nil

    def initialize(
      @result : String | Nil = nil,
      @error : ErrorObject | Nil = nil,
    )
    end

    def_equals_and_hash(@result, @error)
  end
end
