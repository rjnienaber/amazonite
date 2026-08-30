module Amazonite::LambdaV1
  # Details about a context that failed.
  class ContextFailedDetails
    include JSON::Serializable

    # Details about the context failure.
    @[JSON::Field(key: "Error")]
    property error : EventError

    def initialize(
      @error : EventError,
    )
    end
  end
end
