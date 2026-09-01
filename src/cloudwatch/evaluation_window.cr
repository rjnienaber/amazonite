private alias Core = Amazonite::Core

module Amazonite::CloudWatch
  # The evaluation window that an alarm uses to select the range of metric data that it evaluates
  # each time it runs. This is a union type. Set exactly one of its members, `SlidingWindow` or
  # `WallClockWindow`. If you don't set `EvaluationWindow`, the alarm uses a `SlidingWindow` by
  # default.
  #
  # For more information, see [Alarm evaluation
  # windows](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/alarm-evaluation-window.html)
  # in the *CloudWatch User Guide*.
  class EvaluationWindow
    include JSON::Serializable

    # A wall clock window, which aligns the evaluated range to fixed clock boundaries that match the
    # alarm's period, such as the top of the hour, midnight, or the start of the calendar week.
    @[JSON::Field(key: "WallClockWindow")]
    property wall_clock_window : WallClockWindow | Nil

    # A sliding window, which advances each time the alarm is evaluated, forming a rolling time
    # window. This is the default evaluation window.
    @[JSON::Field(key: "SlidingWindow")]
    property sliding_window : SlidingWindow | Nil

    def initialize(
      @wall_clock_window : WallClockWindow | Nil = nil,
      @sliding_window : SlidingWindow | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @wall_clock_window
        value.validate!
      end

      if value = @sliding_window
        value.validate!
      end
    end

    def_equals_and_hash(@wall_clock_window, @sliding_window)
  end
end
