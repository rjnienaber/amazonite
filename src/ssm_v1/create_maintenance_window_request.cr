module Amazonite::SsmV1
  class CreateMaintenanceWindowRequest
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String

    @[JSON::Field(key: "Description")]
    property description : String | Nil

    @[JSON::Field(key: "StartDate")]
    property start_date : String | Nil

    @[JSON::Field(key: "EndDate")]
    property end_date : String | Nil

    @[JSON::Field(key: "Schedule")]
    property schedule : String

    @[JSON::Field(key: "ScheduleTimezone")]
    property schedule_timezone : String | Nil

    @[JSON::Field(key: "ScheduleOffset")]
    property schedule_offset : Int32 | Nil

    @[JSON::Field(key: "Duration")]
    property duration : Int32

    @[JSON::Field(key: "Cutoff")]
    property cutoff : Int32

    @[JSON::Field(key: "AllowUnassociatedTargets")]
    property allow_unassociated_targets : Bool

    @[JSON::Field(key: "ClientToken")]
    property client_token : String | Nil

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
      @tags : Array(Tag) | Nil = nil
    )
    end
  end
end
