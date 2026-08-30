private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  # Contains the schedule expression and time-range offsets that define when a scheduled query runs
  # and what time range each execution covers.
  class ScheduleConfiguration
    include JSON::Serializable

    # The schedule expression that defines how often the underlying CloudWatch Logs scheduled query
    # runs. Specify a `rate()` expression, for example `rate(5 minutes)`.
    @[JSON::Field(key: "ScheduleExpression")]
    property schedule_expression : String

    # The offset, in seconds, before the scheduled execution time at which the query time range
    # begins. For example, an offset of 360 (6 minutes) on a query running at 12:05:00 starts the
    # query time range at 11:59:00.
    @[JSON::Field(key: "StartTimeOffset")]
    property start_time_offset : Int64

    # The offset, in seconds, before the scheduled execution time at which the query time range ends.
    # Must be non-negative and less than `StartTimeOffset`. The default is 0.
    @[JSON::Field(key: "EndTimeOffset")]
    property end_time_offset : Int64 | Nil

    def initialize(
      @schedule_expression : String,
      @start_time_offset : Int64,
      @end_time_offset : Int64 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @schedule_expression
        raise Core::ValidationError.new("ScheduleExpression length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ScheduleExpression length must be <= 256") if value.size > 256
      end

      if value = @start_time_offset
        raise Core::ValidationError.new("StartTimeOffset value must be >= 1") if value < 1
        raise Core::ValidationError.new("StartTimeOffset value must be <= 2592000") if value > 2592000
      end

      if value = @end_time_offset
        raise Core::ValidationError.new("EndTimeOffset value must be >= 0") if value < 0
        raise Core::ValidationError.new("EndTimeOffset value must be <= 2592000") if value > 2592000
      end
    end

    def_equals_and_hash(@schedule_expression, @start_time_offset, @end_time_offset)
  end
end
