private alias Core = Amazonite::Core

module Amazonite::CloudWatch
  # Settings that change the content of the notifications and events that an alarm sends when its
  # state changes. These settings apply to the alarm's actions, whichever state triggers them.
  class ActionConfiguration
    include JSON::Serializable

    # Settings for including the alarm's tags in its action notifications and state-change events.
    @[JSON::Field(key: "AlarmTagsPropagation")]
    property alarm_tags_propagation : AlarmTagsPropagation | Nil

    def initialize(
      @alarm_tags_propagation : AlarmTagsPropagation | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @alarm_tags_propagation
        value.validate!
      end
    end

    def_equals_and_hash(@alarm_tags_propagation)
  end
end
