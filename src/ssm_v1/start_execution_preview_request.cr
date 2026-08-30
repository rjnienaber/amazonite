module Amazonite::SsmV1
  class StartExecutionPreviewRequest
    include JSON::Serializable

    # The name of the Automation runbook to run. The result of the execution preview indicates what
    # the impact would be of running this runbook.
    @[JSON::Field(key: "DocumentName")]
    property document_name : String

    # The version of the Automation runbook to run. The default value is `$DEFAULT`.
    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    # Information about the inputs that can be specified for the preview operation.
    @[JSON::Field(key: "ExecutionInputs")]
    property execution_inputs : ExecutionInputs | Nil

    def initialize(
      @document_name : String,
      @document_version : String | Nil = nil,
      @execution_inputs : ExecutionInputs | Nil = nil,
    )
    end
  end
end
