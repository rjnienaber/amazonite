module Amazonite::LambdaV1
  class DestinationConfig
    include JSON::Serializable

    @[JSON::Field(key: "OnSuccess")]
    property on_success : OnSuccess | Nil

    @[JSON::Field(key: "OnFailure")]
    property on_failure : OnFailure | Nil

    def initialize(
      @on_success : OnSuccess | Nil = nil,
      @on_failure : OnFailure | Nil = nil,
    )
    end
  end
end
