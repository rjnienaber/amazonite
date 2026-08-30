module Amazonite::CloudWatchV1
  class GetAlarmMuteRuleInput
    include JSON::Serializable

    # The name of the alarm mute rule to retrieve.
    @[JSON::Field(key: "AlarmMuteRuleName")]
    property alarm_mute_rule_name : String

    def initialize(
      @alarm_mute_rule_name : String,
    )
    end

    def_equals_and_hash(@alarm_mute_rule_name)
  end
end
