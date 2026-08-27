module Amazonite::DynamoDBV2
  class PutResourcePolicyInput
    include JSON::Serializable

    @[JSON::Field(key: "ResourceArn")]
    property resource_arn : String

    @[JSON::Field(key: "Policy")]
    property policy : String

    @[JSON::Field(key: "ExpectedRevisionId")]
    property expected_revision_id : String | Nil

    @[JSON::Field(key: "ConfirmRemoveSelfResourceAccess")]
    property confirm_remove_self_resource_access : Bool | Nil

    def initialize(
      @resource_arn : String,
      @policy : String,
      @expected_revision_id : String | Nil = nil,
      @confirm_remove_self_resource_access : Bool | Nil = nil,
    )
    end
  end
end
