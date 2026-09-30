private alias Core = Amazonite::Core

module Amazonite::Ssm
  class DescribePatchGroupStateRequest
    include JSON::Serializable

    # The name of the patch group whose patch snapshot should be retrieved.
    @[JSON::Field(key: "PatchGroup")]
    property patch_group : String

    def initialize(
      @patch_group : String,
    )
    end

    def validate! : Nil
      if value = @patch_group
        raise Core::ValidationError.new("PatchGroup length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("PatchGroup length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("PatchGroup does not match the required pattern") unless value.matches?(Regex.new("^([\\p{L}\\p{Z}\\p{N}_.:/=+\\-@]*)$"))
      end
    end

    def_equals_and_hash(@patch_group)
  end
end
