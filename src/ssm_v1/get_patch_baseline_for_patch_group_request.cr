private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class GetPatchBaselineForPatchGroupRequest
    include JSON::Serializable

    # The name of the patch group whose patch baseline should be retrieved.
    @[JSON::Field(key: "PatchGroup")]
    property patch_group : String

    # Returns the operating system rule specified for patch groups using the patch baseline. The
    # default value is `WINDOWS`.
    @[JSON::Field(key: "OperatingSystem", converter: AS::OperatingSystem)]
    property operating_system : OperatingSystem | Nil

    def initialize(
      @patch_group : String,
      @operating_system : OperatingSystem | Nil = nil,
    )
    end

    def_equals_and_hash(@patch_group, @operating_system)
  end
end
