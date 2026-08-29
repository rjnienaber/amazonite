private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class GetExecutionPreviewResponse
    include JSON::Serializable

    @[JSON::Field(key: "ExecutionPreviewId")]
    property execution_preview_id : String | Nil

    @[JSON::Field(key: "EndedAt", converter: Core::AWSEpochConverter)]
    property ended_at : Time | Nil

    @[JSON::Field(key: "Status", converter: AS::ExecutionPreviewStatus)]
    property status : ExecutionPreviewStatus | Nil

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
