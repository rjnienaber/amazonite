private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class GetPatchBaselineForPatchGroupResult
    include JSON::Serializable

    # The ID of the patch baseline that should be used for the patch group.
    @[JSON::Field(key: "BaselineId")]
    property baseline_id : String | Nil

    # The name of the patch group.
    @[JSON::Field(key: "PatchGroup")]
    property patch_group : String | Nil

    # The operating system rule specified for patch groups using the patch baseline.
    @[JSON::Field(key: "OperatingSystem", converter: AS::OperatingSystem)]
    property operating_system : OperatingSystem | Nil

    def initialize(
      @baseline_id : String | Nil = nil,
      @patch_group : String | Nil = nil,
      @operating_system : OperatingSystem | Nil = nil,
    )
    end
  end
end
