private alias Core = Amazonite::Core

module Amazonite::Ssm
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

    def validate! : Nil
      if value = @association_id
        raise Core::ValidationError.new("AssociationId does not match the required pattern") unless value.matches?(Regex.new("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$"))
      end

      if value = @association_version
        raise Core::ValidationError.new("AssociationVersion does not match the required pattern") unless value.matches?(Regex.new("^([$]LATEST)|([1-9][0-9]*)$"))
      end

      if value = @execution_id
        raise Core::ValidationError.new("ExecutionId does not match the required pattern") unless value.matches?(Regex.new("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$"))
      end

      if value = @alarm_configuration
        value.validate!
      end

      if value = @triggered_alarms
        raise Core::ValidationError.new("TriggeredAlarms must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("TriggeredAlarms must have at most 1 item(s)") if value.size > 1
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@association_id, @association_version, @execution_id, @status, @detailed_status, @created_time, @last_execution_date, @resource_count_by_status, @alarm_configuration, @triggered_alarms)
  end
end
