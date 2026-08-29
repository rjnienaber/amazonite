module Amazonite::CloudWatchV1
  class GetAlarmMuteRuleInput
    include JSON::Serializable

    @[JSON::Field(key: "AlarmMuteRuleName")]
    property alarm_mute_rule_name : String

    def initialize(
      @alarm_mute_rule_name : String,
    )
    end
  end
end
