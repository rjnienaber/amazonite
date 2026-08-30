private alias ACW = Amazonite::CloudWatchV1
private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  # Summary information about an alarm mute rule, including its name, status, and configuration
  # details.
  class AlarmMuteRuleSummary
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the alarm mute rule.
    @[JSON::Field(key: "AlarmMuteRuleArn")]
    property alarm_mute_rule_arn : String | Nil

    # The date and time when the mute rule expires and is no longer evaluated. This field is only
    # present if an expiration date was configured.
    @[JSON::Field(key: "ExpireDate", converter: Core::AWSEpochConverter)]
    property expire_date : Time | Nil

    # The current status of the alarm mute rule. Valid values are `SCHEDULED`, `ACTIVE`, or `EXPIRED`.
    @[JSON::Field(key: "Status", converter: ACW::AlarmMuteRuleStatus)]
    property status : AlarmMuteRuleStatus | Nil

    # Indicates whether the mute rule is one-time or recurring. Valid values are `ONE_TIME` or
    # `RECURRING`.
    @[JSON::Field(key: "MuteType")]
    property mute_type : String | Nil

    # The date and time when the mute rule was last updated.
    @[JSON::Field(key: "LastUpdatedTimestamp", converter: Core::AWSEpochConverter)]
    property last_updated_timestamp : Time | Nil

    def initialize(
      @alarm_mute_rule_arn : String | Nil = nil,
      @expire_date : Time | Nil = nil,
      @status : AlarmMuteRuleStatus | Nil = nil,
      @mute_type : String | Nil = nil,
      @last_updated_timestamp : Time | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @alarm_mute_rule_arn
        raise Core::ValidationError.new("AlarmMuteRuleArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("AlarmMuteRuleArn length must be <= 1600") if value.size > 1600
      end
    end

    def_equals_and_hash(@alarm_mute_rule_arn, @expire_date, @status, @mute_type, @last_updated_timestamp)
  end
end
