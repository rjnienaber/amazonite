module Amazonite::LambdaV1
  class WaitCancelledDetails
    include JSON::Serializable

    @[JSON::Field(key: "Error")]
    property error : EventError | Nil

    def initialize(
      @error : EventError | Nil = nil,
    )
    end
  end
end
