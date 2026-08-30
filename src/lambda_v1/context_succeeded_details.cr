module Amazonite::LambdaV1
  # Details about a context that succeeded.
  class ContextSucceededDetails
    include JSON::Serializable

    # The JSON response payload from the successful context.
    @[JSON::Field(key: "Result")]
    property result : EventResult

    def initialize(
      @result : EventResult,
    )
    end

    def_equals_and_hash(@result)
  end
end
