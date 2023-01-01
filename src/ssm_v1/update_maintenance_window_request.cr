module Amazonite::SsmV1
  class UpdateMaintenanceWindowRequest
    include JSON::Serializable

    @[JSON::Field(key: "WindowId")]
    property window_id : String

    @[JSON::Field(key: "Name")]
    property name : String | Nil

    @[JSON::Field(key: "Description")]
    property description : String | Nil

    @[JSON::Field(key: "StartDate")]
    property start_date : String | Nil

    @[JSON::Field(key: "EndDate")]
    property end_date : String | Nil

    @[JSON::Field(key: "Schedule")]
    property schedule : String | Nil

    @[JSON::Field(key: "ScheduleTimezone")]
    property schedule_timezone : String | Nil

    @[JSON::Field(key: "ScheduleOffset")]
    property schedule_offset : Int32 | Nil

    @[JSON::Field(key: "Duration")]
    property duration : Int32 | Nil

    @[JSON::Field(key: "Cutoff")]
    property cutoff : Int32 | Nil

    @[JSON::Field(key: "AllowUnassociatedTargets")]
    property allow_unassociated_targets : Bool | Nil

    @[JSON::Field(key: "Enabled")]
    property enabled : Bool | Nil

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
      @replace : Bool | Nil = nil
    )
    end
  end
end
