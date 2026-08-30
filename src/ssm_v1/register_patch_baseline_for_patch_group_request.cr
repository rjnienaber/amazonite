module Amazonite::SsmV1
  class RegisterPatchBaselineForPatchGroupRequest
    include JSON::Serializable

    # The ID of the patch baseline to register with the patch group.
    @[JSON::Field(key: "BaselineId")]
    property baseline_id : String

    # The name of the patch group to be registered with the patch baseline.
    @[JSON::Field(key: "PatchGroup")]
    property patch_group : String

    def initialize(
      @baseline_id : String,
      @patch_group : String,
    )
    end

    def_equals_and_hash(@baseline_id, @patch_group)
  end
end
