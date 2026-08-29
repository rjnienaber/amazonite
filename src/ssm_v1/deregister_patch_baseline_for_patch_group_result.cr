module Amazonite::SsmV1
  class DeregisterPatchBaselineForPatchGroupResult
    include JSON::Serializable

    # The ID of the patch baseline the patch group was deregistered from.
    @[JSON::Field(key: "BaselineId")]
    property baseline_id : String | Nil

    # The name of the patch group deregistered from the patch baseline.
    @[JSON::Field(key: "PatchGroup")]
    property patch_group : String | Nil

    def initialize(
      @baseline_id : String | Nil = nil,
      @patch_group : String | Nil = nil,
    )
    end
  end
end
