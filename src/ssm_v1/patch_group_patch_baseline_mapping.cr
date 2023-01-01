module Amazonite::SsmV1
  class PatchGroupPatchBaselineMapping
    include JSON::Serializable

    @[JSON::Field(key: "PatchGroup")]
    property patch_group : String | Nil

    @[JSON::Field(key: "BaselineIdentity")]
    property baseline_identity : PatchBaselineIdentity | Nil

    def initialize(
      @patch_group : String | Nil = nil,
      @baseline_identity : PatchBaselineIdentity | Nil = nil
    )
    end
  end
end
