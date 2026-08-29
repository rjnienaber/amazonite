module Amazonite::CloudWatchV1
  class ScheduleConfiguration
    include JSON::Serializable

    @[JSON::Field(key: "ScheduleExpression")]
    property schedule_expression : String

    @[JSON::Field(key: "StartTimeOffset")]
    property start_time_offset : Int64

    @[JSON::Field(key: "EndTimeOffset")]
    property end_time_offset : Int64 | Nil

    def initialize(
      @schedule_expression : String,
      @start_time_offset : Int64,
      @end_time_offset : Int64 | Nil = nil,
    )
    end
  end
end
