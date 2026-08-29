private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  class PutAlarmMuteRuleInput
    include JSON::Serializable

    # The name of the alarm mute rule. This name must be unique within your Amazon Web Services
    # account and region.
    @[JSON::Field(key: "Name")]
    property name : String

    # A description of the alarm mute rule that helps you identify its purpose.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # The configuration that defines when and how long alarms should be muted.
    @[JSON::Field(key: "Rule")]
    property rule : Rule

    # Specifies which alarms this rule applies to.
    @[JSON::Field(key: "MuteTargets")]
    property mute_targets : MuteTargets | Nil

    # A list of key-value pairs to associate with the alarm mute rule. You can use tags to categorize
    # and manage your mute rules.
    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    # The date and time after which the mute rule takes effect, specified as a timestamp in ISO 8601
    # format (for example, `2026-04-15T08:00:00Z`). If not specified, the mute rule takes effect
    # immediately upon creation and the mutes are applied as per the schedule expression.
    @[JSON::Field(key: "StartDate", converter: Core::AWSEpochConverter)]
    property start_date : Time | Nil

    # The date and time when the mute rule expires and is no longer evaluated, specified as a
    # timestamp in ISO 8601 format (for example, `2026-12-31T23:59:59Z`). After this time, the rule
    # status becomes EXPIRED and will no longer mute the targeted alarms.
    @[JSON::Field(key: "ExpireDate", converter: Core::AWSEpochConverter)]
    property expire_date : Time | Nil

    def initialize(
      @name : String,
      @rule : Rule,
      @description : String | Nil = nil,
      @mute_targets : MuteTargets | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @start_date : Time | Nil = nil,
      @expire_date : Time | Nil = nil,
    )
    end
  end
end
