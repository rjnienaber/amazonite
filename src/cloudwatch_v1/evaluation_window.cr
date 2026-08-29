module Amazonite::CloudWatchV1
  class EvaluationWindow
    include JSON::Serializable

    @[JSON::Field(key: "WallClockWindow")]
    property wall_clock_window : WallClockWindow | Nil

    @[JSON::Field(key: "SlidingWindow")]
    property sliding_window : SlidingWindow | Nil

    def initialize(
      @wall_clock_window : WallClockWindow | Nil = nil,
      @sliding_window : SlidingWindow | Nil = nil,
    )
    end
  end
end
