module Amazonite::DynamoDBV2
  class UntagResourceInput
    include JSON::Serializable

    # The DynamoDB resource that the tags will be removed from. This value is an Amazon Resource Name
    # (ARN).
    @[JSON::Field(key: "ResourceArn")]
    property resource_arn : String

    # A list of tag keys. Existing tags of the resource whose keys are members of this list will be
    # removed from the DynamoDB resource.
    @[JSON::Field(key: "TagKeys")]
    property tag_keys : Array(String) = [] of String

    def initialize(
      @resource_arn : String,
      @tag_keys : Array(String),
    )
    end

    def_equals_and_hash(@resource_arn, @tag_keys)
  end
end
