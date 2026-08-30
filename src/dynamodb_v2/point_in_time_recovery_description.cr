private alias ADDB = Amazonite::DynamoDBV2
private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  # The description of the point in time settings applied to the table.
  class PointInTimeRecoveryDescription
    include JSON::Serializable

    # The current state of point in time recovery:
    #
    # - `ENABLED` - Point in time recovery is enabled.
    #
    # - `DISABLED` - Point in time recovery is disabled.
    @[JSON::Field(key: "PointInTimeRecoveryStatus", converter: ADDB::PointInTimeRecoveryStatus)]
    property point_in_time_recovery_status : PointInTimeRecoveryStatus | Nil

    # The number of preceding days for which continuous backups are taken and maintained. Your table
    # data is only recoverable to any point-in-time from within the configured recovery period. This
    # parameter is optional.
    @[JSON::Field(key: "RecoveryPeriodInDays")]
    property recovery_period_in_days : Int32 | Nil

    # Specifies the earliest point in time you can restore your table to. You can restore your table
    # to any point in time during the last 35 days.
    @[JSON::Field(key: "EarliestRestorableDateTime", converter: Core::AWSEpochConverter)]
    property earliest_restorable_date_time : Time | Nil

    # `LatestRestorableDateTime` is typically 5 minutes before the current time.
    @[JSON::Field(key: "LatestRestorableDateTime", converter: Core::AWSEpochConverter)]
    property latest_restorable_date_time : Time | Nil

    def initialize(
      @point_in_time_recovery_status : PointInTimeRecoveryStatus | Nil = nil,
      @recovery_period_in_days : Int32 | Nil = nil,
      @earliest_restorable_date_time : Time | Nil = nil,
      @latest_restorable_date_time : Time | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @recovery_period_in_days
        raise Core::ValidationError.new("RecoveryPeriodInDays value must be >= 1") if value < 1
        raise Core::ValidationError.new("RecoveryPeriodInDays value must be <= 35") if value > 35
      end
    end

    def_equals_and_hash(@point_in_time_recovery_status, @recovery_period_in_days, @earliest_restorable_date_time, @latest_restorable_date_time)
  end
end
