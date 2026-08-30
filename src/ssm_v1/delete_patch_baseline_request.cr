module Amazonite::SsmV1
  class DeletePatchBaselineRequest
    include JSON::Serializable

    # The ID of the patch baseline to delete.
    @[JSON::Field(key: "BaselineId")]
    property baseline_id : String

    def initialize(
      @baseline_id : String,
    )
    end

    def_equals_and_hash(@baseline_id)
  end
end
