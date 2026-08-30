module Amazonite::LambdaV1
  # Specifies how long to pause the durable execution.
  class WaitOptions
    include JSON::Serializable

    # The duration to wait, in seconds.
    @[JSON::Field(key: "WaitSeconds")]
    property wait_seconds : Int32 | Nil

    def initialize(
      @wait_seconds : Int32 | Nil = nil,
    )
    end
  end
end
