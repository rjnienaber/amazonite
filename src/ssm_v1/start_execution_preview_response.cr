module Amazonite::SsmV1
  class StartExecutionPreviewResponse
    include JSON::Serializable

    @[JSON::Field(key: "ExecutionPreviewId")]
    property execution_preview_id : String | Nil

    def initialize(
      @execution_preview_id : String | Nil = nil,
    )
    end
  end
end
