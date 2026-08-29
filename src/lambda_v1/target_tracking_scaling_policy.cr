private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  class TargetTrackingScalingPolicy
    include JSON::Serializable

    @[JSON::Field(key: "PredefinedMetricType", converter: AL::CapacityProviderPredefinedMetricType)]
    property predefined_metric_type : CapacityProviderPredefinedMetricType

    @[JSON::Field(key: "TargetValue")]
    property target_value : Float64

    def initialize(
      @predefined_metric_type : CapacityProviderPredefinedMetricType,
      @target_value : Float64,
    )
    end
  end
end
