module Amazonite::DynamoDBV2
  class DeleteResourcePolicyInput
    include JSON::Serializable

    @[JSON::Field(key: "ResourceArn")]
    property resource_arn : String

    @[JSON::Field(key: "ExpectedRevisionId")]
    property expected_revision_id : String | Nil

    def initialize(
      @resource_arn : String,
      @expected_revision_id : String | Nil = nil,
    )
    end
  end
end
