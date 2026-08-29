module Amazonite::LambdaV1
  class ContextSucceededDetails
    include JSON::Serializable

    @[JSON::Field(key: "Result")]
    property result : EventResult

    def initialize(
      @result : EventResult,
    )
    end
  end
end
