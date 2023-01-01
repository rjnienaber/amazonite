private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class AssociationExecution
    include JSON::Serializable

    @[JSON::Field(key: "AssociationId")]
    property association_id : String | Nil

    @[JSON::Field(key: "AssociationVersion")]
    property association_version : String | Nil

    @[JSON::Field(key: "ExecutionId")]
    property execution_id : String | Nil

    @[JSON::Field(key: "Status")]
    property status : String | Nil

    @[JSON::Field(key: "DetailedStatus")]
    property detailed_status : String | Nil

    @[JSON::Field(key: "CreatedTime", converter: Core::AWSEpochConverter)]
    property created_time : Time | Nil

    @[JSON::Field(key: "LastExecutionDate", converter: Core::AWSEpochConverter)]
    property last_execution_date : Time | Nil

    @[JSON::Field(key: "ResourceCountByStatus")]
    property resource_count_by_status : String | Nil

    @[JSON::Field(key: "AlarmConfiguration")]
    property alarm_configuration : AlarmConfiguration | Nil

    @[JSON::Field(key: "TriggeredAlarms")]
    property triggered_alarms : Array(AlarmStateInformation) | Nil

    def initialize(
      @association_id : String | Nil = nil,
      @association_version : String | Nil = nil,
      @execution_id : String | Nil = nil,
      @status : String | Nil = nil,
      @detailed_status : String | Nil = nil,
      @created_time : Time | Nil = nil,
      @last_execution_date : Time | Nil = nil,
      @resource_count_by_status : String | Nil = nil,
      @alarm_configuration : AlarmConfiguration | Nil = nil,
      @triggered_alarms : Array(AlarmStateInformation) | Nil = nil
    )
    end
  end
end
