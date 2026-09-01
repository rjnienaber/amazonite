private alias Core = Amazonite::Core

module Amazonite::Ssm
  class GetExecutionPreviewRequest
    include JSON::Serializable

    # The ID of the existing execution preview.
    @[JSON::Field(key: "ExecutionPreviewId")]
    property execution_preview_id : String

    def initialize(
      @execution_preview_id : String,
    )
    end

    def validate! : Nil
      if value = @execution_preview_id
        raise Core::ValidationError.new("ExecutionPreviewId length must be >= 36") if value.size < 36
        raise Core::ValidationError.new("ExecutionPreviewId length must be <= 36") if value.size > 36
        raise Core::ValidationError.new("ExecutionPreviewId does not match the required pattern") unless value.matches?(Regex.new("^[a-fA-F0-9]{8}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{12}$"))
      end
    end

    def_equals_and_hash(@execution_preview_id)
  end
end
