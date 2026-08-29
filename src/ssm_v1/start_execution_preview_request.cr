module Amazonite::SsmV1
  class StartExecutionPreviewRequest
    include JSON::Serializable

    @[JSON::Field(key: "DocumentName")]
    property document_name : String

    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

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
