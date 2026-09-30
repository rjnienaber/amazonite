private alias Core = Amazonite::Core

module Amazonite::Ssm
  class DescribePatchGroupsResult
    include JSON::Serializable

    # Each entry in the array contains:
    #
    # - `PatchGroup`: string (between 1 and 256 characters. Regex: `^([\p{L}\p{Z}\p{N}_.:/=+\-@]*)$)`
    #
    # - `PatchBaselineIdentity`: A `PatchBaselineIdentity` element.
    @[JSON::Field(key: "Mappings")]
    property mappings : Array(PatchGroupPatchBaselineMapping) | Nil

    # The token to use when requesting the next set of items. If there are no additional items to
    # return, the string is empty.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @mappings : Array(PatchGroupPatchBaselineMapping) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @mappings
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@mappings, @next_token)
  end
end
