module Amazonite::LambdaV1
  class ExecutionFailedDetails
    include JSON::Serializable

    @[JSON::Field(key: "Error")]
    property error : EventError

    def initialize(
      @error : EventError,
    )
    end
  end
end
