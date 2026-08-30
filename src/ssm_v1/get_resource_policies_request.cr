module Amazonite::SsmV1
  class GetResourcePoliciesRequest
    include JSON::Serializable

    # Amazon Resource Name (ARN) of the resource to which the policies are attached.
    @[JSON::Field(key: "ResourceArn")]
    property resource_arn : String

    # A token to start the list. Use this token to get the next set of results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # The maximum number of items to return for this call. The call also returns a token that you can
    # specify in a subsequent call to get the next set of results.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    def initialize(
      @resource_arn : String,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
    )
    end

    def_equals_and_hash(@resource_arn, @next_token, @max_results)
  end
end
