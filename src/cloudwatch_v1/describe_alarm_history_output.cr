private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  class DescribeAlarmHistoryOutput
    include JSON::Serializable

    # The alarm histories, in JSON format.
    @[JSON::Field(key: "AlarmHistoryItems")]
    property alarm_history_items : Array(AlarmHistoryItem) | Nil

    # The token that marks the start of the next batch of returned results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @alarm_history_items : Array(AlarmHistoryItem) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @alarm_history_items
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@alarm_history_items, @next_token)
  end
end
