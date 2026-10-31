private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  # Describes the estimated effect of an account-level retention policy change on one log group.
  class LogGroupImpact
    include JSON::Serializable

    # The name of the log group.
    @[JSON::Field(key: "logGroupName")]
    property log_group_name : String | Nil

    # The current effective retention period of the log group, in days. A value of `NEVER_EXPIRE`
    # indicates that log events in the log group never expire.
    @[JSON::Field(key: "currentRetention")]
    property current_retention : String | Nil

    # The effective retention period of the log group, in days, after the change. A value of
    # `NEVER_EXPIRE` indicates that log events in the log group would never expire.
    @[JSON::Field(key: "proposedRetention")]
    property proposed_retention : String | Nil

    # The number of bytes stored in the log group.
    @[JSON::Field(key: "storedBytes")]
    property stored_bytes : Int64 | Nil

    def initialize(
      @log_group_name : String | Nil = nil,
      @current_retention : String | Nil = nil,
      @proposed_retention : String | Nil = nil,
      @stored_bytes : Int64 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @log_group_name
        raise Core::ValidationError.new("logGroupName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("logGroupName length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("logGroupName does not match the required pattern") unless value.matches?(Regex.new("^[\\.\\-_/#A-Za-z0-9]+$"))
      end

      if value = @current_retention
        raise Core::ValidationError.new("currentRetention length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("currentRetention length must be <= 12") if value.size > 12
      end

      if value = @proposed_retention
        raise Core::ValidationError.new("proposedRetention length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("proposedRetention length must be <= 12") if value.size > 12
      end

      if value = @stored_bytes
        raise Core::ValidationError.new("storedBytes value must be >= 0") if value < 0
      end
    end

    def_equals_and_hash(@log_group_name, @current_retention, @proposed_retention, @stored_bytes)
  end
end
