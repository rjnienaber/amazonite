module Amazonite::CloudWatchV1
  class ListAlarmMuteRulesOutput
    include JSON::Serializable

    # A list of alarm mute rule summaries.
    @[JSON::Field(key: "AlarmMuteRuleSummaries")]
    property alarm_mute_rule_summaries : Array(AlarmMuteRuleSummary) | Nil

    # The token to use when requesting the next set of results. If this field is absent, there are no
    # more results to retrieve.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @alarm_mute_rule_summaries : Array(AlarmMuteRuleSummary) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
