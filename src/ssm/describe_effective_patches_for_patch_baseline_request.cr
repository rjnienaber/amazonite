private alias Core = Amazonite::Core

module Amazonite::Ssm
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

    def validate! : Nil
      if value = @baseline_id
        raise Core::ValidationError.new("BaselineId length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("BaselineId length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("BaselineId does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-:/]{20,128}$"))
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxResults value must be <= 100") if value > 100
      end
    end

    def_equals_and_hash(@baseline_id, @max_results, @next_token)
  end
end
