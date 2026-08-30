module Amazonite::SsmV1
  class CreateMaintenanceWindowRequest
    include JSON::Serializable

    # The name of the maintenance window.
    @[JSON::Field(key: "Name")]
    property name : String

    # An optional description for the maintenance window. We recommend specifying a description to
    # help you organize your maintenance windows.
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
    property schedule : String

    # The time zone that the scheduled maintenance window executions are based on, in Internet
    # Assigned Numbers Authority (IANA) format. For example: "America/Los_Angeles", "UTC", or
    # "Asia/Seoul". For more information, see the [Time Zone
    # Database](https://www.iana.org/time-zones) on the IANA website.
    @[JSON::Field(key: "ScheduleTimezone")]
    property schedule_timezone : String | Nil

    # The number of days to wait after the date and time specified by a cron expression before running
    # the maintenance window.
    #
    # For example, the following cron expression schedules a maintenance window to run on the third
    # Tuesday of every month at 11:30 PM.
    #
    # `cron(30 23 ? * TUE#3 *)`
    #
    # If the schedule offset is `2`, the maintenance window won't run until two days later.
    @[JSON::Field(key: "ScheduleOffset")]
    property schedule_offset : Int32 | Nil

    # The duration of the maintenance window in hours.
    @[JSON::Field(key: "Duration")]
    property duration : Int32

    # The number of hours before the end of the maintenance window that Amazon Web Services Systems
    # Manager stops scheduling new tasks for execution.
    @[JSON::Field(key: "Cutoff")]
    property cutoff : Int32

    # Enables a maintenance window task to run on managed nodes, even if you haven't registered those
    # nodes as targets. If enabled, then you must specify the unregistered managed nodes (by node ID)
    # when you register a task with the maintenance window.
    #
    # If you don't enable this option, then you must specify previously-registered targets when you
    # register a task with the maintenance window.
    @[JSON::Field(key: "AllowUnassociatedTargets")]
    property allow_unassociated_targets : Bool

    # User-provided idempotency token.
    @[JSON::Field(key: "ClientToken")]
    property client_token : String | Nil

    # Optional metadata that you assign to a resource. Tags enable you to categorize a resource in
    # different ways, such as by purpose, owner, or environment. For example, you might want to tag a
    # maintenance window to identify the type of tasks it will run, the types of targets, and the
    # environment it will run in. In this case, you could specify the following key-value pairs:
    #
    # - `Key=TaskType,Value=AgentUpdate`
    #
    # - `Key=OS,Value=Windows`
    #
    # - `Key=Environment,Value=Production`
    #
    # To add tags to an existing maintenance window, use the AddTagsToResource operation.
    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    def initialize(
      @name : String,
      @schedule : String,
      @duration : Int32,
      @cutoff : Int32,
      @allow_unassociated_targets : Bool,
      @description : String | Nil = nil,
      @start_date : String | Nil = nil,
      @end_date : String | Nil = nil,
      @schedule_timezone : String | Nil = nil,
      @schedule_offset : Int32 | Nil = nil,
      @client_token : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end
  end
end
