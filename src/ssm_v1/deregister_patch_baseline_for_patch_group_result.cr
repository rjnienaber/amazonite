module Amazonite::SsmV1
  class DeregisterPatchBaselineForPatchGroupResult
    include JSON::Serializable

    @[JSON::Field(key: "BaselineId")]
    property baseline_id : String | Nil

    @[JSON::Field(key: "PatchGroup")]
    property patch_group : String | Nil

    def initialize(
      @baseline_id : String | Nil = nil,
      @patch_group : String | Nil = nil
    )
    end
  end
end
