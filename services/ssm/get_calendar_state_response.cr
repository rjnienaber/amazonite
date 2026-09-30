private alias AS = Amazonite::Ssm

module Amazonite::Ssm
  class GetCalendarStateResponse
    include JSON::Serializable

    # The state of the calendar. An `OPEN` calendar indicates that actions are allowed to proceed, and
    # a `CLOSED` calendar indicates that actions aren't allowed to proceed.
    @[JSON::Field(key: "State", converter: AS::CalendarState)]
    property state : CalendarState | Nil

    # The time, as an [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) string, that you specified in
    # your command. If you don't specify a time, `GetCalendarState` uses the current time.
    @[JSON::Field(key: "AtTime")]
    property at_time : String | Nil

    # The time, as an [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) string, that the calendar
    # state will change. If the current calendar state is `OPEN`, `NextTransitionTime` indicates when
    # the calendar state changes to `CLOSED`, and vice-versa.
    @[JSON::Field(key: "NextTransitionTime")]
    property next_transition_time : String | Nil

    def initialize(
      @state : CalendarState | Nil = nil,
      @at_time : String | Nil = nil,
      @next_transition_time : String | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@state, @at_time, @next_transition_time)
  end
end
