module Amazonite::SsmV1
  class GetExecutionPreviewRequest
    include JSON::Serializable

    @[JSON::Field(key: "ExecutionPreviewId")]
    property execution_preview_id : String

    def initialize(
      @execution_preview_id : String,
    )
    end
  end
end
