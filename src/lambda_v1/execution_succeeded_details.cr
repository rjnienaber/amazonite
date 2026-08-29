module Amazonite::LambdaV1
  class ExecutionSucceededDetails
    include JSON::Serializable

    @[JSON::Field(key: "Result")]
    property result : EventResult

    def initialize(
      @result : EventResult,
    )
    end
  end
end
