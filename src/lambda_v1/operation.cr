private alias AL = Amazonite::LambdaV1
private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  # Information about an operation within a durable execution.
  class Operation
    include JSON::Serializable

    # The unique identifier for this operation.
    @[JSON::Field(key: "Id")]
    property id : String

    # The unique identifier of the parent operation, if this operation is running within a child
    # context.
    @[JSON::Field(key: "ParentId")]
    property parent_id : String | Nil

    # The customer-provided name for this operation.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The type of operation.
    @[JSON::Field(key: "Type", converter: AL::OperationType)]
    property type : OperationType

    # The subtype of the operation, providing additional categorization.
    @[JSON::Field(key: "SubType")]
    property sub_type : String | Nil

    # The date and time when the operation started, in [ISO-8601
    # format](https://www.w3.org/TR/NOTE-datetime) (YYYY-MM-DDThh:mm:ss.sTZD).
    @[JSON::Field(key: "StartTimestamp", converter: Core::AWSEpochConverter)]
    property start_timestamp : Time

    # The date and time when the operation ended, in [ISO-8601
    # format](https://www.w3.org/TR/NOTE-datetime) (YYYY-MM-DDThh:mm:ss.sTZD).
    @[JSON::Field(key: "EndTimestamp", converter: Core::AWSEpochConverter)]
    property end_timestamp : Time | Nil

    # The current status of the operation.
    @[JSON::Field(key: "Status", converter: AL::OperationStatus)]
    property status : OperationStatus

    # Details about the execution, if this operation represents an execution.
    @[JSON::Field(key: "ExecutionDetails")]
    property execution_details : ExecutionDetails | Nil

    # Details about the context, if this operation represents a context.
    @[JSON::Field(key: "ContextDetails")]
    property context_details : ContextDetails | Nil

    # Details about the step, if this operation represents a step.
    @[JSON::Field(key: "StepDetails")]
    property step_details : StepDetails | Nil

    # Details about the wait operation, if this operation represents a wait.
    @[JSON::Field(key: "WaitDetails")]
    property wait_details : WaitDetails | Nil

    @[JSON::Field(key: "CallbackDetails")]
    property callback_details : CallbackDetails | Nil

    @[JSON::Field(key: "ChainedInvokeDetails")]
    property chained_invoke_details : ChainedInvokeDetails | Nil

    def initialize(
      @id : String,
      @type : OperationType,
      @start_timestamp : Time,
      @status : OperationStatus,
      @parent_id : String | Nil = nil,
      @name : String | Nil = nil,
      @sub_type : String | Nil = nil,
      @end_timestamp : Time | Nil = nil,
      @execution_details : ExecutionDetails | Nil = nil,
      @context_details : ContextDetails | Nil = nil,
      @step_details : StepDetails | Nil = nil,
      @wait_details : WaitDetails | Nil = nil,
      @callback_details : CallbackDetails | Nil = nil,
      @chained_invoke_details : ChainedInvokeDetails | Nil = nil,
    )
    end

    def_equals_and_hash(@id, @parent_id, @name, @type, @sub_type, @start_timestamp, @end_timestamp, @status, @execution_details, @context_details, @step_details, @wait_details, @callback_details, @chained_invoke_details)
  end
end
