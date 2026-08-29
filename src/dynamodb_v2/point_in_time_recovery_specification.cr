module Amazonite::DynamoDBV2
  class PointInTimeRecoverySpecification
    include JSON::Serializable

    @[JSON::Field(key: "PointInTimeRecoveryEnabled")]
    property point_in_time_recovery_enabled : Bool

    @[JSON::Field(key: "RecoveryPeriodInDays")]
    property recovery_period_in_days : Int32 | Nil

    def initialize(
      @point_in_time_recovery_enabled : Bool,
      @recovery_period_in_days : Int32 | Nil = nil,
    )
    end
  end
end
