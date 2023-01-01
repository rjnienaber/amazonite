private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class GetPatchBaselineForPatchGroupResult
    include JSON::Serializable

    @[JSON::Field(key: "BaselineId")]
    property baseline_id : String | Nil

    @[JSON::Field(key: "PatchGroup")]
    property patch_group : String | Nil

    @[JSON::Field(key: "OperatingSystem", converter: AS::OperatingSystem)]
    property operating_system : OperatingSystem | Nil

    def initialize(
      @baseline_id : String | Nil = nil,
      @patch_group : String | Nil = nil,
      @operating_system : OperatingSystem | Nil = nil
    )
    end
  end
end
