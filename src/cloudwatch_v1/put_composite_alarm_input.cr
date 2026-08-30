private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  class PutCompositeAlarmInput
    include JSON::Serializable

    # Indicates whether actions should be executed during any changes to the alarm state of the
    # composite alarm. The default is `TRUE`.
    @[JSON::Field(key: "ActionsEnabled")]
    property actions_enabled : Bool | Nil

    # The actions to execute when this alarm transitions to the `ALARM` state from any other state.
    # Each action is specified as an Amazon Resource Name (ARN).
    #
    # Valid Values: ]
    #
    # **Amazon SNS actions:**
    #
    # `arn:aws:sns:*region*:*account-id*:*sns-topic-name* `
    #
    # **Lambda actions:**
    #
    # - Invoke the latest version of a Lambda function:
    # `arn:aws:lambda:*region*:*account-id*:function:*function-name* `
    #
    # - Invoke a specific version of a Lambda function:
    # `arn:aws:lambda:*region*:*account-id*:function:*function-name*:*version-number* `
    #
    # - Invoke a function by using an alias Lambda function:
    # `arn:aws:lambda:*region*:*account-id*:function:*function-name*:*alias-name* `
    #
    # **Systems Manager actions:**
    #
    # `arn:aws:ssm:*region*:*account-id*:opsitem:*severity* `
    #
    # **Start a Amazon Q Developer operational investigation**
    #
    # `arn:aws:aiops:*region*:*account-id*:investigation-group:*investigation-group-id* `
    @[JSON::Field(key: "AlarmActions")]
    property alarm_actions : Array(String) | Nil

    # The description for the composite alarm.
    @[JSON::Field(key: "AlarmDescription")]
    property alarm_description : String | Nil

    # The name for the composite alarm. This name must be unique within the Region.
    @[JSON::Field(key: "AlarmName")]
    property alarm_name : String

    # An expression that specifies which other alarms are to be evaluated to determine this composite
    # alarm's state. For each alarm that you reference, you designate a function that specifies
    # whether that alarm needs to be in ALARM state, OK state, or INSUFFICIENT_DATA state. You can use
    # operators (AND, OR and NOT) to combine multiple functions in a single expression. You can use
    # parenthesis to logically group the functions in your expression.
    #
    # You can use either alarm names or ARNs to reference the other alarms that are to be evaluated.
    #
    # Functions can include the following:
    #
    # - `ALARM("*alarm-name* or *alarm-ARN*")` is TRUE if the named alarm is in ALARM state.
    #
    # - `OK("*alarm-name* or *alarm-ARN*")` is TRUE if the named alarm is in OK state.
    #
    # - `INSUFFICIENT_DATA("*alarm-name* or *alarm-ARN*")` is TRUE if the named alarm is in
    # INSUFFICIENT_DATA state.
    #
    # - `TRUE` always evaluates to TRUE.
    #
    # - `FALSE` always evaluates to FALSE.
    #
    # TRUE and FALSE are useful for testing a complex `AlarmRule` structure, and for testing your
    # alarm actions.
    #
    # Alarm names specified in `AlarmRule` can be surrounded with double-quotes ("), but do not have
    # to be.
    #
    # The following are some examples of `AlarmRule`:
    #
    # - `ALARM(CPUUtilizationTooHigh) AND ALARM(DiskReadOpsTooHigh)` specifies that the composite
    # alarm goes into ALARM state only if both CPUUtilizationTooHigh and DiskReadOpsTooHigh alarms are
    # in ALARM state.
    #
    # - `ALARM(CPUUtilizationTooHigh) AND NOT ALARM(DeploymentInProgress)` specifies that the alarm
    # goes to ALARM state if CPUUtilizationTooHigh is in ALARM state and DeploymentInProgress is not
    # in ALARM state. This example reduces alarm noise during a known deployment window.
    #
    # - `(ALARM(CPUUtilizationTooHigh) OR ALARM(DiskReadOpsTooHigh)) AND OK(NetworkOutTooHigh)` goes
    # into ALARM state if CPUUtilizationTooHigh OR DiskReadOpsTooHigh is in ALARM state, and if
    # NetworkOutTooHigh is in OK state. This provides another example of using a composite alarm to
    # prevent noise. This rule ensures that you are not notified with an alarm action on high CPU or
    # disk usage if a known network problem is also occurring.
    #
    # The `AlarmRule` can specify as many as 100 "children" alarms. The `AlarmRule` expression can
    # have as many as 500 elements. Elements are child alarms, TRUE or FALSE statements, and
    # parentheses.
    @[JSON::Field(key: "AlarmRule")]
    property alarm_rule : String

    # The actions to execute when this alarm transitions to the `INSUFFICIENT_DATA` state from any
    # other state. Each action is specified as an Amazon Resource Name (ARN).
    #
    # Valid Values: ]
    #
    # **Amazon SNS actions:**
    #
    # `arn:aws:sns:*region*:*account-id*:*sns-topic-name* `
    #
    # **Lambda actions:**
    #
    # - Invoke the latest version of a Lambda function:
    # `arn:aws:lambda:*region*:*account-id*:function:*function-name* `
    #
    # - Invoke a specific version of a Lambda function:
    # `arn:aws:lambda:*region*:*account-id*:function:*function-name*:*version-number* `
    #
    # - Invoke a function by using an alias Lambda function:
    # `arn:aws:lambda:*region*:*account-id*:function:*function-name*:*alias-name* `
    @[JSON::Field(key: "InsufficientDataActions")]
    property insufficient_data_actions : Array(String) | Nil

    # The actions to execute when this alarm transitions to an `OK` state from any other state. Each
    # action is specified as an Amazon Resource Name (ARN).
    #
    # Valid Values: ]
    #
    # **Amazon SNS actions:**
    #
    # `arn:aws:sns:*region*:*account-id*:*sns-topic-name* `
    #
    # **Lambda actions:**
    #
    # - Invoke the latest version of a Lambda function:
    # `arn:aws:lambda:*region*:*account-id*:function:*function-name* `
    #
    # - Invoke a specific version of a Lambda function:
    # `arn:aws:lambda:*region*:*account-id*:function:*function-name*:*version-number* `
    #
    # - Invoke a function by using an alias Lambda function:
    # `arn:aws:lambda:*region*:*account-id*:function:*function-name*:*alias-name* `
    @[JSON::Field(key: "OKActions")]
    property ok_actions : Array(String) | Nil

    # A list of key-value pairs to associate with the alarm. You can associate as many as 50 tags with
    # an alarm. To be able to associate tags with the alarm when you create the alarm, you must have
    # the `cloudwatch:TagResource` permission.
    #
    # Tags can help you organize and categorize your resources. You can also use them to scope user
    # permissions by granting a user permission to access or change only resources with certain tag
    # values.
    #
    # If you are using this operation to update an existing alarm, any tags you specify in this
    # parameter are ignored. To change the tags of an existing alarm, use
    # [TagResource](https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_TagResource.html)
    # or
    # [UntagResource](https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_UntagResource.html).
    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    # Actions will be suppressed if the suppressor alarm is in the `ALARM` state. `ActionsSuppressor`
    # can be an AlarmName or an Amazon Resource Name (ARN) from an existing alarm.
    @[JSON::Field(key: "ActionsSuppressor")]
    property actions_suppressor : String | Nil

    # The maximum time in seconds that the composite alarm waits for the suppressor alarm to go into
    # the `ALARM` state. After this time, the composite alarm performs its actions.
    #
    # `WaitPeriod` is required only when `ActionsSuppressor` is specified.
    @[JSON::Field(key: "ActionsSuppressorWaitPeriod")]
    property actions_suppressor_wait_period : Int32 | Nil

    # The maximum time in seconds that the composite alarm waits after suppressor alarm goes out of
    # the `ALARM` state. After this time, the composite alarm performs its actions.
    #
    # `ExtensionPeriod` is required only when `ActionsSuppressor` is specified.
    @[JSON::Field(key: "ActionsSuppressorExtensionPeriod")]
    property actions_suppressor_extension_period : Int32 | Nil

    def initialize(
      @alarm_name : String,
      @alarm_rule : String,
      @actions_enabled : Bool | Nil = nil,
      @alarm_actions : Array(String) | Nil = nil,
      @alarm_description : String | Nil = nil,
      @insufficient_data_actions : Array(String) | Nil = nil,
      @ok_actions : Array(String) | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @actions_suppressor : String | Nil = nil,
      @actions_suppressor_wait_period : Int32 | Nil = nil,
      @actions_suppressor_extension_period : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @alarm_actions
        raise Core::ValidationError.new("AlarmActions must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("AlarmActions must have at most 5 item(s)") if value.size > 5
      end

      if value = @alarm_description
        raise Core::ValidationError.new("AlarmDescription length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("AlarmDescription length must be <= 1024") if value.size > 1024
      end

      if value = @alarm_name
        raise Core::ValidationError.new("AlarmName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("AlarmName length must be <= 255") if value.size > 255
      end

      if value = @alarm_rule
        raise Core::ValidationError.new("AlarmRule length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("AlarmRule length must be <= 10240") if value.size > 10240
      end

      if value = @insufficient_data_actions
        raise Core::ValidationError.new("InsufficientDataActions must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("InsufficientDataActions must have at most 5 item(s)") if value.size > 5
      end

      if value = @ok_actions
        raise Core::ValidationError.new("OKActions must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("OKActions must have at most 5 item(s)") if value.size > 5
      end

      if value = @tags
        value.each(&.validate!)
      end

      if value = @actions_suppressor
        raise Core::ValidationError.new("ActionsSuppressor length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ActionsSuppressor length must be <= 1600") if value.size > 1600
      end
    end

    def_equals_and_hash(@actions_enabled, @alarm_actions, @alarm_description, @alarm_name, @alarm_rule, @insufficient_data_actions, @ok_actions, @tags, @actions_suppressor, @actions_suppressor_wait_period, @actions_suppressor_extension_period)
  end
end
