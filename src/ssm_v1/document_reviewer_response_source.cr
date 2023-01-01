private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class DocumentReviewerResponseSource
    include JSON::Serializable

    @[JSON::Field(key: "CreateTime", converter: Core::AWSEpochConverter)]
    property create_time : Time | Nil

    @[JSON::Field(key: "UpdatedTime", converter: Core::AWSEpochConverter)]
    property updated_time : Time | Nil

    @[JSON::Field(key: "ReviewStatus", converter: AS::ReviewStatus)]
    property review_status : ReviewStatus | Nil

    @[JSON::Field(key: "Comment")]
    property comment : Array(DocumentReviewCommentSource) | Nil

    @[JSON::Field(key: "Reviewer")]
    property reviewer : String | Nil

    def initialize(
      @create_time : Time | Nil = nil,
      @updated_time : Time | Nil = nil,
      @review_status : ReviewStatus | Nil = nil,
      @comment : Array(DocumentReviewCommentSource) | Nil = nil,
      @reviewer : String | Nil = nil
    )
    end
  end
end
