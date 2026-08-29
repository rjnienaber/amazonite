private alias AL = Amazonite::LambdaV1
private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  class Event
    include JSON::Serializable

    @[JSON::Field(key: "EventType", converter: AL::EventType)]
    property event_type : EventType | Nil

    @[JSON::Field(key: "SubType")]
    property sub_type : String | Nil

    @[JSON::Field(key: "EventId")]
    property event_id : Int32 | Nil

    @[JSON::Field(key: "Id")]
    property id : String | Nil

    @[JSON::Field(key: "Name")]
    property name : String | Nil

    @[JSON::Field(key: "EventTimestamp", converter: Core::AWSEpochConverter)]
    property event_timestamp : Time | Nil

    @[JSON::Field(key: "ParentId")]
    property parent_id : String | Nil

    @[JSON::Field(key: "ExecutionStartedDetails")]
    property execution_started_details : ExecutionStartedDetails | Nil

    @[JSON::Field(key: "ExecutionSucceededDetails")]
    property execution_succeeded_details : ExecutionSucceededDetails | Nil

    @[JSON::Field(key: "ExecutionFailedDetails")]
    property execution_failed_details : ExecutionFailedDetails | Nil

    @[JSON::Field(key: "ExecutionTimedOutDetails")]
    property execution_timed_out_details : ExecutionTimedOutDetails | Nil

    @[JSON::Field(key: "ExecutionStoppedDetails")]
    property execution_stopped_details : ExecutionStoppedDetails | Nil

    @[JSON::Field(key: "ContextStartedDetails")]
    property context_started_details : ContextStartedDetails | Nil

    @[JSON::Field(key: "ContextSucceededDetails")]
    property context_succeeded_details : ContextSucceededDetails | Nil

    @[JSON::Field(key: "ContextFailedDetails")]
    property context_failed_details : ContextFailedDetails | Nil

    @[JSON::Field(key: "WaitStartedDetails")]
    property wait_started_details : WaitStartedDetails | Nil

    @[JSON::Field(key: "WaitSucceededDetails")]
    property wait_succeeded_details : WaitSucceededDetails | Nil

    @[JSON::Field(key: "WaitCancelledDetails")]
    property wait_cancelled_details : WaitCancelledDetails | Nil

    @[JSON::Field(key: "StepStartedDetails")]
    property step_started_details : StepStartedDetails | Nil

    @[JSON::Field(key: "StepSucceededDetails")]
    property step_succeeded_details : StepSucceededDetails | Nil

    @[JSON::Field(key: "StepFailedDetails")]
    property step_failed_details : StepFailedDetails | Nil

    @[JSON::Field(key: "ChainedInvokeStartedDetails")]
    property chained_invoke_started_details : ChainedInvokeStartedDetails | Nil

    @[JSON::Field(key: "ChainedInvokeSucceededDetails")]
    property chained_invoke_succeeded_details : ChainedInvokeSucceededDetails | Nil

    @[JSON::Field(key: "ChainedInvokeFailedDetails")]
    property chained_invoke_failed_details : ChainedInvokeFailedDetails | Nil

    @[JSON::Field(key: "ChainedInvokeTimedOutDetails")]
    property chained_invoke_timed_out_details : ChainedInvokeTimedOutDetails | Nil

    @[JSON::Field(key: "ChainedInvokeStoppedDetails")]
    property chained_invoke_stopped_details : ChainedInvokeStoppedDetails | Nil

    @[JSON::Field(key: "CallbackStartedDetails")]
    property callback_started_details : CallbackStartedDetails | Nil

    @[JSON::Field(key: "CallbackSucceededDetails")]
    property callback_succeeded_details : CallbackSucceededDetails | Nil

    @[JSON::Field(key: "CallbackFailedDetails")]
    property callback_failed_details : CallbackFailedDetails | Nil

    @[JSON::Field(key: "CallbackTimedOutDetails")]
    property callback_timed_out_details : CallbackTimedOutDetails | Nil

    @[JSON::Field(key: "InvocationCompletedDetails")]
    property invocation_completed_details : InvocationCompletedDetails | Nil

    def initialize(
      @event_type : EventType | Nil = nil,
      @sub_type : String | Nil = nil,
      @event_id : Int32 | Nil = nil,
      @id : String | Nil = nil,
      @name : String | Nil = nil,
      @event_timestamp : Time | Nil = nil,
      @parent_id : String | Nil = nil,
      @execution_started_details : ExecutionStartedDetails | Nil = nil,
      @execution_succeeded_details : ExecutionSucceededDetails | Nil = nil,
      @execution_failed_details : ExecutionFailedDetails | Nil = nil,
      @execution_timed_out_details : ExecutionTimedOutDetails | Nil = nil,
      @execution_stopped_details : ExecutionStoppedDetails | Nil = nil,
      @context_started_details : ContextStartedDetails | Nil = nil,
      @context_succeeded_details : ContextSucceededDetails | Nil = nil,
      @context_failed_details : ContextFailedDetails | Nil = nil,
      @wait_started_details : WaitStartedDetails | Nil = nil,
      @wait_succeeded_details : WaitSucceededDetails | Nil = nil,
      @wait_cancelled_details : WaitCancelledDetails | Nil = nil,
      @step_started_details : StepStartedDetails | Nil = nil,
      @step_succeeded_details : StepSucceededDetails | Nil = nil,
      @step_failed_details : StepFailedDetails | Nil = nil,
      @chained_invoke_started_details : ChainedInvokeStartedDetails | Nil = nil,
      @chained_invoke_succeeded_details : ChainedInvokeSucceededDetails | Nil = nil,
      @chained_invoke_failed_details : ChainedInvokeFailedDetails | Nil = nil,
      @chained_invoke_timed_out_details : ChainedInvokeTimedOutDetails | Nil = nil,
      @chained_invoke_stopped_details : ChainedInvokeStoppedDetails | Nil = nil,
      @callback_started_details : CallbackStartedDetails | Nil = nil,
      @callback_succeeded_details : CallbackSucceededDetails | Nil = nil,
      @callback_failed_details : CallbackFailedDetails | Nil = nil,
      @callback_timed_out_details : CallbackTimedOutDetails | Nil = nil,
      @invocation_completed_details : InvocationCompletedDetails | Nil = nil,
    )
    end
  end
end
