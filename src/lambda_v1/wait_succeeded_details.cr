private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  # Details about a wait operation that succeeded.
  class WaitSucceededDetails
    include JSON::Serializable

    # The wait duration, in seconds.
    @[JSON::Field(key: "Duration")]
    property duration : Int32 | Nil

    def initialize(
      @duration : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @duration
        raise Core::ValidationError.new("Duration value must be >= 0") if value < 0
      end
    end

    def_equals_and_hash(@duration)
  end
end
