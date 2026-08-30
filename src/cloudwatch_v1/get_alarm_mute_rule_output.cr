private alias ACW = Amazonite::CloudWatchV1
private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  class GetAlarmMuteRuleOutput
    include JSON::Serializable

    # The name of the alarm mute rule.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The Amazon Resource Name (ARN) of the alarm mute rule.
    @[JSON::Field(key: "AlarmMuteRuleArn")]
    property alarm_mute_rule_arn : String | Nil

    # The description of the alarm mute rule.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # The configuration that defines when and how long alarms are muted.
    @[JSON::Field(key: "Rule")]
    property rule : Rule | Nil

    # Specifies which alarms this rule applies to.
    @[JSON::Field(key: "MuteTargets")]
    property mute_targets : MuteTargets | Nil

    # The date and time when the mute rule becomes active. If not set, the rule is active immediately.
    @[JSON::Field(key: "StartDate", converter: Core::AWSEpochConverter)]
    property start_date : Time | Nil

    # The date and time when the mute rule expires and is no longer evaluated.
    @[JSON::Field(key: "ExpireDate", converter: Core::AWSEpochConverter)]
    property expire_date : Time | Nil

    # The current status of the alarm mute rule. Valid values are `SCHEDULED`, `ACTIVE`, or `EXPIRED`.
    @[JSON::Field(key: "Status", converter: ACW::AlarmMuteRuleStatus)]
    property status : AlarmMuteRuleStatus | Nil

    # The date and time when the mute rule was last updated.
    @[JSON::Field(key: "LastUpdatedTimestamp", converter: Core::AWSEpochConverter)]
    property last_updated_timestamp : Time | Nil

    # Indicates whether the mute rule is one-time or recurring. Valid values are `ONE_TIME` or
    # `RECURRING`.
    @[JSON::Field(key: "MuteType")]
    property mute_type : String | Nil

    def initialize(
      @name : String | Nil = nil,
      @alarm_mute_rule_arn : String | Nil = nil,
      @description : String | Nil = nil,
      @rule : Rule | Nil = nil,
      @mute_targets : MuteTargets | Nil = nil,
      @start_date : Time | Nil = nil,
      @expire_date : Time | Nil = nil,
      @status : AlarmMuteRuleStatus | Nil = nil,
      @last_updated_timestamp : Time | Nil = nil,
      @mute_type : String | Nil = nil,
    )
    end
  end
end
