module Amazonite::SsmV1
  # The mapping between a patch group and the patch baseline the patch group is registered with.
  class PatchGroupPatchBaselineMapping
    include JSON::Serializable

    # The name of the patch group registered with the patch baseline.
    @[JSON::Field(key: "PatchGroup")]
    property patch_group : String | Nil

    # The patch baseline the patch group is registered with.
    @[JSON::Field(key: "BaselineIdentity")]
    property baseline_identity : PatchBaselineIdentity | Nil

    def initialize(
      @patch_group : String | Nil = nil,
      @baseline_identity : PatchBaselineIdentity | Nil = nil,
    )
    end

    def_equals_and_hash(@patch_group, @baseline_identity)
  end
end
