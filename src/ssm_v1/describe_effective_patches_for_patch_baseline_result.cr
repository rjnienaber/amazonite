module Amazonite::SsmV1
  class DescribeEffectivePatchesForPatchBaselineResult
    include JSON::Serializable

    @[JSON::Field(key: "EffectivePatches")]
    property effective_patches : Array(EffectivePatch) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @effective_patches : Array(EffectivePatch) | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
