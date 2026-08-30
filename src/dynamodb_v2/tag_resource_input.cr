module Amazonite::DynamoDBV2
  class TagResourceInput
    include JSON::Serializable

    # Identifies the Amazon DynamoDB resource to which tags should be added. This value is an Amazon
    # Resource Name (ARN).
    @[JSON::Field(key: "ResourceArn")]
    property resource_arn : String

    # The tags to be assigned to the Amazon DynamoDB resource.
    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) = [] of Tag

    def initialize(
      @resource_arn : String,
      @tags : Array(Tag),
    )
    end
  end
end
