private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class SendAutomationSignalRequest
    include JSON::Serializable

    @[JSON::Field(key: "AutomationExecutionId")]
    property automation_execution_id : String

    @[JSON::Field(key: "SignalType", converter: AS::SignalType)]
    property signal_type : SignalType

    @[JSON::Field(key: "Payload")]
    property payload : Hash(String, Array(String)) | Nil

    def initialize(
      @automation_execution_id : String,
      @signal_type : SignalType,
      @payload : Hash(String, Array(String)) | Nil = nil
    )
    end
  end
end
