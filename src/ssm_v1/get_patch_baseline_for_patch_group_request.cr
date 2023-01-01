private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class GetPatchBaselineForPatchGroupRequest
    include JSON::Serializable

    @[JSON::Field(key: "PatchGroup")]
    property patch_group : String

    @[JSON::Field(key: "OperatingSystem", converter: AS::OperatingSystem)]
    property operating_system : OperatingSystem | Nil

    def initialize(
      @patch_group : String,
      @operating_system : OperatingSystem | Nil = nil
    )
    end
  end
end
