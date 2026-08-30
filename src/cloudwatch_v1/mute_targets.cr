private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  # Specifies which alarms an alarm mute rule applies to.
  #
  # You can target up to 100 specific alarms by name. When a mute rule is active, the targeted
  # alarms continue to evaluate metrics and transition between states, but their configured actions
  # are muted.
  class MuteTargets
    include JSON::Serializable

    # The list of alarm names that this mute rule targets. You can specify up to 100 alarm names.
    #
    # Each alarm name must be between 1 and 255 characters in length. The alarm names must match
    # existing alarms in your Amazon Web Services account and region.
    @[JSON::Field(key: "AlarmNames")]
    property alarm_names : Array(String) = [] of String

    def initialize(
      @alarm_names : Array(String),
    )
    end

    def validate! : Nil
      if value = @alarm_names
        raise Core::ValidationError.new("AlarmNames must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("AlarmNames must have at most 100 item(s)") if value.size > 100
      end
    end

    def_equals_and_hash(@alarm_names)
  end
end
