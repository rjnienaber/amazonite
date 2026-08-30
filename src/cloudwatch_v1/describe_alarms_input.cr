private alias ACW = Amazonite::CloudWatchV1
private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  class DescribeAlarmsInput
    include JSON::Serializable

    # The names of the alarms to retrieve information about.
    @[JSON::Field(key: "AlarmNames")]
    property alarm_names : Array(String) | Nil

    # An alarm name prefix. If you specify this parameter, you receive information about all alarms
    # that have names that start with this prefix.
    #
    # If this parameter is specified, you cannot specify `AlarmNames`.
    @[JSON::Field(key: "AlarmNamePrefix")]
    property alarm_name_prefix : String | Nil

    # Use this parameter to specify whether you want the operation to return metric alarms, composite
    # alarms, or log alarms. If you omit this parameter, only metric alarms are returned, even if
    # composite alarms or log alarms exist in the account.
    #
    # For example, if you omit this parameter or specify `MetricAlarms`, the operation returns only a
    # list of metric alarms. It does not return any composite alarms or log alarms, even if they exist
    # in the account.
    #
    # If you specify `CompositeAlarms`, the operation returns only a list of composite alarms, and
    # does not return any metric alarms or log alarms.
    #
    # If you specify `LogAlarms`, the operation returns only a list of log alarms, and does not return
    # any metric alarms or composite alarms.
    @[JSON::Field(key: "AlarmTypes", converter: Core::ArrayConverter(ACW::AlarmType))]
    property alarm_types : Array(AlarmType) | Nil

    # If you use this parameter and specify the name of a composite alarm, the operation returns
    # information about the "children" alarms of the alarm you specify. These are the metric alarms
    # and composite alarms referenced in the `AlarmRule` field of the composite alarm that you specify
    # in `ChildrenOfAlarmName`. Information about the composite alarm that you name in
    # `ChildrenOfAlarmName` is not returned.
    #
    # If you specify `ChildrenOfAlarmName`, you cannot specify any other parameters in the request
    # except for `MaxRecords` and `NextToken`. If you do so, you receive a validation error.
    #
    # Only the `Alarm Name`, `ARN`, `StateValue` (OK/ALARM/INSUFFICIENT_DATA), and
    # `StateUpdatedTimestamp` information are returned by this operation when you use this parameter.
    # To get complete information about these alarms, perform another `DescribeAlarms` operation and
    # specify the parent alarm names in the `AlarmNames` parameter.
    @[JSON::Field(key: "ChildrenOfAlarmName")]
    property children_of_alarm_name : String | Nil

    # If you use this parameter and specify the name of a metric or composite alarm, the operation
    # returns information about the "parent" alarms of the alarm you specify. These are the composite
    # alarms that have `AlarmRule` parameters that reference the alarm named in `ParentsOfAlarmName`.
    # Information about the alarm that you specify in `ParentsOfAlarmName` is not returned.
    #
    # If you specify `ParentsOfAlarmName`, you cannot specify any other parameters in the request
    # except for `MaxRecords` and `NextToken`. If you do so, you receive a validation error.
    #
    # Only the Alarm Name and ARN are returned by this operation when you use this parameter. To get
    # complete information about these alarms, perform another `DescribeAlarms` operation and specify
    # the parent alarm names in the `AlarmNames` parameter.
    @[JSON::Field(key: "ParentsOfAlarmName")]
    property parents_of_alarm_name : String | Nil

    # Specify this parameter to receive information only about alarms that are currently in the state
    # that you specify.
    @[JSON::Field(key: "StateValue", converter: ACW::StateValue)]
    property state_value : StateValue | Nil

    # Use this parameter to filter the results of the operation to only those alarms that use a
    # certain alarm action. For example, you could specify the ARN of an SNS topic to find all alarms
    # that send notifications to that topic.
    @[JSON::Field(key: "ActionPrefix")]
    property action_prefix : String | Nil

    # The maximum number of alarm descriptions to retrieve.
    @[JSON::Field(key: "MaxRecords")]
    property max_records : Int32 | Nil

    # The token returned by a previous call to indicate that there is more data available.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @alarm_names : Array(String) | Nil = nil,
      @alarm_name_prefix : String | Nil = nil,
      @alarm_types : Array(AlarmType) | Nil = nil,
      @children_of_alarm_name : String | Nil = nil,
      @parents_of_alarm_name : String | Nil = nil,
      @state_value : StateValue | Nil = nil,
      @action_prefix : String | Nil = nil,
      @max_records : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @alarm_names
        raise Core::ValidationError.new("AlarmNames must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("AlarmNames must have at most 100 item(s)") if value.size > 100
      end

      if value = @alarm_name_prefix
        raise Core::ValidationError.new("AlarmNamePrefix length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("AlarmNamePrefix length must be <= 255") if value.size > 255
      end

      if value = @children_of_alarm_name
        raise Core::ValidationError.new("ChildrenOfAlarmName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ChildrenOfAlarmName length must be <= 255") if value.size > 255
      end

      if value = @parents_of_alarm_name
        raise Core::ValidationError.new("ParentsOfAlarmName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ParentsOfAlarmName length must be <= 255") if value.size > 255
      end

      if value = @action_prefix
        raise Core::ValidationError.new("ActionPrefix length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ActionPrefix length must be <= 1024") if value.size > 1024
      end

      if value = @max_records
        raise Core::ValidationError.new("MaxRecords value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxRecords value must be <= 100") if value > 100
      end
    end

    def_equals_and_hash(@alarm_names, @alarm_name_prefix, @alarm_types, @children_of_alarm_name, @parents_of_alarm_name, @state_value, @action_prefix, @max_records, @next_token)
  end
end
