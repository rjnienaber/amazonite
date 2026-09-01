private alias Core = Amazonite::Core

module Amazonite::Ssm
  class DeletePatchBaselineResult
    include JSON::Serializable

    # The ID of the deleted patch baseline.
    @[JSON::Field(key: "BaselineId")]
    property baseline_id : String | Nil

    def initialize(
      @baseline_id : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @baseline_id
        raise Core::ValidationError.new("BaselineId length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("BaselineId length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("BaselineId does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-:/]{20,128}$"))
      end
    end

    def_equals_and_hash(@baseline_id)
  end
end
