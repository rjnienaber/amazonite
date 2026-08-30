private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  class DeleteAlarmMuteRuleInput
    include JSON::Serializable

    # The name of the alarm mute rule to delete.
    @[JSON::Field(key: "AlarmMuteRuleName")]
    property alarm_mute_rule_name : String

    def initialize(
      @alarm_mute_rule_name : String,
    )
    end

    def validate! : Nil
      if value = @alarm_mute_rule_name
        raise Core::ValidationError.new("AlarmMuteRuleName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("AlarmMuteRuleName length must be <= 255") if value.size > 255
      end
    end

    def_equals_and_hash(@alarm_mute_rule_name)
  end
end
