module Amazonite::SsmV1
  # The `EffectivePatch` structure defines metadata about a patch along with the approval state of
  # the patch in a particular patch baseline. The approval state includes information about whether
  # the patch is currently approved, due to be approved by a rule, explicitly approved, or
  # explicitly rejected and the date the patch was or will be approved.
  class EffectivePatch
    include JSON::Serializable

    # Provides metadata for a patch, including information such as the KB ID, severity, classification
    # and a URL for where more information can be obtained about the patch.
    @[JSON::Field(key: "Patch")]
    property patch : Patch | Nil

    # The status of the patch in a patch baseline. This includes information about whether the patch
    # is currently approved, due to be approved by a rule, explicitly approved, or explicitly rejected
    # and the date the patch was or will be approved.
    @[JSON::Field(key: "PatchStatus")]
    property patch_status : PatchStatus | Nil

    def initialize(
      @patch : Patch | Nil = nil,
      @patch_status : PatchStatus | Nil = nil,
    )
    end
  end
end
