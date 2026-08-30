module Amazonite::SsmV1
  class DescribeEffectivePatchesForPatchBaselineResult
    include JSON::Serializable

    # An array of patches and patch status.
    @[JSON::Field(key: "EffectivePatches")]
    property effective_patches : Array(EffectivePatch) | Nil

    # The token to use when requesting the next set of items. If there are no additional items to
    # return, the string is empty.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @effective_patches : Array(EffectivePatch) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def_equals_and_hash(@effective_patches, @next_token)
  end
end
