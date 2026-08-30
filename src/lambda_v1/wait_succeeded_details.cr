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

    def_equals_and_hash(@duration)
  end
end
