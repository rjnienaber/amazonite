module Amazonite::LambdaV1
  class ChainedInvokeTimedOutDetails
    include JSON::Serializable

    @[JSON::Field(key: "Error")]
    property error : EventError

    def initialize(
      @error : EventError,
    )
    end
  end
end
