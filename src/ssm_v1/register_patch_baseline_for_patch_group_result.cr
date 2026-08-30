module Amazonite::SsmV1
  class RegisterPatchBaselineForPatchGroupResult
    include JSON::Serializable

    # The ID of the patch baseline the patch group was registered with.
    @[JSON::Field(key: "BaselineId")]
    property baseline_id : String | Nil

    # The name of the patch group registered with the patch baseline.
    @[JSON::Field(key: "PatchGroup")]
    property patch_group : String | Nil

    def initialize(
      @baseline_id : String | Nil = nil,
      @patch_group : String | Nil = nil,
    )
    end

    def_equals_and_hash(@baseline_id, @patch_group)
  end
end
