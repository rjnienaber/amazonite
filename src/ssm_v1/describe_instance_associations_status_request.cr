module Amazonite::SsmV1
  class DescribeInstanceAssociationsStatusRequest
    include JSON::Serializable

    # The managed node IDs for which you want association status information.
    @[JSON::Field(key: "InstanceId")]
    property instance_id : String

    # The maximum number of items to return for this call. The call also returns a token that you can
    # specify in a subsequent call to get the next set of results.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    # The token for the next set of items to return. (You received this token from a previous call.)
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @instance_id : String,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def_equals_and_hash(@instance_id, @max_results, @next_token)
  end
end
