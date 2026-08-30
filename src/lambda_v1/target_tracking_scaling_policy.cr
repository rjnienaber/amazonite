private alias AL = Amazonite::LambdaV1
private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  # A scaling policy for the capacity provider that automatically adjusts capacity to maintain a
  # target value for a specific metric.
  class TargetTrackingScalingPolicy
    include JSON::Serializable

    # The predefined metric type to track for scaling decisions.
    @[JSON::Field(key: "PredefinedMetricType", converter: AL::CapacityProviderPredefinedMetricType)]
    property predefined_metric_type : CapacityProviderPredefinedMetricType

    # The target value for the metric that the scaling policy attempts to maintain through scaling
    # actions.
    @[JSON::Field(key: "TargetValue")]
    property target_value : Float64

    def initialize(
      @predefined_metric_type : CapacityProviderPredefinedMetricType,
      @target_value : Float64,
    )
    end

    def validate! : Nil
      if value = @target_value
        raise Core::ValidationError.new("TargetValue value must be >= 0") if value < 0
        raise Core::ValidationError.new("TargetValue value must be <= 100") if value > 100
      end
    end

    def_equals_and_hash(@predefined_metric_type, @target_value)
  end
end
