private alias AL = Amazonite::LambdaV1
private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  # An event that occurred during the execution of a durable function.
  class Event
    include JSON::Serializable

    # The type of event that occurred.
    @[JSON::Field(key: "EventType", converter: AL::EventType)]
    property event_type : EventType | Nil

    # The subtype of the event, providing additional categorization.
    @[JSON::Field(key: "SubType")]
    property sub_type : String | Nil

    # The unique identifier for this event. Event IDs increment sequentially.
    @[JSON::Field(key: "EventId")]
    property event_id : Int32 | Nil

    # The unique identifier for this operation.
    @[JSON::Field(key: "Id")]
    property id : String | Nil

    # The customer-provided name for this operation.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The date and time when this event occurred, in [ISO-8601
    # format](https://www.w3.org/TR/NOTE-datetime) (YYYY-MM-DDThh:mm:ss.sTZD).
    @[JSON::Field(key: "EventTimestamp", converter: Core::AWSEpochConverter)]
    property event_timestamp : Time | Nil

    # The unique identifier of the parent operation, if this operation is running within a child
    # context.
    @[JSON::Field(key: "ParentId")]
    property parent_id : String | Nil

    # Details about an execution that started.
    @[JSON::Field(key: "ExecutionStartedDetails")]
    property execution_started_details : ExecutionStartedDetails | Nil

    # Details about an execution that succeeded.
    @[JSON::Field(key: "ExecutionSucceededDetails")]
    property execution_succeeded_details : ExecutionSucceededDetails | Nil

    # Details about an execution that failed.
    @[JSON::Field(key: "ExecutionFailedDetails")]
    property execution_failed_details : ExecutionFailedDetails | Nil

    # Details about an execution that timed out.
    @[JSON::Field(key: "ExecutionTimedOutDetails")]
    property execution_timed_out_details : ExecutionTimedOutDetails | Nil

    # Details about an execution that was stopped.
    @[JSON::Field(key: "ExecutionStoppedDetails")]
    property execution_stopped_details : ExecutionStoppedDetails | Nil

    # Details about a context that started.
    @[JSON::Field(key: "ContextStartedDetails")]
    property context_started_details : ContextStartedDetails | Nil

    # Details about a context that succeeded.
    @[JSON::Field(key: "ContextSucceededDetails")]
    property context_succeeded_details : ContextSucceededDetails | Nil

    # Details about a context that failed.
    @[JSON::Field(key: "ContextFailedDetails")]
    property context_failed_details : ContextFailedDetails | Nil

    # Details about a wait operation that started.
    @[JSON::Field(key: "WaitStartedDetails")]
    property wait_started_details : WaitStartedDetails | Nil

    # Details about a wait operation that succeeded.
    @[JSON::Field(key: "WaitSucceededDetails")]
    property wait_succeeded_details : WaitSucceededDetails | Nil

    # Details about a wait operation that was cancelled.
    @[JSON::Field(key: "WaitCancelledDetails")]
    property wait_cancelled_details : WaitCancelledDetails | Nil

    # Details about a step that started.
    @[JSON::Field(key: "StepStartedDetails")]
    property step_started_details : StepStartedDetails | Nil

    # Details about a step that succeeded.
    @[JSON::Field(key: "StepSucceededDetails")]
    property step_succeeded_details : StepSucceededDetails | Nil

    # Details about a step that failed.
    @[JSON::Field(key: "StepFailedDetails")]
    property step_failed_details : StepFailedDetails | Nil

    @[JSON::Field(key: "ChainedInvokeStartedDetails")]
    property chained_invoke_started_details : ChainedInvokeStartedDetails | Nil

    # Details about a chained invocation that succeeded.
    @[JSON::Field(key: "ChainedInvokeSucceededDetails")]
    property chained_invoke_succeeded_details : ChainedInvokeSucceededDetails | Nil

    @[JSON::Field(key: "ChainedInvokeFailedDetails")]
    property chained_invoke_failed_details : ChainedInvokeFailedDetails | Nil

    # Details about a chained invocation that timed out.
    @[JSON::Field(key: "ChainedInvokeTimedOutDetails")]
    property chained_invoke_timed_out_details : ChainedInvokeTimedOutDetails | Nil

    # Details about a chained invocation that was stopped.
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

    # Details about a function invocation that completed.
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
