module Amazonite::CloudWatchV1
  class DescribeAlarmHistoryOutput
    include JSON::Serializable

    @[JSON::Field(key: "AlarmHistoryItems")]
    property alarm_history_items : Array(AlarmHistoryItem) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @alarm_history_items : Array(AlarmHistoryItem) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
