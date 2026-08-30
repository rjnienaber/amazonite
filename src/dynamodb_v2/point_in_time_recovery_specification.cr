private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  # Represents the settings used to enable point in time recovery.
  class PointInTimeRecoverySpecification
    include JSON::Serializable

    # Indicates whether point in time recovery is enabled (true) or disabled (false) on the table.
    @[JSON::Field(key: "PointInTimeRecoveryEnabled")]
    property point_in_time_recovery_enabled : Bool

    # The number of preceding days for which continuous backups are taken and maintained. Your table
    # data is only recoverable to any point-in-time from within the configured recovery period. This
    # parameter is optional. If no value is provided, the value will default to 35.
    @[JSON::Field(key: "RecoveryPeriodInDays")]
    property recovery_period_in_days : Int32 | Nil

    def initialize(
      @point_in_time_recovery_enabled : Bool,
      @recovery_period_in_days : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @recovery_period_in_days
        raise Core::ValidationError.new("RecoveryPeriodInDays value must be >= 1") if value < 1
        raise Core::ValidationError.new("RecoveryPeriodInDays value must be <= 35") if value > 35
      end
    end

    def_equals_and_hash(@point_in_time_recovery_enabled, @recovery_period_in_days)
  end
end
