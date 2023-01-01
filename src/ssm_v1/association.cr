private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class Association
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String | Nil

    @[JSON::Field(key: "InstanceId")]
    property instance_id : String | Nil

    @[JSON::Field(key: "AssociationId")]
    property association_id : String | Nil

    @[JSON::Field(key: "AssociationVersion")]
    property association_version : String | Nil

    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    @[JSON::Field(key: "Targets")]
    property targets : Array(Target) | Nil

    @[JSON::Field(key: "LastExecutionDate", converter: Core::AWSEpochConverter)]
    property last_execution_date : Time | Nil

    @[JSON::Field(key: "Overview")]
    property overview : AssociationOverview | Nil

    @[JSON::Field(key: "ScheduleExpression")]
    property schedule_expression : String | Nil

    @[JSON::Field(key: "AssociationName")]
    property association_name : String | Nil

    @[JSON::Field(key: "ScheduleOffset")]
    property schedule_offset : Int32 | Nil

    @[JSON::Field(key: "TargetMaps")]
    property target_maps : Array(Hash(String, Array(String))) | Nil

    def initialize(
      @name : String | Nil = nil,
      @instance_id : String | Nil = nil,
      @association_id : String | Nil = nil,
      @association_version : String | Nil = nil,
      @document_version : String | Nil = nil,
      @targets : Array(Target) | Nil = nil,
      @last_execution_date : Time | Nil = nil,
      @overview : AssociationOverview | Nil = nil,
      @schedule_expression : String | Nil = nil,
      @association_name : String | Nil = nil,
      @schedule_offset : Int32 | Nil = nil,
      @target_maps : Array(Hash(String, Array(String))) | Nil = nil
    )
    end
  end
end
