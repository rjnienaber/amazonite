module Amazonite::CloudWatchV1
  class WarmUpConfiguration
    include JSON::Serializable

    @[JSON::Field(key: "WarmUpPeriodDurationInMinutes")]
    property warm_up_period_duration_in_minutes : Int32

    @[JSON::Field(key: "OnlyStartEvaluatingAfterWarmUpPeriodEnds")]
    property only_start_evaluating_after_warm_up_period_ends : Bool | Nil

    def initialize(
      @warm_up_period_duration_in_minutes : Int32,
      @only_start_evaluating_after_warm_up_period_ends : Bool | Nil = nil,
    )
    end
  end
end
