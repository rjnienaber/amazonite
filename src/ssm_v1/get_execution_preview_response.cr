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

    def validate! : Nil
      if value = @execution_preview_id
        raise Core::ValidationError.new("ExecutionPreviewId length must be >= 36") if value.size < 36
        raise Core::ValidationError.new("ExecutionPreviewId length must be <= 36") if value.size > 36
        raise Core::ValidationError.new("ExecutionPreviewId does not match the required pattern") unless value.matches?(Regex.new("^[a-fA-F0-9]{8}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{12}$"))
      end

      if value = @execution_preview
        value.validate!
      end
    end

    def_equals_and_hash(@execution_preview_id, @ended_at, @status, @status_message, @execution_preview)
  end
end
