private alias Core = Amazonite::Core

module Amazonite::Kinesis
  # The configuration attributes for a queue.
  class QueueAttributes
    include JSON::Serializable

    # The duration, in seconds, that a record is in flight and not visible to any consumer instance
    # after it is received. A record that is not acknowledged before this duration elapses becomes
    # visible in the queue again and can be received by any consumer instance. If you omit this
    # attribute when you create a queue, the queue uses 30 seconds.
    @[JSON::Field(key: "VisibilityTimeoutSeconds")]
    property visibility_timeout_seconds : Int32 | Nil

    # The dead-letter handling configuration for the queue. If you omit this attribute, dead-letter
    # handling is enabled with a `MaxReceiveCount` of 6. If you specify it with a `TargetType` of
    # `BUILT_IN`, you must also specify `MaxReceiveCount`.
    @[JSON::Field(key: "DeadLetterConfiguration")]
    property dead_letter_configuration : DeadLetterConfiguration | Nil

    def initialize(
      @visibility_timeout_seconds : Int32 | Nil = nil,
      @dead_letter_configuration : DeadLetterConfiguration | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @visibility_timeout_seconds
        raise Core::ValidationError.new("VisibilityTimeoutSeconds value must be >= 0") if value < 0
        raise Core::ValidationError.new("VisibilityTimeoutSeconds value must be <= 43200") if value > 43200
      end

      if value = @dead_letter_configuration
        value.validate!
      end
    end

    def_equals_and_hash(@visibility_timeout_seconds, @dead_letter_configuration)
  end
end
