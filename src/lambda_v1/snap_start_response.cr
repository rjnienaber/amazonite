private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  class SnapStartResponse
    include JSON::Serializable

    @[JSON::Field(key: "ApplyOn", converter: AL::SnapStartApplyOn)]
    property apply_on : SnapStartApplyOn | Nil

    @[JSON::Field(key: "OptimizationStatus", converter: AL::SnapStartOptimizationStatus)]
    property optimization_status : SnapStartOptimizationStatus | Nil

    def initialize(
      @apply_on : SnapStartApplyOn | Nil = nil,
      @optimization_status : SnapStartOptimizationStatus | Nil = nil,
    )
    end
  end
end
