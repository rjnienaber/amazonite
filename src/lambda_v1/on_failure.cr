module Amazonite::LambdaV1
  class OnFailure
    include JSON::Serializable

    @[JSON::Field(key: "Destination")]
    property destination : String | Nil

    def initialize(
      @destination : String | Nil = nil,
    )
    end
  end
end
