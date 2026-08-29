module Amazonite::LambdaV1
  class ScalingConfig
    include JSON::Serializable

    @[JSON::Field(key: "MaximumConcurrency")]
    property maximum_concurrency : Int32 | Nil

    def initialize(
      @maximum_concurrency : Int32 | Nil = nil,
    )
    end
  end
end
