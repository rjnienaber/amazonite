module Amazonite::SsmV1
  class UpdateMaintenanceWindowRequest
    include JSON::Serializable

    # The ID of the maintenance window to update.
    @[JSON::Field(key: "WindowId")]
    property window_id : String

    # The name of the maintenance window.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # An optional description for the update request.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # The date and time, in ISO-8601 Extended format, for when you want the maintenance window to
    # become active. `StartDate` allows you to delay activation of the maintenance window until the
    # specified future date.
    #
    # When using a rate schedule, if you provide a start date that occurs in the past, the current
    # date and time are used as the start date.
    @[JSON::Field(key: "StartDate")]
    property start_date : String | Nil

    # The date and time, in ISO-8601 Extended format, for when you want the maintenance window to
    # become inactive. `EndDate` allows you to set a date and time in the future when the maintenance
    # window will no longer run.
    @[JSON::Field(key: "EndDate")]
    property end_date : String | Nil

    # The schedule of the maintenance window in the form of a cron or rate expression.
    @[JSON::Field(key: "Schedule")]
    property schedule : String | Nil

    # The time zone that the scheduled maintenance window executions are based on, in Internet
    # Assigned Numbers Authority (IANA) format. For example: "America/Los_Angeles", "UTC", or
    # "Asia/Seoul". For more information, see the [Time Zone
    # Database](https://www.iana.org/time-zones) on the IANA website.
    @[JSON::Field(key: "ScheduleTimezone")]
    property schedule_timezone : String | Nil

    # The number of days to wait after the date and time specified by a cron expression before running
    # the maintenance window.
    #
    # For example, the following cron expression schedules a maintenance window to run the third
    # Tuesday of every month at 11:30 PM.
    #
    # `cron(30 23 ? * TUE#3 *)`
    #
    # If the schedule offset is `2`, the maintenance window won't run until two days later.
    @[JSON::Field(key: "ScheduleOffset")]
    property schedule_offset : Int32 | Nil

    # The duration of the maintenance window in hours.
    @[JSON::Field(key: "Duration")]
    property duration : Int32 | Nil

    # The number of hours before the end of the maintenance window that Amazon Web Services Systems
    # Manager stops scheduling new tasks for execution.
    @[JSON::Field(key: "Cutoff")]
    property cutoff : Int32 | Nil

    # Whether targets must be registered with the maintenance window before tasks can be defined for
    # those targets.
    @[JSON::Field(key: "AllowUnassociatedTargets")]
    property allow_unassociated_targets : Bool | Nil

    # Whether the maintenance window is enabled.
    @[JSON::Field(key: "Enabled")]
    property enabled : Bool | Nil

    # If `True`, then all fields that are required by the CreateMaintenanceWindow operation are also
    # required for this API request. Optional fields that aren't specified are set to null.
    @[JSON::Field(key: "Replace")]
    property replace : Bool | Nil

    def initialize(
      @window_id : String,
      @name : String | Nil = nil,
      @description : String | Nil = nil,
      @start_date : String | Nil = nil,
      @end_date : String | Nil = nil,
      @schedule : String | Nil = nil,
      @schedule_timezone : String | Nil = nil,
      @schedule_offset : Int32 | Nil = nil,
      @duration : Int32 | Nil = nil,
      @cutoff : Int32 | Nil = nil,
      @allow_unassociated_targets : Bool | Nil = nil,
      @enabled : Bool | Nil = nil,
      @replace : Bool | Nil = nil,
    )
    end

    def_equals_and_hash(@window_id, @name, @description, @start_date, @end_date, @schedule, @schedule_timezone, @schedule_offset, @duration, @cutoff, @allow_unassociated_targets, @enabled, @replace)
  end
end
