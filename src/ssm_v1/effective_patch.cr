module Amazonite::SsmV1
  class EffectivePatch
    include JSON::Serializable

    @[JSON::Field(key: "Patch")]
    property patch : Patch | Nil

    @[JSON::Field(key: "PatchStatus")]
    property patch_status : PatchStatus | Nil

    def initialize(
      @patch : Patch | Nil = nil,
      @patch_status : PatchStatus | Nil = nil
    )
    end
  end
end
