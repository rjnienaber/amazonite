private alias AS = Amazonite::Ssm
private alias Core = Amazonite::Core

module Amazonite::Ssm
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

    def validate! : Nil
      if value = @baseline_id
        raise Core::ValidationError.new("BaselineId length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("BaselineId length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("BaselineId does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-:/]{20,128}$"))
      end

      if value = @patch_group
        raise Core::ValidationError.new("PatchGroup length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("PatchGroup length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("PatchGroup does not match the required pattern") unless value.matches?(Regex.new("^([\\p{L}\\p{Z}\\p{N}_.:/=+\\-@]*)$"))
      end
    end

    def_equals_and_hash(@baseline_id, @patch_group, @operating_system)
  end
end
