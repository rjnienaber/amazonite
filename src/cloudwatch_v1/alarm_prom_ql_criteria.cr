private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  # Contains the configuration that determines how a PromQL alarm evaluates its contributors,
  # including the query to run and the durations that define when contributors transition between
  # states.
  class AlarmPromQLCriteria
    include JSON::Serializable

    # The PromQL query that the alarm evaluates. The query must return a result of vector type. Each
    # entry in the vector result represents an alarm contributor.
    @[JSON::Field(key: "Query")]
    property query : String

    # The duration, in seconds, that a contributor must be continuously breaching before it
    # transitions to the `ALARM` state.
    @[JSON::Field(key: "PendingPeriod")]
    property pending_period : Int32 | Nil

    # The duration, in seconds, that a contributor must continuously not be breaching before it
    # transitions back to the `OK` state.
    @[JSON::Field(key: "RecoveryPeriod")]
    property recovery_period : Int32 | Nil

    def initialize(
      @query : String,
      @pending_period : Int32 | Nil = nil,
      @recovery_period : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @query
        raise Core::ValidationError.new("Query length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Query length must be <= 10000") if value.size > 10000
      end

      if value = @pending_period
        raise Core::ValidationError.new("PendingPeriod value must be >= 0") if value < 0
        raise Core::ValidationError.new("PendingPeriod value must be <= 86400") if value > 86400
      end

      if value = @recovery_period
        raise Core::ValidationError.new("RecoveryPeriod value must be >= 0") if value < 0
        raise Core::ValidationError.new("RecoveryPeriod value must be <= 86400") if value > 86400
      end
    end

    def_equals_and_hash(@query, @pending_period, @recovery_period)
  end
end
