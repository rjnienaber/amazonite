private alias Core = Amazonite::Core

module Amazonite::Ssm
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

    def validate! : Nil
      if value = @patch_group
        raise Core::ValidationError.new("PatchGroup length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("PatchGroup length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("PatchGroup does not match the required pattern") unless value.matches?(Regex.new("^([\\p{L}\\p{Z}\\p{N}_.:/=+\\-@]*)$"))
      end

      if value = @baseline_identity
        value.validate!
      end
    end

    def_equals_and_hash(@patch_group, @baseline_identity)
  end
end
