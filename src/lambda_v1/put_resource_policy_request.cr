module Amazonite::LambdaV1
  class PutResourcePolicyRequest
    include JSON::Serializable

    @[JSON::Field(key: "ResourceArn", ignore: true)]
    property resource_arn : String = ""

    @[JSON::Field(key: "Policy")]
    property policy : String

    @[JSON::Field(key: "RevisionId")]
    property revision_id : String | Nil

    def initialize(
      @resource_arn : String,
      @policy : String,
      @revision_id : String | Nil = nil,
    )
    end
  end
end
