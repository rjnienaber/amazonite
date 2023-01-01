module Amazonite::SsmV1
  class GetCalendarStateRequest
    include JSON::Serializable

    @[JSON::Field(key: "CalendarNames")]
    property calendar_names : Array(String)

    @[JSON::Field(key: "AtTime")]
    property at_time : String | Nil

    def initialize(
      @calendar_names : Array(String),
      @at_time : String | Nil = nil
    )
    end
  end
end
