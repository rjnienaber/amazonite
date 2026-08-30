private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class DescribeInstancePatchStatesRequest
    include JSON::Serializable

    # The ID of the managed node for which patch state information should be retrieved.
    @[JSON::Field(key: "InstanceIds")]
    property instance_ids : Array(String) = [] of String

    # The token for the next set of items to return. (You received this token from a previous call.)
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # The maximum number of managed nodes to return (per page).
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    def initialize(
      @instance_ids : Array(String),
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @instance_ids
        raise Core::ValidationError.new("InstanceIds must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("InstanceIds must have at most 50 item(s)") if value.size > 50
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 10") if value < 10
        raise Core::ValidationError.new("MaxResults value must be <= 100") if value > 100
      end
    end

    def_equals_and_hash(@instance_ids, @next_token, @max_results)
  end
end
