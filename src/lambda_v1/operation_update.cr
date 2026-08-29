private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  class OperationUpdate
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

    @[JSON::Field(key: "Action", converter: AL::OperationAction)]
    property action : OperationAction

    @[JSON::Field(key: "Payload")]
    property payload : String | Nil

    @[JSON::Field(key: "Error")]
    property error : ErrorObject | Nil

    @[JSON::Field(key: "ContextOptions")]
    property context_options : ContextOptions | Nil

    @[JSON::Field(key: "StepOptions")]
    property step_options : StepOptions | Nil

    @[JSON::Field(key: "WaitOptions")]
    property wait_options : WaitOptions | Nil

    @[JSON::Field(key: "CallbackOptions")]
    property callback_options : CallbackOptions | Nil

    @[JSON::Field(key: "ChainedInvokeOptions")]
    property chained_invoke_options : ChainedInvokeOptions | Nil

    def initialize(
      @id : String,
      @type : OperationType,
      @action : OperationAction,
      @parent_id : String | Nil = nil,
      @name : String | Nil = nil,
      @sub_type : String | Nil = nil,
      @payload : String | Nil = nil,
      @error : ErrorObject | Nil = nil,
      @context_options : ContextOptions | Nil = nil,
      @step_options : StepOptions | Nil = nil,
      @wait_options : WaitOptions | Nil = nil,
      @callback_options : CallbackOptions | Nil = nil,
      @chained_invoke_options : ChainedInvokeOptions | Nil = nil,
    )
    end
  end
end
