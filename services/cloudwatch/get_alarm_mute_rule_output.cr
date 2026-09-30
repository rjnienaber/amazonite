private alias ACW = Amazonite::CloudWatch
private alias Core = Amazonite::Core

module Amazonite::CloudWatch
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

    def validate! : Nil
      if value = @name
        raise Core::ValidationError.new("Name length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Name length must be <= 255") if value.size > 255
      end

      if value = @alarm_mute_rule_arn
        raise Core::ValidationError.new("AlarmMuteRuleArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("AlarmMuteRuleArn length must be <= 1600") if value.size > 1600
      end

      if value = @description
        raise Core::ValidationError.new("Description length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Description length must be <= 1024") if value.size > 1024
      end

      if value = @rule
        value.validate!
      end

      if value = @mute_targets
        value.validate!
      end
    end

    def_equals_and_hash(@name, @alarm_mute_rule_arn, @description, @rule, @mute_targets, @start_date, @expire_date, @status, @last_updated_timestamp, @mute_type)
  end
end
