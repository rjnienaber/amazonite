module Amazonite::DynamoDBV2
  class ListTagsOfResourceInput
    include JSON::Serializable

    # The Amazon DynamoDB resource with tags to be listed. This value is an Amazon Resource Name
    # (ARN).
    @[JSON::Field(key: "ResourceArn")]
    property resource_arn : String

    # An optional string that, if supplied, must be copied from the output of a previous call to
    # ListTagOfResource. When provided in this manner, this API fetches the next page of results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @resource_arn : String,
      @next_token : String | Nil = nil,
    )
    end

    def_equals_and_hash(@resource_arn, @next_token)
  end
end
