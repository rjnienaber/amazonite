module Amazonite::SsmV1
  class GetExecutionPreviewRequest
    include JSON::Serializable

    # The ID of the existing execution preview.
    @[JSON::Field(key: "ExecutionPreviewId")]
    property execution_preview_id : String

    def initialize(
      @execution_preview_id : String,
    )
    end
  end
end
