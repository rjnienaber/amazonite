module Amazonite::LambdaV1
  class DeleteResourcePolicyRequest
    include JSON::Serializable

    @[JSON::Field(key: "ResourceArn", ignore: true)]
    property resource_arn : String = ""

    @[JSON::Field(key: "RevisionId", ignore: true)]
    property revision_id : String | Nil

    def initialize(
      @resource_arn : String,
      @revision_id : String | Nil = nil,
    )
    end
  end
end
