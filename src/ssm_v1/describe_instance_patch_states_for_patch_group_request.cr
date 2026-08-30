private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @patch_group
        raise Core::ValidationError.new("PatchGroup length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("PatchGroup length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("PatchGroup does not match the required pattern") unless value.matches?(Regex.new("^([\\p{L}\\p{Z}\\p{N}_.:/=+\\-@]*)$"))
      end

      if value = @filters
        raise Core::ValidationError.new("Filters must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Filters must have at most 4 item(s)") if value.size > 4
        value.each(&.validate!)
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 10") if value < 10
        raise Core::ValidationError.new("MaxResults value must be <= 100") if value > 100
      end
    end

    def_equals_and_hash(@patch_group, @filters, @next_token, @max_results)
  end
end
