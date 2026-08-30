module Amazonite::SsmV1
  class GetCalendarStateRequest
    include JSON::Serializable

    # The names of Amazon Resource Names (ARNs) of the Systems Manager documents (SSM documents) that
    # represent the calendar entries for which you want to get the state.
    @[JSON::Field(key: "CalendarNames")]
    property calendar_names : Array(String) = [] of String

    # (Optional) The specific time for which you want to get calendar state information, in [ISO
    # 8601](https://en.wikipedia.org/wiki/ISO_8601) format. If you don't specify a value or `AtTime`,
    # the current time is used.
    @[JSON::Field(key: "AtTime")]
    property at_time : String | Nil

    def initialize(
      @calendar_names : Array(String),
      @at_time : String | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@calendar_names, @at_time)
  end
end
