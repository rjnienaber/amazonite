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

    def_equals_and_hash(@instance_ids, @next_token, @max_results)
  end
end
