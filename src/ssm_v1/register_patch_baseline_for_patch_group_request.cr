module Amazonite::SsmV1
  class RegisterPatchBaselineForPatchGroupRequest
    include JSON::Serializable

    @[JSON::Field(key: "BaselineId")]
    property baseline_id : String

    @[JSON::Field(key: "PatchGroup")]
    property patch_group : String

    def initialize(
      @baseline_id : String,
      @patch_group : String
    )
    end
  end
end
