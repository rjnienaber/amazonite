module Amazonite::SsmV1
  class DeleteResourcePolicyRequest
    include JSON::Serializable

    @[JSON::Field(key: "ResourceArn")]
    property resource_arn : String

    @[JSON::Field(key: "PolicyId")]
    property policy_id : String

    @[JSON::Field(key: "PolicyHash")]
    property policy_hash : String

    def initialize(
      @resource_arn : String,
      @policy_id : String,
      @policy_hash : String,
    )
    end
  end
end
