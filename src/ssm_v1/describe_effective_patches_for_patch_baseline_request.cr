module Amazonite::SsmV1
  class DescribeEffectivePatchesForPatchBaselineRequest
    include JSON::Serializable

    # The ID of the patch baseline to retrieve the effective patches for.
    @[JSON::Field(key: "BaselineId")]
    property baseline_id : String

    # The maximum number of patches to return (per page).
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    # The token for the next set of items to return. (You received this token from a previous call.)
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @baseline_id : String,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
