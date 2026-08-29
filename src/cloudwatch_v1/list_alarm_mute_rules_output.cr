module Amazonite::CloudWatchV1
  class ListAlarmMuteRulesOutput
    include JSON::Serializable

    @[JSON::Field(key: "AlarmMuteRuleSummaries")]
    property alarm_mute_rule_summaries : Array(AlarmMuteRuleSummary) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @alarm_mute_rule_summaries : Array(AlarmMuteRuleSummary) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
