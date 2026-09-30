private alias AS = Amazonite::Ssm
private alias Core = Amazonite::Core

module Amazonite::Ssm
  class SendAutomationSignalRequest
    include JSON::Serializable

    # The unique identifier for an existing Automation execution that you want to send the signal to.
    @[JSON::Field(key: "AutomationExecutionId")]
    property automation_execution_id : String

    # The type of signal to send to an Automation execution.
    @[JSON::Field(key: "SignalType", converter: AS::SignalType)]
    property signal_type : SignalType

    # The data sent with the signal. The data schema depends on the type of signal used in the
    # request.
    #
    # For `Approve` and `Reject` signal types, the payload is an optional comment that you can send
    # with the signal type. For example:
    #
    # `Comment="Looks good"`
    #
    # For `StartStep` and `Resume` signal types, you must send the name of the Automation step to
    # start or resume as the payload. For example:
    #
    # `StepName="step1"`
    #
    # For the `StopStep` signal type, you must send the step execution ID as the payload. For example:
    #
    # `StepExecutionId="97fff367-fc5a-4299-aed8-0123456789ab"`
    @[JSON::Field(key: "Payload")]
    property payload : Hash(String, Array(String)) | Nil

    def initialize(
      @automation_execution_id : String,
      @signal_type : SignalType,
      @payload : Hash(String, Array(String)) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @automation_execution_id
        raise Core::ValidationError.new("AutomationExecutionId length must be >= 36") if value.size < 36
        raise Core::ValidationError.new("AutomationExecutionId length must be <= 36") if value.size > 36
      end

      if value = @payload
        raise Core::ValidationError.new("Payload must have at least 1 entry(s)") if value.size < 1
        raise Core::ValidationError.new("Payload must have at most 200 entry(s)") if value.size > 200
      end
    end

    def_equals_and_hash(@automation_execution_id, @signal_type, @payload)
  end
end
