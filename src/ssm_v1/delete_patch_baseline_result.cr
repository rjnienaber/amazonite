module Amazonite::SsmV1
  class DeletePatchBaselineResult
    include JSON::Serializable

    # The ID of the deleted patch baseline.
    @[JSON::Field(key: "BaselineId")]
    property baseline_id : String | Nil

    def initialize(
      @baseline_id : String | Nil = nil,
    )
    end
  end
end
