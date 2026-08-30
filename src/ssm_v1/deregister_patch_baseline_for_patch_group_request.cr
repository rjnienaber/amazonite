module Amazonite::SsmV1
  class DeregisterPatchBaselineForPatchGroupRequest
    include JSON::Serializable

    # The ID of the patch baseline to deregister the patch group from.
    @[JSON::Field(key: "BaselineId")]
    property baseline_id : String

    # The name of the patch group that should be deregistered from the patch baseline.
    @[JSON::Field(key: "PatchGroup")]
    property patch_group : String

    def initialize(
      @baseline_id : String,
      @patch_group : String,
    )
    end
  end
end
