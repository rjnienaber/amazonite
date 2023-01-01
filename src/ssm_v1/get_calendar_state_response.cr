private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class GetCalendarStateResponse
    include JSON::Serializable

    @[JSON::Field(key: "State", converter: AS::CalendarState)]
    property state : CalendarState | Nil

    @[JSON::Field(key: "AtTime")]
    property at_time : String | Nil

    @[JSON::Field(key: "NextTransitionTime")]
    property next_transition_time : String | Nil

    def initialize(
      @state : CalendarState | Nil = nil,
      @at_time : String | Nil = nil,
      @next_transition_time : String | Nil = nil
    )
    end
  end
end
