module Amazonite::DynamoDBv2
  class UntagResourceInput
    include JSON::Serializable

    @[JSON::Field(key: "ResourceArn")]
    property resource_arn : String

    @[JSON::Field(key: "TagKeys")]
    property tag_keys : Array(String)

    def initialize(
      @resource_arn : String,
      @tag_keys : Array(String)
    )
    end
  end
end