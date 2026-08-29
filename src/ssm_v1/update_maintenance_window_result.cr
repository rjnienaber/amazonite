module Amazonite::SsmV1
  class UpdateMaintenanceWindowResult
    include JSON::Serializable

    # The ID of the created maintenance window.
    @[JSON::Field(key: "WindowId")]
    property window_id : String | Nil

    # The name of the maintenance window.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # An optional description of the update.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # The date and time, in ISO-8601 Extended format, for when the maintenance window is scheduled to
    # become active. The maintenance window won't run before this specified time.
    @[JSON::Field(key: "StartDate")]
    property start_date : String | Nil

    # The date and time, in ISO-8601 Extended format, for when the maintenance window is scheduled to
    # become inactive. The maintenance window won't run after this specified time.
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

    # The number of days to wait to run a maintenance window after the scheduled cron expression date
    # and time.
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

    def initialize(
      @window_id : String | Nil = nil,
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
    )
    end
  end
end
