private alias Core = Amazonite::Core

module Amazonite::EventBridge
  # A `RetryPolicy` object that includes information about the retry policy settings.
  class RetryPolicy
    include JSON::Serializable

    # The maximum number of retry attempts to make before the request fails. Retry attempts continue
    # until either the maximum number of attempts is made or until the duration of the
    # `MaximumEventAgeInSeconds` is met.
    @[JSON::Field(key: "MaximumRetryAttempts")]
    property maximum_retry_attempts : Int32 | Nil

    # The maximum amount of time, in seconds, to continue to make retry attempts.
    @[JSON::Field(key: "MaximumEventAgeInSeconds")]
    property maximum_event_age_in_seconds : Int32 | Nil

    def initialize(
      @maximum_retry_attempts : Int32 | Nil = nil,
      @maximum_event_age_in_seconds : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @maximum_retry_attempts
        raise Core::ValidationError.new("MaximumRetryAttempts value must be >= 0") if value < 0
        raise Core::ValidationError.new("MaximumRetryAttempts value must be <= 185") if value > 185
      end

      if value = @maximum_event_age_in_seconds
        raise Core::ValidationError.new("MaximumEventAgeInSeconds value must be >= 60") if value < 60
        raise Core::ValidationError.new("MaximumEventAgeInSeconds value must be <= 86400") if value > 86400
      end
    end

    def_equals_and_hash(@maximum_retry_attempts, @maximum_event_age_in_seconds)
  end
end
