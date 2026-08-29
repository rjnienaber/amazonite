module Amazonite::SsmV1
  class DescribeEffectiveInstanceAssociationsRequest
    include JSON::Serializable

    # The managed node ID for which you want to view all associations.
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
  end
end
