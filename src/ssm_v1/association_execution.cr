private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # Includes information about the specified association.
  class AssociationExecution
    include JSON::Serializable

    # The association ID.
    @[JSON::Field(key: "AssociationId")]
    property association_id : String | Nil

    # The association version.
    @[JSON::Field(key: "AssociationVersion")]
    property association_version : String | Nil

    # The execution ID for the association.
    @[JSON::Field(key: "ExecutionId")]
    property execution_id : String | Nil

    # The status of the association execution.
    @[JSON::Field(key: "Status")]
    property status : String | Nil

    # Detailed status information about the execution.
    @[JSON::Field(key: "DetailedStatus")]
    property detailed_status : String | Nil

    # The time the execution started.
    @[JSON::Field(key: "CreatedTime", converter: Core::AWSEpochConverter)]
    property created_time : Time | Nil

    # The date of the last execution.
    @[JSON::Field(key: "LastExecutionDate", converter: Core::AWSEpochConverter)]
    property last_execution_date : Time | Nil

    # An aggregate status of the resources in the execution based on the status type.
    @[JSON::Field(key: "ResourceCountByStatus")]
    property resource_count_by_status : String | Nil

    @[JSON::Field(key: "AlarmConfiguration")]
    property alarm_configuration : AlarmConfiguration | Nil

    # The CloudWatch alarms that were invoked by the association.
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
      @triggered_alarms : Array(AlarmStateInformation) | Nil = nil,
    )
    end
  end
end
