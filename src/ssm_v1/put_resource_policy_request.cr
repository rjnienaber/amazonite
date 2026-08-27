module Amazonite::SsmV1
  class PutResourcePolicyRequest
    include JSON::Serializable

    @[JSON::Field(key: "ResourceArn")]
    property resource_arn : String

    @[JSON::Field(key: "Policy")]
    property policy : String

    @[JSON::Field(key: "PolicyId")]
    property policy_id : String | Nil

    @[JSON::Field(key: "PolicyHash")]
    property policy_hash : String | Nil

    def initialize(
      @resource_arn : String,
      @policy : String,
      @policy_id : String | Nil = nil,
      @policy_hash : String | Nil = nil,
    )
    end
  end
end
