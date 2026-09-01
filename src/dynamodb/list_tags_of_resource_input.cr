private alias Core = Amazonite::Core

module Amazonite::DynamoDB
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

    def validate! : Nil
      if value = @resource_arn
        raise Core::ValidationError.new("ResourceArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ResourceArn length must be <= 1283") if value.size > 1283
      end
    end

    def_equals_and_hash(@resource_arn, @next_token)
  end
end
