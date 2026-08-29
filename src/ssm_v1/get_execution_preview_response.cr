private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class GetExecutionPreviewResponse
    include JSON::Serializable

    # The generated ID for the existing execution preview.
    @[JSON::Field(key: "ExecutionPreviewId")]
    property execution_preview_id : String | Nil

    # A UTC timestamp indicating when the execution preview operation ended.
    @[JSON::Field(key: "EndedAt", converter: Core::AWSEpochConverter)]
    property ended_at : Time | Nil

    # The current status of the execution preview operation.
    @[JSON::Field(key: "Status", converter: AS::ExecutionPreviewStatus)]
    property status : ExecutionPreviewStatus | Nil

    # Supplemental information about the current status of the execution preview.
    @[JSON::Field(key: "StatusMessage")]
    property status_message : String | Nil

    @[JSON::Field(key: "ExecutionPreview")]
    property execution_preview : ExecutionPreview | Nil

    def initialize(
      @execution_preview_id : String | Nil = nil,
      @ended_at : Time | Nil = nil,
      @status : ExecutionPreviewStatus | Nil = nil,
      @status_message : String | Nil = nil,
      @execution_preview : ExecutionPreview | Nil = nil,
    )
    end
  end
end
