private alias Core = Amazonite::Core

module Amazonite::Ssm
  class DescribePatchBaselinesRequest
    include JSON::Serializable

    # Each element in the array is a structure containing a key-value pair.
    #
    # Supported keys for `DescribePatchBaselines` include the following:
    #
    # - ** `NAME_PREFIX` **
    #
    # Sample values: `AWS-` | `My-`
    #
    # - ** `OWNER` **
    #
    # Sample values: `AWS` | `Self`
    #
    # - ** `OPERATING_SYSTEM` **
    #
    # Sample values: `AMAZON_LINUX` | `SUSE` | `WINDOWS`
    @[JSON::Field(key: "Filters")]
    property filters : Array(PatchOrchestratorFilter) | Nil

    # The maximum number of patch baselines to return (per page).
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    # The token for the next set of items to return. (You received this token from a previous call.)
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @filters : Array(PatchOrchestratorFilter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @filters
        raise Core::ValidationError.new("Filters must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Filters must have at most 5 item(s)") if value.size > 5
        value.each(&.validate!)
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxResults value must be <= 100") if value > 100
      end
    end

    def_equals_and_hash(@filters, @max_results, @next_token)
  end
end
