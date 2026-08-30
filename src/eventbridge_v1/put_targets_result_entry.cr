private alias Core = Amazonite::Core

module Amazonite::EventBridgeV1
  # Represents a target that failed to be added to a rule.
  class PutTargetsResultEntry
    include JSON::Serializable

    # The ID of the target.
    @[JSON::Field(key: "TargetId")]
    property target_id : String | Nil

    # The error code that indicates why the target addition failed. If the value is
    # `ConcurrentModificationException`, too many requests were made at the same time.
    @[JSON::Field(key: "ErrorCode")]
    property error_code : String | Nil

    # The error message that explains why the target addition failed.
    @[JSON::Field(key: "ErrorMessage")]
    property error_message : String | Nil

    def initialize(
      @target_id : String | Nil = nil,
      @error_code : String | Nil = nil,
      @error_message : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @target_id
        raise Core::ValidationError.new("TargetId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TargetId length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("TargetId does not match the required pattern") unless value.matches?(Regex.new("^[\\.\\-_A-Za-z0-9]+$"))
      end
    end

    def_equals_and_hash(@target_id, @error_code, @error_message)
  end
end
