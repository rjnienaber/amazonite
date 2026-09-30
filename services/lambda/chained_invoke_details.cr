private alias Core = Amazonite::Core

module Amazonite::Lambda
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

    def validate! : Nil
      if value = @result
        raise Core::ValidationError.new("Result length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Result length must be <= 6291456") if value.size > 6291456
      end

      if value = @error
        value.validate!
      end
    end

    def_equals_and_hash(@result, @error)
  end
end
