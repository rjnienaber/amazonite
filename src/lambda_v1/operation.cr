private alias AL = Amazonite::LambdaV1
private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  class Operation
    include JSON::Serializable

    @[JSON::Field(key: "Id")]
    property id : String

    @[JSON::Field(key: "ParentId")]
    property parent_id : String | Nil

    @[JSON::Field(key: "Name")]
    property name : String | Nil

    @[JSON::Field(key: "Type", converter: AL::OperationType)]
    property type : OperationType

    @[JSON::Field(key: "SubType")]
    property sub_type : String | Nil

    @[JSON::Field(key: "StartTimestamp", converter: Core::AWSEpochConverter)]
    property start_timestamp : Time

    @[JSON::Field(key: "EndTimestamp", converter: Core::AWSEpochConverter)]
    property end_timestamp : Time | Nil

    @[JSON::Field(key: "Status", converter: AL::OperationStatus)]
    property status : OperationStatus

    @[JSON::Field(key: "ExecutionDetails")]
    property execution_details : ExecutionDetails | Nil

    @[JSON::Field(key: "ContextDetails")]
    property context_details : ContextDetails | Nil

    @[JSON::Field(key: "StepDetails")]
    property step_details : StepDetails | Nil

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
  end
end
