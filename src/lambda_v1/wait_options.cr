module Amazonite::LambdaV1
  class WaitOptions
    include JSON::Serializable

    @[JSON::Field(key: "WaitSeconds")]
    property wait_seconds : Int32 | Nil

    def initialize(
      @wait_seconds : Int32 | Nil = nil,
    )
    end
  end
end
