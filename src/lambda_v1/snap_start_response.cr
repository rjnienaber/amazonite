private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  # The function's [SnapStart](https://docs.aws.amazon.com/lambda/latest/dg/snapstart.html) setting.
  class SnapStartResponse
    include JSON::Serializable

    # When set to `PublishedVersions`, Lambda creates a snapshot of the execution environment when you
    # publish a function version.
    @[JSON::Field(key: "ApplyOn", converter: AL::SnapStartApplyOn)]
    property apply_on : SnapStartApplyOn | Nil

    # When you provide a [qualified Amazon Resource Name
    # (ARN)](https://docs.aws.amazon.com/lambda/latest/dg/configuration-versions.html#versioning-versions-using),
    # this response element indicates whether SnapStart is activated for the specified function
    # version.
    @[JSON::Field(key: "OptimizationStatus", converter: AL::SnapStartOptimizationStatus)]
    property optimization_status : SnapStartOptimizationStatus | Nil

    def initialize(
      @apply_on : SnapStartApplyOn | Nil = nil,
      @optimization_status : SnapStartOptimizationStatus | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@apply_on, @optimization_status)
  end
end
