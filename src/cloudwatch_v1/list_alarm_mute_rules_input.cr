private alias ACW = Amazonite::CloudWatchV1
private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  class ListAlarmMuteRulesInput
    include JSON::Serializable

    # Filter results to show only mute rules that target the specified alarm name.
    @[JSON::Field(key: "AlarmName")]
    property alarm_name : String | Nil

    # Filter results to show only mute rules with the specified statuses. Valid values are
    # `SCHEDULED`, `ACTIVE`, or `EXPIRED`.
    @[JSON::Field(key: "Statuses", converter: Core::ArrayConverter(ACW::AlarmMuteRuleStatus))]
    property statuses : Array(AlarmMuteRuleStatus) | Nil

    # The maximum number of mute rules to return in one call. The default is 50.
    @[JSON::Field(key: "MaxRecords")]
    property max_records : Int32 | Nil

    # The token returned from a previous call to indicate where to continue retrieving results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @alarm_name : String | Nil = nil,
      @statuses : Array(AlarmMuteRuleStatus) | Nil = nil,
      @max_records : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @alarm_name
        raise Core::ValidationError.new("AlarmName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("AlarmName length must be <= 255") if value.size > 255
      end

      if value = @max_records
        raise Core::ValidationError.new("MaxRecords value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxRecords value must be <= 100") if value > 100
      end
    end

    def_equals_and_hash(@alarm_name, @statuses, @max_records, @next_token)
  end
end
