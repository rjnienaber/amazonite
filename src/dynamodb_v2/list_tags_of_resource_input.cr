module Amazonite::DynamoDBV2
  class ListTagsOfResourceInput
    include JSON::Serializable

    @[JSON::Field(key: "ResourceArn")]
    property resource_arn : String

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @resource_arn : String,
      @next_token : String | Nil = nil
    )
    end
  end
end
