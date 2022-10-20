module Amazonite::DynamoDBv2
  class TagResourceInput
    include JSON::Serializable

    @[JSON::Field(key: "ResourceArn")]
    property resource_arn : String

    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag)

    def initialize(
      @resource_arn : String,
      @tags : Array(Tag)
    )
    end
  end
end