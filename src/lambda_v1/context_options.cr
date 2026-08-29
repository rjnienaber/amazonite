module Amazonite::LambdaV1
  class ContextOptions
    include JSON::Serializable

    @[JSON::Field(key: "ReplayChildren")]
    property replay_children : Bool | Nil

    def initialize(
      @replay_children : Bool | Nil = nil,
    )
    end
  end
end
