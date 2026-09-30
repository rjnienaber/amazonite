private alias Core = Amazonite::Core

module Amazonite::Lambda
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

    def validate! : Nil
      if value = @wait_seconds
        raise Core::ValidationError.new("WaitSeconds value must be >= 0") if value < 0
      end
    end

    def_equals_and_hash(@wait_seconds)
  end
end
