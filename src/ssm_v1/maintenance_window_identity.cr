private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # Information about the maintenance window.
  class MaintenanceWindowIdentity
    include JSON::Serializable

    # The ID of the maintenance window.
    @[JSON::Field(key: "WindowId")]
    property window_id : String | Nil

    # The name of the maintenance window.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # A description of the maintenance window.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # Indicates whether the maintenance window is enabled.
    @[JSON::Field(key: "Enabled")]
    property enabled : Bool | Nil

    # The duration of the maintenance window in hours.
    @[JSON::Field(key: "Duration")]
    property duration : Int32 | Nil

    # The number of hours before the end of the maintenance window that Amazon Web Services Systems
    # Manager stops scheduling new tasks for execution.
    @[JSON::Field(key: "Cutoff")]
    property cutoff : Int32 | Nil

    # The schedule of the maintenance window in the form of a cron or rate expression.
    @[JSON::Field(key: "Schedule")]
    property schedule : String | Nil

    # The time zone that the scheduled maintenance window executions are based on, in Internet
    # Assigned Numbers Authority (IANA) format.
    @[JSON::Field(key: "ScheduleTimezone")]
    property schedule_timezone : String | Nil

    # The number of days to wait to run a maintenance window after the scheduled cron expression date
    # and time.
    @[JSON::Field(key: "ScheduleOffset")]
    property schedule_offset : Int32 | Nil

    # The date and time, in ISO-8601 Extended format, for when the maintenance window is scheduled to
    # become inactive.
    @[JSON::Field(key: "EndDate")]
    property end_date : String | Nil

    # The date and time, in ISO-8601 Extended format, for when the maintenance window is scheduled to
    # become active.
    @[JSON::Field(key: "StartDate")]
    property start_date : String | Nil

    # The next time the maintenance window will actually run, taking into account any specified times
    # for the maintenance window to become active or inactive.
    @[JSON::Field(key: "NextExecutionTime")]
    property next_execution_time : String | Nil

    def initialize(
      @window_id : String | Nil = nil,
      @name : String | Nil = nil,
      @description : String | Nil = nil,
      @enabled : Bool | Nil = nil,
      @duration : Int32 | Nil = nil,
      @cutoff : Int32 | Nil = nil,
      @schedule : String | Nil = nil,
      @schedule_timezone : String | Nil = nil,
      @schedule_offset : Int32 | Nil = nil,
      @end_date : String | Nil = nil,
      @start_date : String | Nil = nil,
      @next_execution_time : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @window_id
        raise Core::ValidationError.new("WindowId length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("WindowId length must be <= 20") if value.size > 20
        raise Core::ValidationError.new("WindowId does not match the required pattern") unless value.matches?(Regex.new("^mw-[0-9a-f]{17}$"))
      end

      if value = @name
        raise Core::ValidationError.new("Name length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("Name length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("Name does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-.]{3,128}$"))
      end

      if value = @description
        raise Core::ValidationError.new("Description length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Description length must be <= 128") if value.size > 128
      end

      if value = @duration
        raise Core::ValidationError.new("Duration value must be >= 1") if value < 1
        raise Core::ValidationError.new("Duration value must be <= 24") if value > 24
      end

      if value = @cutoff
        raise Core::ValidationError.new("Cutoff value must be >= 0") if value < 0
        raise Core::ValidationError.new("Cutoff value must be <= 23") if value > 23
      end

      if value = @schedule
        raise Core::ValidationError.new("Schedule length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Schedule length must be <= 256") if value.size > 256
      end

      if value = @schedule_offset
        raise Core::ValidationError.new("ScheduleOffset value must be >= 1") if value < 1
        raise Core::ValidationError.new("ScheduleOffset value must be <= 6") if value > 6
      end
    end

    def_equals_and_hash(@window_id, @name, @description, @enabled, @duration, @cutoff, @schedule, @schedule_timezone, @schedule_offset, @end_date, @start_date, @next_execution_time)
  end
end
