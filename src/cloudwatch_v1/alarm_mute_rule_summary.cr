private alias ACW = Amazonite::CloudWatchV1
private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  class AlarmMuteRuleSummary
    include JSON::Serializable

    @[JSON::Field(key: "AlarmMuteRuleArn")]
    property alarm_mute_rule_arn : String | Nil

    @[JSON::Field(key: "ExpireDate", converter: Core::AWSEpochConverter)]
    property expire_date : Time | Nil

    @[JSON::Field(key: "Status", converter: ACW::AlarmMuteRuleStatus)]
    property status : AlarmMuteRuleStatus | Nil

    @[JSON::Field(key: "MuteType")]
    property mute_type : String | Nil

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
  end
end
