module Amazonite::SsmV1
  class DescribeInstancePatchStatesForPatchGroupRequest
    include JSON::Serializable

    # The name of the patch group for which the patch state information should be retrieved.
    @[JSON::Field(key: "PatchGroup")]
    property patch_group : String

    # Each entry in the array is a structure containing:
    #
    # - Key (string between 1 and 200 characters)
    #
    # - Values (array containing a single string)
    #
    # - Type (string "Equal", "NotEqual", "LessThan", "GreaterThan")
    @[JSON::Field(key: "Filters")]
    property filters : Array(InstancePatchStateFilter) | Nil

    # The token for the next set of items to return. (You received this token from a previous call.)
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # The maximum number of patches to return (per page).
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    def initialize(
      @patch_group : String,
      @filters : Array(InstancePatchStateFilter) | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
    )
    end
  end
end
