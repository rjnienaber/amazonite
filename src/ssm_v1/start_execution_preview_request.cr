private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @document_name
        raise Core::ValidationError.new("DocumentName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-.]{3,128}$"))
      end

      if value = @document_version
        raise Core::ValidationError.new("DocumentVersion does not match the required pattern") unless value.matches?(Regex.new("^([$]LATEST|[$]DEFAULT|^[1-9][0-9]*$)$"))
      end

      if value = @execution_inputs
        value.validate!
      end
    end

    def_equals_and_hash(@document_name, @document_version, @execution_inputs)
  end
end
