module Amazonite::LambdaV1
  class EphemeralStorage
    include JSON::Serializable

    @[JSON::Field(key: "Size")]
    property size : Int32

    def initialize(
      @size : Int32,
    )
    end
  end
end
