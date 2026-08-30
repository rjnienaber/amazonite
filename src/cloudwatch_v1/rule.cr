private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  # Defines the schedule configuration for an alarm mute rule.
  #
  # The rule contains a schedule that specifies when and how long alarms should be muted. The
  # schedule can be a recurring pattern using cron expressions or a one-time mute window using at
  # expressions.
  class Rule
    include JSON::Serializable

    # The schedule configuration that defines when the mute rule activates and how long it remains
    # active.
    @[JSON::Field(key: "Schedule")]
    property schedule : Schedule

    def initialize(
      @schedule : Schedule,
    )
    end

    def validate! : Nil
      if value = @schedule
        value.validate!
      end
    end

    def_equals_and_hash(@schedule)
  end
end
