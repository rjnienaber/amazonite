private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  class PublishVersionRequest
    include JSON::Serializable

    @[JSON::Field(key: "FunctionName", ignore: true)]
    property function_name : String = ""

    @[JSON::Field(key: "CodeSha256")]
    property code_sha_256 : String | Nil

    @[JSON::Field(key: "Description")]
    property description : String | Nil

    @[JSON::Field(key: "RevisionId")]
    property revision_id : String | Nil

    @[JSON::Field(key: "PublishTo", converter: AL::FunctionVersionLatestPublished)]
    property publish_to : FunctionVersionLatestPublished | Nil

    def initialize(
      @function_name : String,
      @code_sha_256 : String | Nil = nil,
      @description : String | Nil = nil,
      @revision_id : String | Nil = nil,
      @publish_to : FunctionVersionLatestPublished | Nil = nil,
    )
    end
  end
end
